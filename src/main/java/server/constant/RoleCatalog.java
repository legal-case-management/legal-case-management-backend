package server.constant;

import java.util.List;
import java.util.Set;

import static server.constant.PermissionCatalog.*;

/**
 * Danh mục Role mặc định và tập quyền tương ứng, dùng để seed khi khởi động.
 *
 * Nguyên tắc map (giữ đúng hành vi {@code @PreAuthorize} cũ):
 * - ADMIN: toàn bộ quyền ({@link PermissionCatalog#ALL}).
 * - MANAGER: các quyền mà endpoint cũ cho {@code hasAnyRole('ADMIN','MANAGER')} + menu tương ứng.
 * - JUDGE / MEDIATOR: chỉ xem (trang chủ, quản lý án, thông báo).
 */
public final class RoleCatalog {
    private RoleCatalog() {
    }

    public static final String ADMIN = "ADMIN";
    public static final String MANAGER = "MANAGER";
    public static final String JUDGE = "JUDGE";
    public static final String MEDIATOR = "MEDIATOR";

    public record DefaultRole(String roleId, String name, String description, Set<String> permissionIds) {
    }

    /** ADMIN: tất cả permission. */
    private static final Set<String> ADMIN_PERMISSIONS = ALL.keySet();

    /**
     * MANAGER: tập quyền tương ứng các method cũ gắn {@code hasAnyRole('ADMIN','MANAGER')}
     * (create/import/search/assign...) cộng các quyền xem menu cần thiết.
     */
    private static final Set<String> MANAGER_PERMISSIONS = Set.copyOf(List.of(
            // Menu
            VIEW_HOME,
            VIEW_LEGAL_CASE,
            VIEW_CASE_DATA_MANAGER,
            VIEW_BATCH_MANAGER,
            VIEW_OFFICER_MANAGER,
            VIEW_REPORTS,
            VIEW_NOTIFICATION,
            // Vụ án (create/import cho ADMIN,MANAGER)
            CREATE_LEGAL_CASE,
            IMPORT_LEGAL_CASE,
            // Phân công (getAssignmentList/removeAssignment cho ADMIN,MANAGER)
            ASSIGN_LEGAL_CASE,
            // Đợt nhập án (toàn bộ cho ADMIN,MANAGER)
            CREATE_BATCH,
            UPDATE_BATCH,
            DELETE_BATCH,
            VIEW_BATCH,
            // Thẩm phán (create/listAssignment cho ADMIN,MANAGER)
            CREATE_JUDGE,
            VIEW_JUDGE,
            // Hòa giải viên (getAll cho ADMIN,MANAGER)
            VIEW_MEDIATOR,
            // Quan hệ pháp luật (create/search cho ADMIN,MANAGER)
            CREATE_LEGAL_RELATIONSHIP,
            VIEW_LEGAL_RELATIONSHIP,
            // Nhóm quan hệ pháp luật (create/search cho ADMIN,MANAGER)
            CREATE_LEGAL_RELATIONSHIP_GROUP,
            VIEW_LEGAL_RELATIONSHIP_GROUP,
            // Thống kê (toàn bộ thống kê cho ADMIN,MANAGER)
            VIEW_STATISTIC
    ));

    /** JUDGE / MEDIATOR: chỉ xem. */
    private static final Set<String> VIEWER_PERMISSIONS = Set.of(
            VIEW_HOME,
            VIEW_LEGAL_CASE,
            VIEW_NOTIFICATION
    );

    public static final List<DefaultRole> DEFAULTS = List.of(
            new DefaultRole(ADMIN, "Quản trị viên", "Có vai trò cao nhất, có mọi quyền", ADMIN_PERMISSIONS),
            new DefaultRole(MANAGER, "Quản lý", "Quản lý nghiệp vụ án, phân công và thống kê", MANAGER_PERMISSIONS),
            new DefaultRole(JUDGE, "Thẩm phán", "Thẩm phán, chỉ xem các vụ án được phân công", VIEWER_PERMISSIONS),
            new DefaultRole(MEDIATOR, "Hòa giải viên", "Hòa giải viên, chỉ xem các vụ án liên quan", VIEWER_PERMISSIONS)
    );
}
