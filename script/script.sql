INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, status_of_legal_case, storage_date)
VALUES ('2025KT0001', '58/2025', '2025-06-01', '2025-08-03', 'Nguyễn Văn A', 'Trần Thị B', 'LR04_001', 'COMMERCIAL', 'WAITING_FOR_ASSIGNMENT', CURRENT_TIMESTAMP);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, status_of_legal_case, storage_date)
VALUES ('2025DS0001', '59/2025', '2025-06-05', '2025-07-30', 'Lê Văn C', 'Phạm Văn D', 'LR02_048', 'CIVIL', 'WAITING_FOR_ASSIGNMENT', CURRENT_TIMESTAMP);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, status_of_legal_case, storage_date)
VALUES ('2025HN0001', '60/2025', '2025-06-10', '2025-12-10', 'Đỗ Thị E', 'Ngô Văn F', 'LR03_002', 'FAMILY', 'WAITING_FOR_ASSIGNMENT', CURRENT_TIMESTAMP);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, status_of_legal_case, storage_date)
VALUES ('2025LD0001', '61/2025', '2025-06-15', '2025-12-15', 'Huỳnh Văn G', 'Bùi Thị H', 'LR05_002', 'LABOR', 'WAITING_FOR_ASSIGNMENT', CURRENT_TIMESTAMP);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, status_of_legal_case, storage_date)
VALUES ('2025DS0002', '62/2025', '2025-06-20', '2025-12-20', 'Phan Thị I', 'Võ Văn K', 'LR02_037', 'CIVIL', 'WAITING_FOR_ASSIGNMENT', CURRENT_TIMESTAMP);

INSERT INTO judges (judge_id, last_name, first_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP01', 'Nguyễn Văn', 'A', 10, 'WORKING');
INSERT INTO  accounts (account_id, username, password, role, email, judge_id)
VALUES ('TP01', 'TP01', '123', 'JUDGE', 'nguyenvana@gmail.com', 'TP01');

INSERT INTO judges (judge_id, last_name, first_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP02', 'Trần Thị', 'B', 4, 'WORKING');
INSERT INTO  accounts (account_id, username, password, role, email, judge_id)
VALUES ('TP02', 'TP02','123', 'JUDGE', 'nguyenthib@gmail.com', 'TP02');

INSERT INTO judges (judge_id, last_name, first_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP03', 'Lê Văn', 'C', 3, 'WORKING');
INSERT INTO  accounts (account_id, username, password, role, email, judge_id)
VALUES ('TP03', 'TP03','123', 'JUDGE', 'levanc@gmail.com', 'TP03');

INSERT INTO judges (judge_id, last_name, first_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP04', 'Phạm Văn', 'D', 5, 'NOT_WORKING');
INSERT INTO  accounts (account_id, username, password, role, email, judge_id)
VALUES ('TP04', 'TP04','123', 'JUDGE', 'phanvand@gmail.com', 'TP04');

INSERT INTO judges (judge_id, last_name, first_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP05', 'Đỗ Thị', 'E', 6, 'ON_LEAVE');
INSERT INTO  accounts (account_id, username, password, role, email, judge_id)
VALUES ('TP06', 'TP06','123', 'JUDGE', 'dothie@gmail.com', 'TP05');
