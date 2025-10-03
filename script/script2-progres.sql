INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('TP01', 'Nguyễn Văn', 'A', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP01', 20);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('TP01', 'TP01', '123', 'JUDGE', 'nguyenvana@gmail.com', 'TP01', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('TP02', 'Trần Thị', 'B', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP02', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('TP02', 'TP02','123', 'JUDGE', 'nguyenthib@gmail.com', 'TP02', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('TP03', 'Lê Văn', 'C', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP03', 10);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('TP03', 'TP03','123', 'JUDGE', 'levanc@gmail.com', 'TP03', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('TP04', 'Phạm Văn', 'D', 'NOT_WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP04', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('TP04', 'TP04','123', 'JUDGE', 'phanvand@gmail.com', 'TP04', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('TP05', 'Đỗ Thị', 'E', 'ON_LEAVE');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP05', 17);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('TP06', 'TP06','123', 'JUDGE', 'dothie@gmail.com', 'TP05', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('HG01', 'Nguyễn Văn', 'G', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG01');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('HG01', 'HG01', '123', 'MEDIATOR', 'nguyenvang@gmail.com', 'HG01', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('HG02', 'Nguyễn Văn', 'H', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG02');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('HG02', 'HG02', '123', 'MEDIATOR', 'nguyenvanh@gmail.com', 'HG02', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('HG03', 'Nguyễn Văn', 'I', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG03');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('HG03', 'HG03', '123', 'MEDIATOR', 'nguyenvani@gmail.com', 'HG03', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('HG04', 'Nguyễn Văn', 'J', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG04');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('HG04', 'HG04', '123', 'MEDIATOR', 'nguyenvanj@gmail.com', 'HG04', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, status_of_officer)
VALUES ('HG05', 'Nguyễn Văn', 'K', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG05');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, status_of_account)
VALUES ('HG05', 'HG05', '123', 'MEDIATOR', 'nguyenvank@gmail.com', 'HG05', 'ACTIVE');