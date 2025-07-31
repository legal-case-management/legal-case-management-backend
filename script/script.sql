INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, assignment, status_of_legal_case, judge_id)
VALUES ('2025DS0001', '58/2025', '2025-06-01', '2025-12-01', 'Nguyễn Văn A', 'Trần Thị B', 'LR04_001', 'COMMERCIAL', NULL, 'WAITING_FOR_ASSIGNMENT', NULL);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, assignment, status_of_legal_case, judge_id)
VALUES ('2025HC0001', '59/2025', '2025-06-05', '2025-12-05', 'Lê Văn C', 'Phạm Văn D', 'LR02_048', 'CIVIL', NULL, 'WAITING_FOR_ASSIGNMENT', NULL);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, assignment, status_of_legal_case, judge_id)
VALUES ('2025HN0001', '60/2025', '2025-06-10', '2025-12-10', 'Đỗ Thị E', 'Ngô Văn F', 'LR03_002', 'FAMILY', NULL, 'WAITING_FOR_ASSIGNMENT', NULL);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, assignment, status_of_legal_case, judge_id)
VALUES ('2025LD0001', '61/2025', '2025-06-15', '2025-12-15', 'Huỳnh Văn G', 'Bùi Thị H', 'LR05_002', 'LABOR', NULL, 'WAITING_FOR_ASSIGNMENT', NULL);

INSERT INTO legal_cases (legal_case_id, acceptance_number, acceptance_date, expired_date, plaintiff, defendant, legal_relationship, type_of_legal_case, assignment, status_of_legal_case, judge_id)
VALUES ('2025HS0001', '62/2025', '2025-06-20', '2025-12-20', 'Phan Thị I', 'Võ Văn K', 'LR02_037', 'CIVIL', NULL, 'WAITING_FOR_ASSIGNMENT', NULL);

INSERT INTO judges (judge_id, first_name, last_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP01', 'Nguyễn Văn', 'A', 10, 'WORKING');

INSERT INTO judges (judge_id, first_name, last_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP02', 'Trần Thị', 'B', 4, 'WORKING');

INSERT INTO judges (judge_id, first_name, last_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP03', 'Lê Văn', 'C', 3, 'WORKING');

INSERT INTO judges (judge_id, first_name, last_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP04', 'Phạm Văn', 'D', 5, 'NOT_WORKING');

INSERT INTO judges (judge_id, first_name, last_name, max_number_of_legal_case, status_of_judge)
VALUES ('TP05', 'Đỗ Thị', 'E', 6, 'ON_LEAVE');

