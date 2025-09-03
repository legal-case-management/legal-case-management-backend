package server.entity.enums;

public enum CourtIssued {
    CURRENT_COURT("Tòa án hiện tại"),
    SUPERIOR_COURT("Tòa án cấp trên"),
    ;
    String name;
    CourtIssued(String name) {
        this.name = name;
    }

}
