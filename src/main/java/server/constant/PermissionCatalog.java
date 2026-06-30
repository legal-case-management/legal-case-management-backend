package server.constant;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Danh mục Permission cố định của hệ thống (nguồn chân lý duy nhất).
 *
 * Mỗi hằng số ở đây vừa là {@code permissionId} dùng trong {@code @PreAuthorize("hasAuthority('...')")}
 * vừa là dữ liệu được seed vào bảng {@code permissions} khi khởi động ứng dụng.
 *
 * Khi thêm/sửa quyền: cập nhật cả hằng số, {@link #ALL} (name/description) và mapping
 * mặc định trong {@link RoleCatalog} nếu cần.
 */
public final class PermissionCatalog {
    private PermissionCatalog() {
    }

    /* ===== Quyền xem menu / truy cập giao diện ===== */
    public static final String VIEW_HOME = "VIEW_HOME";
    public static final String VIEW_RANDOM_ASSIGNMENT = "VIEW_RANDOM_ASSIGNMENT";
    public static final String VIEW_LEGAL_CASE = "VIEW_LEGAL_CASE";
    public static final String VIEW_CASE_DATA_MANAGER = "VIEW_CASE_DATA_MANAGER";
    public static final String VIEW_BATCH_MANAGER = "VIEW_BATCH_MANAGER";
    public static final String VIEW_OFFICER_MANAGER = "VIEW_OFFICER_MANAGER";
    public static final String VIEW_ACCOUNT_MANAGER = "VIEW_ACCOUNT_MANAGER";
    public static final String VIEW_REPORTS = "VIEW_REPORTS";
    public static final String VIEW_NOTIFICATION = "VIEW_NOTIFICATION";

    /* ===== Vụ án ===== */
    public static final String CREATE_LEGAL_CASE = "CREATE_LEGAL_CASE";
    public static final String UPDATE_LEGAL_CASE = "UPDATE_LEGAL_CASE";
    public static final String DELETE_LEGAL_CASE = "DELETE_LEGAL_CASE";
    public static final String IMPORT_LEGAL_CASE = "IMPORT_LEGAL_CASE";

    /* ===== Phân công án ===== */
    public static final String ASSIGN_LEGAL_CASE = "ASSIGN_LEGAL_CASE";
    public static final String RANDOM_ASSIGNMENT = "RANDOM_ASSIGNMENT";

    /* ===== Đợt nhập án ===== */
    public static final String CREATE_BATCH = "CREATE_BATCH";
    public static final String UPDATE_BATCH = "UPDATE_BATCH";
    public static final String DELETE_BATCH = "DELETE_BATCH";
    public static final String VIEW_BATCH = "VIEW_BATCH";

    /* ===== Thẩm phán ===== */
    public static final String CREATE_JUDGE = "CREATE_JUDGE";
    public static final String UPDATE_JUDGE = "UPDATE_JUDGE";
    public static final String DELETE_JUDGE = "DELETE_JUDGE";
    public static final String VIEW_JUDGE = "VIEW_JUDGE";

    /* ===== Hòa giải viên ===== */
    public static final String CREATE_MEDIATOR = "CREATE_MEDIATOR";
    public static final String UPDATE_MEDIATOR = "UPDATE_MEDIATOR";
    public static final String DELETE_MEDIATOR = "DELETE_MEDIATOR";
    public static final String VIEW_MEDIATOR = "VIEW_MEDIATOR";

    /* ===== Loại quyết định ===== */
    public static final String CREATE_DOCUMENT_TYPE = "CREATE_DOCUMENT_TYPE";
    public static final String UPDATE_DOCUMENT_TYPE = "UPDATE_DOCUMENT_TYPE";
    public static final String DELETE_DOCUMENT_TYPE = "DELETE_DOCUMENT_TYPE";
    public static final String VIEW_DOCUMENT_TYPE = "VIEW_DOCUMENT_TYPE";

    /* ===== Loại vụ án ===== */
    public static final String CREATE_LEGAL_CASE_TYPE = "CREATE_LEGAL_CASE_TYPE";
    public static final String UPDATE_LEGAL_CASE_TYPE = "UPDATE_LEGAL_CASE_TYPE";
    public static final String DELETE_LEGAL_CASE_TYPE = "DELETE_LEGAL_CASE_TYPE";
    public static final String VIEW_LEGAL_CASE_TYPE = "VIEW_LEGAL_CASE_TYPE";

    /* ===== Quan hệ pháp luật ===== */
    public static final String CREATE_LEGAL_RELATIONSHIP = "CREATE_LEGAL_RELATIONSHIP";
    public static final String UPDATE_LEGAL_RELATIONSHIP = "UPDATE_LEGAL_RELATIONSHIP";
    public static final String DELETE_LEGAL_RELATIONSHIP = "DELETE_LEGAL_RELATIONSHIP";
    public static final String VIEW_LEGAL_RELATIONSHIP = "VIEW_LEGAL_RELATIONSHIP";

    /* ===== Nhóm quan hệ pháp luật ===== */
    public static final String CREATE_LEGAL_RELATIONSHIP_GROUP = "CREATE_LEGAL_RELATIONSHIP_GROUP";
    public static final String UPDATE_LEGAL_RELATIONSHIP_GROUP = "UPDATE_LEGAL_RELATIONSHIP_GROUP";
    public static final String DELETE_LEGAL_RELATIONSHIP_GROUP = "DELETE_LEGAL_RELATIONSHIP_GROUP";
    public static final String VIEW_LEGAL_RELATIONSHIP_GROUP = "VIEW_LEGAL_RELATIONSHIP_GROUP";

    /* ===== Quyết định, thông báo (Document) ===== */
    public static final String CREATE_DOCUMENT = "CREATE_DOCUMENT";
    public static final String UPDATE_DOCUMENT = "UPDATE_DOCUMENT";
    public static final String DELETE_DOCUMENT = "DELETE_DOCUMENT";

    /* ===== Thống kê ===== */
    public static final String VIEW_STATISTIC = "VIEW_STATISTIC";

    /* ===== Tài khoản ===== */
    public static final String CREATE_ACCOUNT = "CREATE_ACCOUNT";
    public static final String UPDATE_ACCOUNT = "UPDATE_ACCOUNT";
    public static final String DELETE_ACCOUNT = "DELETE_ACCOUNT";
    public static final String VIEW_ACCOUNT = "VIEW_ACCOUNT";
    public static final String BLOCK_ACCOUNT = "BLOCK_ACCOUNT";

    /* ===== Vai trò / quyền ===== */
    public static final String CREATE_ROLE = "CREATE_ROLE";
    public static final String UPDATE_ROLE = "UPDATE_ROLE";
    public static final String DELETE_ROLE = "DELETE_ROLE";
    public static final String VIEW_ROLE = "VIEW_ROLE";
    public static final String VIEW_PERMISSION = "VIEW_PERMISSION";

    /**
     * Toàn bộ permission của hệ thống: permissionId -> [name, description].
     * Dùng để seed bảng permissions. {@link LinkedHashMap} để giữ thứ tự hiển thị hợp lý.
     */
    public static final Map<String, String[]> ALL = new LinkedHashMap<>();

    static {
        // Menu
        ALL.put(VIEW_HOME, new String[]{"Xem trang chủ", "Truy cập trang chủ hệ thống"});
        ALL.put(VIEW_RANDOM_ASSIGNMENT, new String[]{"Xem phân án ngẫu nhiên", "Truy cập trang phân án ngẫu nhiên"});
        ALL.put(VIEW_LEGAL_CASE, new String[]{"Xem quản lý án", "Truy cập trang quản lý án"});
        ALL.put(VIEW_CASE_DATA_MANAGER, new String[]{"Xem quản lý thông tin án", "Truy cập trang quản lý thông tin án"});
        ALL.put(VIEW_BATCH_MANAGER, new String[]{"Xem quản lý đợt nhập án", "Truy cập trang quản lý đợt nhập án"});
        ALL.put(VIEW_OFFICER_MANAGER, new String[]{"Xem quản lý nhân viên", "Truy cập trang quản lý nhân viên"});
        ALL.put(VIEW_ACCOUNT_MANAGER, new String[]{"Xem quản lý tài khoản", "Truy cập trang quản lý tài khoản và vai trò"});
        ALL.put(VIEW_REPORTS, new String[]{"Xem báo cáo", "Truy cập trang thống kê, báo cáo"});
        ALL.put(VIEW_NOTIFICATION, new String[]{"Xem thông báo", "Truy cập trang thông báo"});

        // Vụ án
        ALL.put(CREATE_LEGAL_CASE, new String[]{"Tạo vụ án", "Thêm vụ án mới"});
        ALL.put(UPDATE_LEGAL_CASE, new String[]{"Sửa vụ án", "Chỉnh sửa thông tin vụ án"});
        ALL.put(DELETE_LEGAL_CASE, new String[]{"Xóa vụ án", "Xóa vụ án khỏi hệ thống"});
        ALL.put(IMPORT_LEGAL_CASE, new String[]{"Nhập vụ án từ Excel", "Nhập danh sách vụ án từ tệp Excel"});

        // Phân công
        ALL.put(ASSIGN_LEGAL_CASE, new String[]{"Phân công án", "Phân công, gỡ phân công thẩm phán cho vụ án"});
        ALL.put(RANDOM_ASSIGNMENT, new String[]{"Phân án ngẫu nhiên", "Thực hiện phân công án ngẫu nhiên cho thẩm phán"});

        // Đợt nhập án
        ALL.put(CREATE_BATCH, new String[]{"Tạo đợt nhập án", "Thêm đợt nhập án mới"});
        ALL.put(UPDATE_BATCH, new String[]{"Sửa đợt nhập án", "Chỉnh sửa đợt nhập án"});
        ALL.put(DELETE_BATCH, new String[]{"Xóa đợt nhập án", "Xóa đợt nhập án"});
        ALL.put(VIEW_BATCH, new String[]{"Xem đợt nhập án", "Tìm kiếm, xem danh sách đợt nhập án"});

        // Thẩm phán
        ALL.put(CREATE_JUDGE, new String[]{"Tạo thẩm phán", "Thêm thẩm phán mới"});
        ALL.put(UPDATE_JUDGE, new String[]{"Sửa thẩm phán", "Chỉnh sửa thông tin thẩm phán"});
        ALL.put(DELETE_JUDGE, new String[]{"Xóa thẩm phán", "Xóa thẩm phán"});
        ALL.put(VIEW_JUDGE, new String[]{"Xem thẩm phán", "Tìm kiếm, xem danh sách thẩm phán"});

        // Hòa giải viên
        ALL.put(CREATE_MEDIATOR, new String[]{"Tạo hòa giải viên", "Thêm hòa giải viên mới"});
        ALL.put(UPDATE_MEDIATOR, new String[]{"Sửa hòa giải viên", "Chỉnh sửa thông tin hòa giải viên"});
        ALL.put(DELETE_MEDIATOR, new String[]{"Xóa hòa giải viên", "Xóa hòa giải viên"});
        ALL.put(VIEW_MEDIATOR, new String[]{"Xem hòa giải viên", "Tìm kiếm, xem danh sách hòa giải viên"});

        // Loại quyết định
        ALL.put(CREATE_DOCUMENT_TYPE, new String[]{"Tạo loại quyết định", "Thêm loại quyết định, thông báo"});
        ALL.put(UPDATE_DOCUMENT_TYPE, new String[]{"Sửa loại quyết định", "Chỉnh sửa loại quyết định, thông báo"});
        ALL.put(DELETE_DOCUMENT_TYPE, new String[]{"Xóa loại quyết định", "Xóa loại quyết định, thông báo"});
        ALL.put(VIEW_DOCUMENT_TYPE, new String[]{"Xem loại quyết định", "Tìm kiếm, xem loại quyết định, thông báo"});

        // Loại vụ án
        ALL.put(CREATE_LEGAL_CASE_TYPE, new String[]{"Tạo loại vụ án", "Thêm loại vụ án"});
        ALL.put(UPDATE_LEGAL_CASE_TYPE, new String[]{"Sửa loại vụ án", "Chỉnh sửa loại vụ án"});
        ALL.put(DELETE_LEGAL_CASE_TYPE, new String[]{"Xóa loại vụ án", "Xóa loại vụ án"});
        ALL.put(VIEW_LEGAL_CASE_TYPE, new String[]{"Xem loại vụ án", "Tìm kiếm, xem loại vụ án"});

        // Quan hệ pháp luật
        ALL.put(CREATE_LEGAL_RELATIONSHIP, new String[]{"Tạo quan hệ pháp luật", "Thêm quan hệ pháp luật"});
        ALL.put(UPDATE_LEGAL_RELATIONSHIP, new String[]{"Sửa quan hệ pháp luật", "Chỉnh sửa quan hệ pháp luật"});
        ALL.put(DELETE_LEGAL_RELATIONSHIP, new String[]{"Xóa quan hệ pháp luật", "Xóa quan hệ pháp luật"});
        ALL.put(VIEW_LEGAL_RELATIONSHIP, new String[]{"Xem quan hệ pháp luật", "Tìm kiếm, xem quan hệ pháp luật"});

        // Nhóm quan hệ pháp luật
        ALL.put(CREATE_LEGAL_RELATIONSHIP_GROUP, new String[]{"Tạo nhóm quan hệ pháp luật", "Thêm nhóm quan hệ pháp luật"});
        ALL.put(UPDATE_LEGAL_RELATIONSHIP_GROUP, new String[]{"Sửa nhóm quan hệ pháp luật", "Chỉnh sửa nhóm quan hệ pháp luật"});
        ALL.put(DELETE_LEGAL_RELATIONSHIP_GROUP, new String[]{"Xóa nhóm quan hệ pháp luật", "Xóa nhóm quan hệ pháp luật"});
        ALL.put(VIEW_LEGAL_RELATIONSHIP_GROUP, new String[]{"Xem nhóm quan hệ pháp luật", "Tìm kiếm, xem nhóm quan hệ pháp luật"});

        // Quyết định
        ALL.put(CREATE_DOCUMENT, new String[]{"Tạo quyết định", "Thêm quyết định, thông báo cho vụ án"});
        ALL.put(UPDATE_DOCUMENT, new String[]{"Sửa quyết định", "Chỉnh sửa quyết định, thông báo"});
        ALL.put(DELETE_DOCUMENT, new String[]{"Xóa quyết định", "Xóa quyết định, thông báo"});

        // Thống kê
        ALL.put(VIEW_STATISTIC, new String[]{"Xem thống kê", "Xem các biểu đồ, số liệu thống kê"});

        // Tài khoản
        ALL.put(CREATE_ACCOUNT, new String[]{"Tạo tài khoản", "Thêm tài khoản mới"});
        ALL.put(UPDATE_ACCOUNT, new String[]{"Sửa tài khoản", "Chỉnh sửa tài khoản"});
        ALL.put(DELETE_ACCOUNT, new String[]{"Xóa tài khoản", "Xóa tài khoản"});
        ALL.put(VIEW_ACCOUNT, new String[]{"Xem tài khoản", "Tìm kiếm, xem danh sách tài khoản"});
        ALL.put(BLOCK_ACCOUNT, new String[]{"Khóa/mở tài khoản", "Khóa hoặc kích hoạt tài khoản"});

        // Vai trò / quyền
        ALL.put(CREATE_ROLE, new String[]{"Tạo vai trò", "Thêm vai trò mới"});
        ALL.put(UPDATE_ROLE, new String[]{"Sửa vai trò", "Chỉnh sửa vai trò và quyền của vai trò"});
        ALL.put(DELETE_ROLE, new String[]{"Xóa vai trò", "Xóa vai trò"});
        ALL.put(VIEW_ROLE, new String[]{"Xem vai trò", "Tìm kiếm, xem danh sách vai trò"});
        ALL.put(VIEW_PERMISSION, new String[]{"Xem quyền", "Xem danh sách quyền trong hệ thống"});
    }
}
