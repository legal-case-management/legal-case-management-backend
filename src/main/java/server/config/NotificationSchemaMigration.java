package server.config;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Dọn dẹp các ràng buộc cũ trên bảng `notifications` mà Hibernate ddl-auto=update KHÔNG tự xóa:
 *
 *  1. CHECK constraint trên cột notification_type sinh ra từ enum cũ (chỉ gồm 3 giá trị
 *     LEGAL_CASE_CASE_ASSIGNED / LEGAL_CASE_UPCOMING_DEADLINE / LEGAL_CASE_OVERDUE).
 *     Constraint này khiến mọi INSERT thông báo với enum mới (CASE_CREATED, CASE_ASSIGNED, ...)
 *     bị từ chối.
 *  2. FOREIGN KEY cũ legal_case_id -> legal_cases (trước đây legalCaseId là khóa ngoại,
 *     nay được lưu dạng chuỗi để thông báo vẫn còn sau khi án bị xóa).
 *
 * Thực thi idempotent: chạy nhiều lần và trên DB mới đều an toàn (chỉ DROP nếu tồn tại).
 * Chỉ áp dụng cho PostgreSQL.
 */
@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class NotificationSchemaMigration implements ApplicationRunner {

    DataSource dataSource;

    @Override
    public void run(ApplicationArguments args) {
        try (Connection connection = dataSource.getConnection()) {
            if (!isPostgres(connection) || !tableExists(connection)) {
                return;
            }
            dropStaleCheckConstraints(connection);
            dropStaleForeignKeys(connection);
        } catch (Exception e) {
            log.warn("Không thể dọn dẹp ràng buộc cũ của bảng notifications: {}", e.getMessage());
        }
    }

    private boolean isPostgres(Connection connection) throws Exception {
        String product = connection.getMetaData().getDatabaseProductName();
        return product != null && product.toLowerCase().contains("postgresql");
    }

    private boolean tableExists(Connection connection) throws Exception {
        try (ResultSet rs = connection.getMetaData().getTables(null, null, "notifications", null)) {
            return rs.next();
        }
    }

    /** Xóa mọi CHECK constraint đang ràng buộc cột notification_type. */
    private void dropStaleCheckConstraints(Connection connection) throws Exception {
        String findSql = """
                SELECT con.conname
                FROM pg_constraint con
                JOIN pg_class rel ON rel.oid = con.conrelid
                JOIN pg_attribute att ON att.attrelid = con.conrelid AND att.attnum = ANY (con.conkey)
                WHERE rel.relname = 'notifications'
                  AND con.contype = 'c'
                  AND att.attname = 'notification_type'
                """;
        dropConstraints(connection, findSql, "CHECK");
    }

    /** Xóa khóa ngoại cũ trên cột legal_case_id (nếu còn). */
    private void dropStaleForeignKeys(Connection connection) throws Exception {
        String findSql = """
                SELECT con.conname
                FROM pg_constraint con
                JOIN pg_class rel ON rel.oid = con.conrelid
                JOIN pg_attribute att ON att.attrelid = con.conrelid AND att.attnum = ANY (con.conkey)
                WHERE rel.relname = 'notifications'
                  AND con.contype = 'f'
                  AND att.attname = 'legal_case_id'
                """;
        dropConstraints(connection, findSql, "FOREIGN KEY");
    }

    private void dropConstraints(Connection connection, String findSql, String label) throws Exception {
        List<String> names = new ArrayList<>();
        try (Statement st = connection.createStatement();
             ResultSet rs = st.executeQuery(findSql)) {
            while (rs.next()) {
                names.add(rs.getString(1));
            }
        }
        for (String name : names) {
            try (Statement st = connection.createStatement()) {
                st.executeUpdate("ALTER TABLE notifications DROP CONSTRAINT IF EXISTS \"" + name + "\"");
                log.info("Đã xóa ràng buộc {} cũ trên bảng notifications: {}", label, name);
            }
        }
    }
}
