/* type of legal case */
INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L01', 'Hình sự', 'HS');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L02', 'Dân sự', 'DS');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L03', 'Hôn nhân gia đình', 'HN');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L04', 'Kinh doanh thương mại', 'KT');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L05', 'Lao động', 'LD');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L06', 'Hành chính', 'HC');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L07', 'Phá sản', 'PS');

INSERT INTO type_of_legal_cases (type_of_legal_case_id, type_of_legal_case_name, code_name)
    VALUES ('L08', 'Biện pháp xử lý hành chính', 'BP');

/* legal relationship group */
INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
    VALUES ('N01', 'Nhóm 01 - Hình sự', 'Các quan hệ pháp luật thuộc hình sự');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
    VALUES ('N02', 'Nhóm 02 - Hôn nhân gia đình', 'Các quan hệ pháp luật thuộc hôn nhân gia đình');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
    VALUES ('N03', 'Nhóm 03 - Đất', 'Các quan hệ pháp luật thuộc dân sự liên quan tới đất đai');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
    VALUES ('N04', 'Nhóm 04 - Còn lại', 'Các quan hệ pháp luật còn lại');

/* legal relationship */
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS001', 'Tội phản bội Tổ quốc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS002', 'Tội hoạt động nhằm lật đổ chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS003', 'Tội gián điệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS004', 'Tội xâm phạm an ninh lãnh thổ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS005', 'Tội bạo loạn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS006', 'Tội khủng bố nhằm chống chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS007', 'Tội phá hoại cơ sở vật chất - kỹ thuật của nước Cộng hòa xã hội chủ nghĩa Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS008', 'Tội phá hoại việc thực hiện các chính sách kinh tế - xã hội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS009', 'Tội phá hoại chính sách đoàn kết', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS010',
           'Tội làm, tàng trữ, phát tán hoặc tuyên truyền thông tin, tài liệu, vật phẩm nhằm chống Nhà nước Cộng hòa xã hội chủ nghĩa Việt Nam',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS011', 'Tội phá rối an ninh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS012', 'Tội chống phá cơ sở giam giữ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS013',
           'Tội tổ chức, cưỡng ép, xúi giục người khác trốn đi nước ngoài hoặc trốn ở lại nước ngoài nhằm chống chính quyền nhân dân',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS014', 'Tội trốn đi nước ngoài hoặc trốn ở lại nước ngoài nhằm chống chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS015', 'Hình phạt bổ sung', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS016', 'Tội giết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS017', 'Tội giết hoặc vứt bỏ con mới đẻ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS018', 'Tội giết người trong trạng thái tinh thần bị kích động mạnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS019',
           'Tội giết người do vượt quá giới hạn phòng vệ chính đáng hoặc do vượt quá mức cần thiết khi bắt giữ người phạm tội',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS020', 'Tội làm chết người trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS021', 'Tội vô ý làm chết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS022', 'Tội vô ý làm chết người do vi phạm quy tắc nghề nghiệp hoặc quy tắc hành chính', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS023', 'Tội bức tử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS024', 'Tội xúi giục hoặc giúp người khác tự sát', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS025', 'Tội không cứu giúp người đang ở trong tình trạng nguy hiểm đến tính mạng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS026', 'Tội đe dọa giết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS027', 'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS028',
           'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác trong trạng thái tinh thần bị kích động mạnh',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS029',
           'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác do vượt quá giới hạn phòng vệ chính đáng hoặc do vượt quá mức cần thiết khi bắt giữ người phạm tội',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS030', 'Tội gây thương tích hoặc gây tổn hại cho sức khỏe của người khác trong khi thi hành công vụ',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS031', 'Tội vô ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS032',
           'Tội vô ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác do vi phạm quy tắc nghề nghiệp hoặc quy tắc hành chính',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS033', 'Tội hành hạ người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS034', 'Tội hiếp dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS035', 'Tội hiếp dâm người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS036', 'Tội cưỡng dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS037', 'Tội cưỡng dâm người từ đủ 13 tuổi đến dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS038',
           'Tội giao cấu hoặc thực hiện hành vi quan hệ tình dục khác với người từ đủ 13 tuổi đến dưới 16 tuổi', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS039', 'Tội dâm ô đối với người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS040', 'Tội sử dụng người dưới 16 tuổi vào mục đích khiêu dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS041', 'Tội lây truyền HIV cho người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS042', 'Tội cố ý truyền HIV cho người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS043', 'Tội mua bán người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS044', 'Tội mua bán người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS045', 'Tội đánh tráo người dưới 01 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS046', 'Tội chiếm đoạt người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS047', 'Tội mua bán, chiếm đoạt mô hoặc bộ phận cơ thể người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS048', 'Tội làm nhục người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS049', 'Tội vu khống', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS050', 'Tội bắt, giữ hoặc giam người trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS051', 'Tội xâm phạm chỗ ở của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS052',
           'Tội xâm phạm bí mật hoặc an toàn thư tín, điện thoại, điện tín hoặc hình thức trao đổi thông tin riêng tư khác của người khác',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS053', 'Tội xâm phạm quyền của công dân về bầu cử, ứng cử hoặc biểu quyết khi Nhà nước trưng cầu ý dân',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS054', 'Tội làm sai lệch kết quả bầu cử, kết quả trưng cầu ý dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS055', 'Tội buộc công chức, viên chức thôi việc hoặc sa thải người lao động trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS056', 'Tội xâm phạm quyền hội họp, lập hội của công dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS057', 'Tội xâm phạm quyền tự do tín ngưỡng, tôn giáo của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS058', 'Tội xâm phạm quyền bình đẳng giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS059', 'Tội xâm phạm quyền khiếu nại, tố cáo', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS060',
           'Tội xâm phạm quyền tự do ngôn luận, tự do báo chí, tiếp cận thông tin, quyền biểu tình của công dân', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS061', 'Tội cướp tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS062', 'Tội bắt cóc nhằm chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS063', 'Tội cưỡng đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS064', 'Tội cướp giật tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS065', 'Tội công nhiên chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS066', 'Tội trộm cắp tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS067', 'Tội lừa đảo chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS068', 'Tội lạm dụng tín nhiệm chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS069', 'Tội chiếm giữ trái phép tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS070', 'Tội sử dụng trái phép tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS071', 'Tội hủy hoại hoặc cố ý làm hư hỏng tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS072', 'Tội thiếu trách nhiệm gây thiệt hại đến tài sản của Nhà nước, cơ quan, tổ chức, doanh nghiệp',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS073', 'Tội vô ý gây thiệt hại nghiêm trọng đến tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS074', 'Tội cưỡng ép kết hôn, ly hôn hoặc cản trở hôn nhân tự nguyện, tiến bộ, cản trở ly hôn tự nguyện',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS075', 'Tội vi phạm chế độ một vợ, một chồng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS076', 'Tội tổ chức tảo hôn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS077', 'Tội loạn luân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS078', 'Tội ngược đãi hoặc hành hạ ông bà, cha mẹ, vợ chồng, con, cháu hoặc người có công nuôi dưỡng mình',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS079', 'Tội từ chối hoặc trốn tránh nghĩa vụ cấp dưỡng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS080', 'Tội tổ chức mang thai hộ vì mục đích thương mại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS081', 'Tội buôn lậu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS082', 'Tội vận chuyển trái phép hàng hóa, tiền tệ qua biên giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS083', 'Tội sản xuất, buôn bán hàng cấm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS084', 'Tội tàng trữ, vận chuyển hàng cấm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS085', 'Tội sản xuất, buôn bán hàng giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS086', 'Tội sản xuất, buôn bán hàng giả là lương thực, thực phẩm, phụ gia thực phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS087', 'Tội sản xuất, buôn bán hàng giả là thuốc chữa bệnh, thuốc phòng bệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS088',
           'Tội sản xuất, buôn bán hàng giả là thức ăn dùng để chăn nuôi, phân bón, thuốc thú y, thuốc bảo vệ thực vật, giống cây trồng, giống vật nuôi',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS089', 'Tội đầu cơ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS090', 'Tội quảng cáo gian dối', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS091', 'Tội lừa dối khách hàng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS092', 'Tội vi phạm quy định về cung ứng điện', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS093', 'Tội trốn thuế', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS094', 'Tội cho vay lãi nặng trong giao dịch dân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS095', 'Tội làm, buôn bán tem giả, vé giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS096', 'Tội in, phát hành, mua bán trái phép hóa đơn, chứng từ thu nộp ngân sách nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS097', 'Tội vi phạm quy định về bảo quản, quản lý hóa đơn, chứng từ thu nộp ngân sách nhà nước', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS098', 'Tội lập quỹ trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS099', 'Tội vi phạm quy định về hoạt động ngân hàng, hoạt động khác liên quan đến hoạt động ngân hàng',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS100', 'Tội làm, tàng trữ, vận chuyển, lưu hành tiền giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS101',
           'Tội làm, tàng trữ, vận chuyển, lưu hành công cụ chuyển nhượng giả hoặc các giấy tờ có giá giả khác', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS102', 'Tội cố ý công bố thông tin sai lệch hoặc che giấu thông tin trong hoạt động chứng khoán', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS103', 'Tội sử dụng thông tin nội bộ để mua bán chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS104', 'Tội thao túng thị trường chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS105', 'Tội làm giả tài liệu trong hồ sơ chào bán, niêm yết chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS106', 'Tội gian lận trong kinh doanh bảo hiểm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS107', 'Tội gian lận bảo hiểm xã hội, bảo hiểm thất nghiệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS108', 'Tội gian lận bảo hiểm y tế', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS109', 'Tội trốn đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp cho người lao động', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS110', 'Tội vi phạm quy định về cạnh tranh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS111', 'Tội vi phạm quy định về kinh doanh theo phương thức đa cấp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS112', 'Tội vi phạm quy định về hoạt động bán đấu giá tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS113', 'Tội vi phạm quy định về quản lý, sử dụng tài sản Nhà nước gây thất thoát, lãng phí', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS114', 'Tội vi phạm quy định172 về quản lý và sử dụng vốn đầu tư công gây hậu quả nghiêm trọng', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS115', 'Tội vi phạm quy định174 về kế toán gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS116', 'Tội vi phạm quy định về đấu thầu gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS117', 'Tội thông đồng, bao che cho người nộp thuế gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS118', 'Tội vi phạm quy định về đầu tư công trình xây dựng gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS119', 'Tội xâm phạm quyền tác giả, quyền liên quan', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS120', 'Tội xâm phạm quyền Sở hữu công nghiệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS121', 'Tội vi phạm quy định về nghiên cứu, thăm dò, khai thác tài nguyên', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS122', 'Tội vi phạm các quy định về sử dụng đất đai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS123', 'Tội vi phạm các quy định về quản lý đất đai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS124', 'Tội vi phạm quy định về bồi thường, hỗ trợ, tái định cư khi Nhà nước thu hồi đất', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS125', 'Tội cố ý làm trái quy định về phân phối tiền, hàng cứu trợ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS126', 'Tội vi phạm quy định về khai thác, bảo vệ rừng và lâm sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS127', 'Tội vi phạm quy định về quản lý rừng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS128', 'Tội vi phạm quy định về bảo vệ động vật hoang dã', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS129', 'Tội gây ô nhiễm môi trường', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS130', 'Tội vi phạm quy định về quản lý chất thải nguy hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS131', 'Tội vi phạm quy định về phòng ngừa, ứng phó, khắc phục sự cố môi trường', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS132',
           'Tội vi phạm quy định về bảo vệ an toàn công trình thủy lợi, đê điều và phòng, chống thiên tai; vi phạm quy định về bảo vệ bờ, bãi sông',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS133', 'Tội đưa chất thải vào lãnh thổ Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS134', 'Tội làm lây lan dịch bệnh truyền nhiễm nguy hiểm cho người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS135', 'Tội làm lây lan dịch bệnh nguy hiểm cho động vật, thực vật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS136', 'Tội hủy hoại nguồn lợi thủy sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS137', 'Tội hủy hoại rừng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS138', 'Tội vi phạm quy định về bảo vệ động vật nguy cấp, quý, hiếm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS139', 'Tội vi phạm 234 quy định về quản lý khu bảo tồn thiên nhiên', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS140', 'Tội nhập khẩu, phát tán các loài ngoại lai xâm hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS141', 'Tội trồng cây thuốc phiện, cây côca, cây cần sa hoặc các loại cây khác có chứa chất ma túy', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS142', 'Tội sản xuất trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS143', 'Tội tàng trữ trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS144', 'Tội vận chuyển trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS145', 'Tội mua bán trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS146', 'Tội chiếm đoạt chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS147',
           'Tội tàng trữ, vận chuyển, mua bán hoặc chiếm đoạt tiền chất dùng vào việc sản xuất trái phép chất ma túy',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS148',
           'Tội sản xuất, tàng trữ, vận chuyển hoặc mua bán phương tiện, dụng cụ dùng vào việc sản xuất hoặc sử dụng trái phép chất ma túy',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS149', 'Tội tổ chức sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS150', 'Tội chứa chấp việc sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS151', 'Tội cưỡng bức người khác sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS152', 'Tội lôi kéo người khác sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS153', 'Tội vi phạm quy định về quản lý chất ma túy, tiền chất, thuốc gây nghiện, thuốc hướng thần', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS154', 'Tội vi phạm quy định về tham gia giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS155', 'Tội cản trở giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS156',
           'Tội đưa vào sử dụng phương tiện giao thông cơ giới đường bộ, xe máy chuyên dùng không bảo đảm an toàn',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS157', 'Tội điều động người không đủ điều kiện điều khiển phương tiện tham gia giao thông đường bộ', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS158', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện tham gia giao thông đường bộ', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS159', 'Tội tổ chức đua xe trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS160', 'Tội đua xe trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS161', 'Tội vi phạm quy định về điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS162', 'Tội cản trở giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS163', 'Tội đưa vào sử dụng phương tiện, thiết bị giao thông đường sắt không bảo đảm an toàn', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS164', 'Tội điều động người không đủ điều kiện điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS165', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS166', 'Tội vi phạm quy định về điều khiển phương tiện giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS167', 'Tội cản trở giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS168', 'Tội đưa vào sử dụng phương tiện giao thông đường thủy không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS169', 'Tội điều động người không đủ điều kiện điều khiển phương tiện giao thông đường thủy', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS170', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS171', 'Tội vi phạm quy định về điều khiển tàu bay', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS172', 'Tội cản trở giao thông đường không', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS173', 'Tội đưa vào sử dụng tàu bay, thiết bị bảo đảm hoạt động bay không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS174', 'Tội điều động hoặc giao cho người không đủ điều kiện điều khiển tàu bay', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS175', 'Tội vi phạm quy định về duy tu, sửa chữa, quản lý công trình giao thông', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS176', 'Tội chiếm đoạt tàu bay, tàu thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS177', 'Tội điều khiển tàu bay vi phạm quy định về hàng không của nước Cộng hòa xã hội chủ nghĩa Việt Nam',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS178',
           'Tội điều khiển phương tiện hàng hải vi phạm quy định về hàng hải của nước Cộng hòa xã hội chủ nghĩa Việt Nam',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS179',
           'Tội sản xuất, mua bán, trao đổi hoặc tặng cho công cụ, thiết bị, phần mềm để sử dụng vào mục đích trái pháp luật',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS180',
           'Tội phát tán chương trình tin học gây hại cho hoạt động của mạng máy tính, mạng viễn thông, phương tiện điện tử',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS181', 'Tội cản trở hoặc gây rối loạn hoạt động của mạng máy tính, mạng viễn thông, phương tiện điện tử',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS182', 'Tội đưa hoặc sử dụng trái phép thông tin mạng máy tính, mạng viễn thông', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS183', 'Tội xâm nhập trái phép vào mạng máy tính, mạng viễn thông hoặc phương tiện điện tử của người khác',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS184',
           'Tội sử dụng mạng máy tính, mạng viễn thông, phương tiện điện tử thực hiện hành vi chiếm đoạt tài sản',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS185',
           'Tội thu thập, tàng trữ, trao đổi, mua bán, công khai hóa trái phép thông tin về tài khoản ngân hàng', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS186',
           'Tội sử dụng trái phép tần số vô tuyến điện dành riêng cho mục đích cấp cứu, an toàn, tìm kiếm, cứu hộ, cứu nạn, quốc phòng, an ninh',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS187', 'Tội cố ý gây nhiễu có hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS188', 'Tội vi phạm quy định về an toàn lao động, vệ sinh lao động, về an toàn ở nơi đông người', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS189', 'Tội vi phạm quy định về sử dụng người lao động dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS190', 'Tội cưỡng bức lao động', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS191', 'Tội vi phạm quy định về xây dựng gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS192', 'Tội khủng bố', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS193', 'Tội tài trợ khủng bố', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS194', 'Tội bắt cóc con tin', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS195', 'Tội cướp biển', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS196', 'Tội phá hủy công trình, cơ sở, phương tiện quan trọng về an ninh quốc gia', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS197',
           'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt vũ khí quân dụng, phương tiện kỹ thuật quân sự',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS198', 'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt vật liệu nổ', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS199',
           'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt súng săn, vũ khí thô sơ, vũ khí thể thao hoặc công cụ hỗ trợ',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS200', 'Tội vi phạm quy định về quản lý vũ khí, vật liệu nổ, công cụ hỗ trợ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS201', 'Tội thiếu trách nhiệm trong việc giữ vũ khí, vật liệu nổ, công cụ hỗ trợ gây hậu quả nghiêm trọng',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS202',
           'Tội sản xuất, tàng trữ, vận chuyển, sử dụng, phát tán, mua bán trái phép hoặc chiếm đoạt chất phóng xạ, vật liệu hạt nhân',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS203', 'Tội vi phạm quy định về quản lý chất phóng xạ, vật liệu hạt nhân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS204', 'Tội sản xuất, tàng trữ, vận chuyển, sử dụng hoặc mua bán trái phép chất cháy, chất độc', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS205', 'Tội vi phạm quy định về quản lý chất cháy, chất độc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS206', 'Tội vi phạm quy định về phòng cháy, chữa cháy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS207', 'Tội vi phạm quy định về an toàn vận hành công trình điện lực', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS208',
           'Tội vi phạm quy định về khám bệnh, chữa bệnh, sản xuất, pha chế, cấp phát, bán thuốc hoặc dịch vụ y tế khác',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS209', 'Tội phá thai trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS210', 'Tội vi phạm quy định về an toàn thực phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS211', 'Tội gây rối trật tự công cộng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS212', 'Tội xâm phạm thi thể, mồ mả, hài cốt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS213', 'Tội hành nghề mê tín, dị đoan', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS214', 'Tội đánh bạc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS215', 'Tội tổ chức đánh bạc hoặc gá bạc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS216', 'Tội chứa chấp hoặc tiêu thụ tài sản do người khác phạm tội mà có', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS217', 'Tội rửa tiền', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS218', 'Tội dụ dỗ, ép buộc hoặc chứa chấp người dưới 18 tuổi phạm pháp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS219', 'Tội truyền bá văn hóa phẩm đồi trụy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS220', 'Tội chứa mại dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS221', 'Tội môi giới mại dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS222', 'Tội mua dâm người dưới 18 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS223', 'Tội chống người thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS224',
           'Tội lợi dụng các quyền tự do dân chủ xâm phạm lợi ích của Nhà nước, quyền, lợi ích hợp pháp của tổ chức, cá nhân',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS225', 'Tội trốn tránh nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS226', 'Tội không chấp hành lệnh gọi quân nhân dự bị nhập ngũ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS227', 'Tội làm trái quy định về việc thực hiện nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS228', 'Tội cản trở việc thực hiện nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS229', 'Tội đăng ký hộ tịch trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS230',
           'Tội cố ý làm lộ bí mật nhà nước; tội chiếm đoạt, mua bán hoặc tiêu hủy vật hoặc tài liệu bí mật nhà nước',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS231', 'Tội vô ý làm lộ bí mật nhà nước; tội làm mất vật, tài liệu bí mật nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS232', 'Tội giả mạo chức vụ, cấp bậc, vị trí công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS233', 'Tội sửa chữa và sử dụng giấy chứng nhận, các tài liệu của cơ quan, tổ chức', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS234',
           'Tội làm giả con dấu, tài liệu của cơ quan, tổ chức; tội sử dụng con dấu hoặc tài liệu giả của cơ quan, tổ chức',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS235', 'Tội chiếm đoạt, mua bán, tiêu hủy con dấu, tài liệu của cơ quan, tổ chức', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS236', 'Tội vi phạm các quy định về quản lý nhà ở', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS237', 'Tội vi phạm quy định về hoạt động xuất bản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS238',
           'Tội vi phạm các quy định về bảo vệ và sử dụng di tích lịch sử - văn hóa, danh lam, thắng cảnh gây hậu quả nghiêm trọng',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS239', 'Tội vi phạm quy chế về khu vực biên giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS240', 'Tội vi phạm quy định về xuất cảnh, nhập cảnh; tội ở lại Việt Nam trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS241', 'Tội tổ chức, môi giới cho người khác xuất cảnh, nhập cảnh hoặc ở lại Việt Nam trái phép', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS242', 'Tội tổ chức, môi giới cho người khác trốn đi nước ngoài hoặc ở lại nước ngoài trái phép', 'L01',
           'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS243', 'Tội cưỡng ép người khác trốn đi nước ngoài hoặc ở lại nước ngoài trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS244', 'Tội xúc phạm Quốc kỳ, Quốc huy, Quốc ca', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS245', 'Khái niệm tội phạm về chức vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS246', 'Tội tham ô tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS247', 'Tội nhận hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS248', 'Tội lạm dụng chức vụ, quyền hạn chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS249', 'Tội lợi dụng chức vụ, quyền hạn trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS250', 'Tội lạm quyền trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS251', 'Tội lợi dụng chức vụ, quyền hạn gây ảnh hưởng đối với người khác để trục lợi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS252', 'Tội giả mạo trong công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS253', 'Tội thiếu trách nhiệm gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS254', 'Tội cố ý làm lộ bí mật công tác; tội chiếm đoạt, mua bán hoặc tiêu hủy tài liệu bí mật công tác',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS255', 'Tội vô ý làm lộ bí mật công tác; tội làm mất tài liệu bí mật công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS256', 'Tội đào nhiệm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS257', 'Tội đưa hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS258', 'Tội môi giới hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS259', 'Tội lợi dụng ảnh hưởng đối với người có chức vụ, quyền hạn để trục lợi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS260', 'Khái niệm tội xâm phạm hoạt động tư pháp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS261', 'Tội truy cứu trách nhiệm hình sự người không có tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS262', 'Tội không truy cứu trách nhiệm hình sự người có tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS263', 'Tội ra bản án trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS264', 'Tội ra quyết định trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS265', 'Tội ép buộc người có thẩm quyền trong hoạt động tư pháp làm trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS266', 'Tội dùng nhục hình', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS267', 'Tội bức cung', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS268', 'Tội làm sai lệch hồ sơ vụ án, vụ việc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS269',
           'Tội thiếu trách nhiệm để người bị bắt, người bị tạm giữ, tạm giam, người đang chấp hành án phạt tù trốn',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS270', 'Tội lợi dụng chức vụ, quyền hạn bắt, giữ, giam người trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS271',
           'Tội tha trái pháp luật người bị bắt, người đang bị tạm giữ, tạm giam, người đang chấp hành án phạt tù',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS272', 'Tội không thi hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS273', 'Tội không chấp hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS274', 'Tội cản trở việc thi hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS275', 'Tội cung cấp tài liệu sai sự thật hoặc khai báo gian dối', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS276', 'Tội từ chối khai báo, từ chối kết luận giám định, định giá tài sản hoặc từ chối cung cấp tài liệu',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS277', 'Tội mua chuộc hoặc cưỡng ép người khác trong việc khai báo, cung cấp tài liệu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS278', 'Tội vi phạm việc niêm phong, kê biên tài sản, phong tỏa tài khoản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS279', 'Tội trốn khỏi nơi giam, giữ hoặc trốn khi đang bị áp giải, đang bị xét xử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS280',
           'Tội đánh tháo người bị bắt, bị tạm giữ, tạm giam, người đang bị áp giải, xét xử, chấp hành án phạt tù',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS281', 'Tội vi phạm quy định về giam giữ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS282', 'Tội che giấu tội phạm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS283', 'Tội không tố giác tội phạm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS284', 'Tội gây rối trật tự phiên tòa, phiên họp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS285', 'Những người phải chịu trách nhiệm hình sự về các tội xâm phạm nghĩa vụ, trách nhiệm của quân nhân',
           'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS286', 'Tội ra mệnh lệnh trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS287', 'Tội chống mệnh lệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS288', 'Tội chấp hành không nghiêm chỉnh mệnh lệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS289', 'Tội cản trở đồng đội thực hiện nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS290', 'Tội làm nhục đồng đội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS291', 'Tội hành hung đồng đội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS292', 'Tội đầu hàng địch', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS293', 'Tội khai báo hoặc tự nguyện làm việc cho địch khi bị bắt làm tù binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS294', 'Tội bỏ vị trí chiến đấu hoặc không làm nhiệm vụ trong chiến đấu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS295', 'Tội đào ngũ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS296', 'Tội trốn tránh nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS297', 'Tội cố ý làm lộ bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS298', 'Tội chiếm đoạt, mua bán hoặc tiêu hủy tài liệu bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS299', 'Tội vô ý làm lộ bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS300', 'Tội làm mất tài liệu bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS301', 'Tội báo cáo sai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS302', 'Tội vi phạm quy định về trực ban, trực chiến, trực chỉ huy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS303', 'Tội vi phạm quy định về bảo vệ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS304', 'Tội vi phạm các quy định về bảo đảm an toàn trong chiến đấu hoặc trong huấn luyện', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS305', 'Tội vi phạm quy định về sử dụng vũ khí quân dụng, trang bị kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS306', 'Tội hủy hoại hoặc cố ý làm hư hỏng vũ khí quân dụng, trang bị kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS307', 'Tội làm mất hoặc vô ý làm hư hỏng vũ khí quân dụng, phương tiện kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS308', 'Tội quấy nhiễu nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS309', 'Tội lạm dụng nhu cầu quân sự trong khi thực hiện nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS310', 'Tội cố ý bỏ thương binh, tử sĩ hoặc không chăm sóc, cứu chữa thương binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS311', 'Tội chiếm đoạt hoặc hủy hoại di vật của tử sĩ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS312', 'Tội chiếm đoạt hoặc hủy hoại chiến lợi phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS313', 'Tội ngược đãi tù binh, hàng binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS314', 'Tội phá hoại hòa bình, gây chiến tranh xâm lược', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS315', 'Tội chống loài người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS316', 'Tội phạm chiến tranh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS317', 'Tội tuyển mộ, huấn luyện hoặc sử dụng lính đánh thuê', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HS318', 'Tội làm lính đánh thuê', 'L01', 'N01');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS001', 'Tranh chấp giữa cá nhân với cá nhân vê quốc tịch Việt Nam', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS002', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Kiện đòi tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS003', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Tranh chấp về quyền sở hữu tài sản',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS004', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Các quyền khác đối với tài sản',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS005', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mua bán tài sản', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS006', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mua bán nhà', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS007', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng trao đổi tài sản', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS008', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng tặng cho tài sản', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS009', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng vay tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS010', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng tín dụng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS011', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về hụi, họ, biêu, phường', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS012', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS013', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê nhà', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS014', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê khoán tài sản', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS015', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mượn tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS016', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng hợp tác', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS017', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng dịch vụ', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS018', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng vận chuyển', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS019', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng bảo hiểm', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS020', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng gia công', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS021', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng gửi giữ tài sản', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS022', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng uỷ quyền', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS023', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về hợp đồng sử dụng tác phẩm', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS024', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về Hứa thưởng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS025', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về Thi có giải', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS026', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp khác', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS027',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền tác giả - Tranh chấp về quyền liên quan đến tác phẩm văn học, nghệ thuật, khoa học',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS028',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền tác giả - Tranh chấp về quyền liên quan đến tác giả',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS029',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Sáng chế, giải pháp hữu ích',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS030',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Kiểu dáng công nghiệp',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS031',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Thiết kế bố trí mạch tích hợp bán dẫn',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS032',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Bí mật kinh doanh',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS033',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Nhãn hiệu',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS034',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Tên thương mại và chỉ dẫn địa lý',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS035',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền đối với giống cây trồng',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS036',
           'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về hợp đồng chuyển giao công nghệ',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS037', 'Tranh chấp về thừa kế tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS038', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại về tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS039', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại sức khỏe, tính mạng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS040', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại về danh dự, nhân phẩm, uy tín', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS041',
           'Đòi bồi thường thiệt hại ngoài hợp đồng - Các thiệt hại khác trong lĩnh vực sản xuất kinh doanh, vệ sinh môi trường...',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS042', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại do vi phạm quyền lợi của người tiêu dùng',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS043', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Các thiệt hại khác', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS044', 'Thiệt hại do Tòa án áp dụng biện pháp khẩn cấp tạm thời không đúng - Theo khoản 1 Điều 113', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS045', 'Thiệt hại do Tòa án áp dụng biện pháp khẩn cấp tạm thời không đúng - Theo khoản 2 Điều 113', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS046',
           'Tranh chấp về bồi thường hiệt hại do áp dụng biện pháp ngăn chặn hành chính không đúng theo quy định của pháp luật về cạnh tranh',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS047',
           'Tranh chấp về khai thác, sử dụng tài nguyên nước, xả thải vào nguồn nước theo quy định của Luật tài nguyên nước',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS048', 'Tranh chấp đất đai - Tranh chấp hợp đồng chuyển đổi qsd đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS049', 'Tranh chấp đất đai - Tranh chấp hợp đồng chuyển nhượng qsd đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS050', 'Tranh chấp đất đai - Tranh chấp hợp đồng thuê qsd đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS051', 'Tranh chấp đất đai - Tranh chấp hợp đồng thế chấp qsd đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS052', 'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS053',
           'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất - Đối với đất nông nghiệp để trồng cây hàng năm, nuôi trồng thủy sản.',
           'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS054',
           'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất - Đối với đất nông nghiệp để trồng cây lâu năm, đất lâm nghiệp để trồng rừng, đất ở.',
           'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS055', 'Tranh chấp đất đai - Đòi đất cho mượn, cho sử dụng nhờ, lấn chiếm...', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS056', 'Tranh chấp đất đai - Tranh chấp quyền sử dụng đất', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS057', 'Tranh chấp đất đai - Tranh chấp quyền sử dụng rừng và đất rừng', 'L02', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS058', 'Tranh chấp liên quan đến hoạt động nghiệp vụ báo chí theo quy định của pháp luật về báo chí',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS059', 'Tranh chấp liên quan đến yêu cầu tuyên bố văn bản công chứng vô hiệu', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS060',
           'Tranh chấp liên quan đến tài sản bị cưỡng chế để thi hành án theo quy định của pháp luật về thi hành án dân sự',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS061',
           'Tranh chấp về kết quả bán đấu giá tài sản, thanh toán phí tổn đăng ký mua tài sản bán đấu giá theo quy định của pháp luật về thi hành án dân sự',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS062', 'Các tranh chấp dân sự trong trường hợp chưa có điều luật áp dụng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS063', 'Các tranh chấp dân sự khác', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS064',
           'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người mất năng lực hành vi dân sự, bị hạn chế năng lực hành vi dân sự hoặc có khó khăn trong nhận thức, làm chủ hành vi',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS065', 'Yêu cầu thông báo tìm kiếm người vắng mặt tại nơi cư trú và quản lý tài sản của người đó', 'L02',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS066', 'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người mất tích', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS067', 'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người là đã chết', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS068', 'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án, quyết định về dân sự', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS069',
           'Yêu cầu không công nhận bản án, quyết định về dân sự, quyết định về tài sản trong bản án, quyết định',
           'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS070', 'Yêu cầu tuyên bố văn bản công chứng vô hiệu', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS071', 'Yêu cầu công nhận kết quả hòa giải thành ngoài Tòa án', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS072', 'Yêu cầu công nhận tài sản có trên lãnh thổ Việt Nam là vô chủ', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS073', 'Yêu cầu xác định quyền sở hữu, quyền sử dụng tài sản', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS074', 'Các yêu cầu dân sự trong trường hợp chưa có điều luật để áp dụng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('DS075', 'Các yêu cầu dân sự khác', 'L02', 'N04');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN001', 'Vụ án ly hôn - Mâu thuẫn gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN002', 'Vụ án ly hôn - Bạo lực gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN003', 'Vụ án ly hôn - Ngoại tình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN004', 'Vụ án ly hôn - Bệnh tật, không có con', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN005', 'Vụ án ly hôn - Do nghiện ma tuý, rượu chè, cờ bạc', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN006', 'Vụ án ly hôn - Một bên ở nước ngoài', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN007', 'Vụ án ly hôn - Một bên bị mất tích', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN008', 'Vụ án ly hôn - Mâu thuẫn về kinh tế', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN009', 'Vụ án ly hôn - Các nguyên nhân khác', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN010', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản khi ly hôn', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN011', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản sau khi ly hôn', 'L03',
           'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN012',
           'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản chung của vợ chồng trong thời kỳ hôn nhân',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN013',
           'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về thay đổi người trực tiếp nuôi con sau khi ly hôn',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN014',
           'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về xác định cha, mẹ cho con hoặc con cho cha mẹ',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN015', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về cấp dưỡng', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN016',
           'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về sinh con bằng kỹ thuật hỗ trợ sinh sản, mang thai hộ vì mục đích nhân đạo',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN017',
           'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về nuôi con, chia tài sản của nam, nữ chung sống với nhau như vợ chồng mà không đăng ký kết hôn hoặc hủy kết hôn trái pháp luật',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN018', 'Tranh chấp về hôn nhân gia đình trong trường hợp chưa có điều luật áp dụng', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN019', 'Yêu cầu huỷ việc kết hôn trái pháp luật', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN020', 'Yêu cầu công nhận thuận tình ly hôn, thỏa thuận nuôi con, chia tài sản khi ly hôn', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN021',
           'Yêu cầu công nhận thoả thuận về thay đổi người trực tiếp nuôi con sau khi ly hôn hoặc công nhận việc thay đổi người trực tiếp nuôi con sau khi ly hôn của cơ quan, tổ chức, cá nhân theo quy định của pháp luật về hôn nhân và gia đình',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN022', 'Yêu cầu hạn chế quyền cha, mẹ đối với con chưa thành niên hoặc quyền thăm nom con sau khi ly hôn',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN023', 'Yêu cầu nhằm chấm dứt việc nuôi con nuôi', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN024', 'Yêu cầu liên quan đến việc mang thai hộ theo quy định của pháp luật về hôn nhân và gia đình',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN025',
           'Yêu cầu công nhận thỏa thuận chấm dứt hiệu lực của việc chia tài sản chung trong thời kỳ hôn nhân đã được thực hiện theo bản án, quyết định của Tòa án',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN026',
           'Yêu cầu tuyên bố vô hiệu thỏa thuận về chế độ tài sản của vợ chồng theo quy định của pháp luật hôn nhân và gia đình',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN027',
           'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án, quyết định về hôn nhân và gia đình của Tòa án nước ngoài hoặc cơ quan khác',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN028',
           'Yêu cầu không công nhận bản án, quyết định về hôn nhân và gia đình của Tòa án nước ngoài hoặc cơ quan khác',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN029',
           'Yêu cầu xác định cha, mẹ cho con hoặc con cho cha mẹ theo quy định của pháp luật về hôn nhân và gia đình',
           'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN030', 'Các yêu cầu hôn nhân gia đình trong trường hợp chưa có điều luật áp dụng', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HN031', 'Các yêu cầu hôn nhân gia đình khác', 'L03', 'N02');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT001', 'Mua bán hàng hoá', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT002', 'Gia công hàng hóa', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT003', 'Cung ứng dịch vụ', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT004', 'Phân phối', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT005', 'Đại diện, đại lý', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT006', 'Ký gửi', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT007', 'Ký quỹ', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT008', 'Cầm giữ tài sản', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT009', 'Bảo lãnh', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT010', 'Thế chấp', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT011', 'Đặt cọc', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT012', 'Thuê, cho thuê, thuê mua', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT013', 'Xây dựng', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT014', 'Tư vấn kỹ thuật', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT015', 'Vận chuyển hàng hoá, hành khách bằng đường sắt, đường bộ, đường thủy nội địa', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT016', 'Vận chuyển hàng hoá, hành khách bằng đường hàng không, đường biển', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT017', 'Mua bán cổ phiếu, trái phiếu và giấy tờ có giá khác', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT018', 'Đầu tư tài chính, ngân hàng', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT019', 'Bảo hiểm', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT020', 'Liên doanh liên kết', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT021', 'Hợp đồng đầu tư', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT022', 'Hợp đồng quảng cáo', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT023', 'Thăm dò, khai thác', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT024', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ giữa cá nhân, tổ chức với nhau', 'L04',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT025',
           'Tranh chấp giữa người chưa phải là thành viên công ty nhưng có giao dịch về chuyển nhượng phần vốn góp với công ty, thành viên công ty',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT026', 'Tranh chấp giữa công ty với các thành viên của công ty', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT027', 'Tranh chấp giữa công ty với người quản lý trong công ty', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT028', 'Các tranh chấp kinh doanh thương mại trong trường hợp chưa có điều luật để áp dụng', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT029', 'Các tranh chấp kinh doanh thương mại khác', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT030',
           'Yêu cầu hủy bỏ nghị quyết của Đại hội đồng cổ đông, nghị quyết của Hội đồng thành viên theo quy định của pháp luật về doanh nghiệp',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT031',
           'Yêu cầu liên quan việc trọng tài thương mại Việt Nam giải quyết tranh chấp theo quy định của pháp luật về Trọng tài thương mại',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT032',
           'Yêu cầu bắt giữ tàu bay, tàu biển theo quy định của pháp luật hàng không dân dụng Việt Nam, về hàng hải VN, trừ trường hợp bắt giữ tàu bay, tàu biển để bảo đảm giải quyết vụ án',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT033',
           'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án quyết định kinh doanh, thương mại của Toà án nước ngoài',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT034',
           'Yêu cầu không công nhận bản án, quyết định kinh doanh thương mại của Tòa án nước ngoài không có yêu cầu thi hành tại Việt Nam',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT035',
           'Yêu cầu công nhận và cho thi hành tại Việt Nam phán quyết kinh doanh, thương mại của Trọng tài nước ngoài',
           'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT036',
           'Yêu cầu công nhận và cho thi hành quyết định giải quyết phá sản của Tòa án nước ngoài tại Việt Nam', 'L04',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT037', 'Các yêu cầu kinh doanh thương mại trong trường hợp chưa có điều luật để áp dụng', 'L04', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('KT038', 'Các yêu cầu kinh doanh thương mại khác', 'L04', 'N04');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD001', 'Về xử lý kỷ luật, sa thải, đơn phương chấm dứt hợp đồng lao động', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD002', 'Về bồi thường thiệt hại, trợ cấp khi chấm dứt hợp đồng lao động', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD003', 'Giữa người giúp việc gia đình với người sử dụng lao động', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD004',
           'Về bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, bảo hiểm tai nạn lao động, bệnh nghề nghiệp',
           'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD005',
           'Về bồi thường thiệt hại giữa người lao động với doanh nghiệp, đơn vị sự nghiệp công lập đưa người lao động đi làm việc ở nước ngoài theo hợp đồng',
           'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD006', 'Về quyền, lợi ích liên quan đến việc làm, tiền lương...', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD007', 'Về việc thực hiện thoả ước lao động tập thể', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD008', 'Về quyền thành lập, gia nhập, hoạt động công đoàn', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD009', 'Về học nghề, tập nghề', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD010', 'Về cho thuê lại lao động', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD011', 'Về quyền công đoàn, kinh phí công đoàn', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD012', 'Về an toàn lao động, vệ sinh lao động', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD013', 'Về bồi thường thiệt hại do đình công bất hợp pháp', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD014', 'Các tranh chấp lao động trong trường hợp chưa có điều luật áp dụng', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD015', 'Các tranh chấp lao động khác', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD016', 'Yêu cầu tuyên bố hợp đồng lao động, thỏa ước lao động tập thể vô hiệu', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD017', 'Yêu cầu xét tính hợp pháp của cuộc đình công', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD018',
           'Yêu cầu công nhận và cho thi hành án tại Việt Nam bản án, quyết định lao động của Tòa án nước ngoài', 'L05',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD019',
           'Yêu cầu không công nhận bản án, quyết định lao động của Tòa án nước ngoài không có yêu cầu thi hành tại Việt Nam',
           'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD020', 'Yêu cầu công nhận và cho thi hành tại Việt Nam phán quyết lao động của Trọng tài nước ngoài',
           'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD021', 'Các yêu cầu lao động trong trường hợp chưa có điều luật áp dụng', 'L05', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('LD022', 'Các yêu cầu lao động khác', 'L05', 'N04');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC001', 'QĐ xử phạt vi phạm hành chính', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC002', 'QĐ áp dụng các biện pháp ngăn chặn và bảo đảm việc xử lý vi phạm hành chính', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC003',
           'QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp cưỡng chế thi hành quyết định xừ phạt vi phạm hành chính',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC004',
           'QĐ hành chính, hành vi hành chính trong việc áp dụng hoặc thi hành biện pháp xử lý hành chính bằng một trong các hình thức giáo dục tại xã, phường, thị trấn; đưa vào trường giáo dưỡng; đưa vào cơ sở giáo dục; đưa vào cơ sở chữa bệnh; quản chế hành chính',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC005',
           'QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp buộc tháo dỡ nhà ở, công trình, vật kiến trúc kiên cố khác',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC006',
           'QĐ hành chính, hành vi hành chính trong việc cấp, thu hồi giấy phép về xây dựng cơ bản, sản xuất, kinh doanh; giấy chứng nhận đăng ký kinh doanh và chứng chỉ hành nghề hoặc khiếu kiện QĐ hành chính, hành vi hành chính khác liên quan đến hoạt động kinh doanh, tài chính của thương nhân',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC007', 'QĐ hành chính, hành vi hành chính liên quan đến thương mại hàng hoá quốc tế hoặc trong nước',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC008',
           'QĐ hành chính, hành vi hành chính liên quan đến chuyển giao tài chính trong nước và quôc tế, dịch vụ và cung ứng dịch vụ',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC009', 'QĐ hành chính, hành vi hành chính trong việc trưng dụng, trưng mua, tịch thu tài sản', 'L06',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC010', 'QĐ hành chính, hành vi hành chính trong việc áp dụng thuế, thu thuế, truy thu thuế', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC011', 'QĐ hành chính, hành vi hành chính trong việc áp dụng phí, thu phí, lệ phí; thu tiền sử dụng đất',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC012',
           'QĐ hành chính, hành vi hành chính trong quản lý nhà nước về sở hữu trí tuệ và chuyển giao công nghệ', 'L06',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC013', 'QĐ hành chính, hành vi hành chính trong quản lý nhà nước về đầu tư', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC014', 'QĐ hành chính, hành vi hành chính của cơ quan hải quan, công chức hải quan', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC015', 'QĐ hành chính, hành vi hành chính về quản lý hộ tịch', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC016', 'QĐ hành chính, hành vi hành chính đối với việc từ chối công chứng, chứng thực', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC017',
           'QĐ hành chính, hành vi hành chính về quản lý đất đai trong trường hợp giao đất, cho thuê đất, thu hồi đất, trưng dụng đất, cho phép chuyển mục đích sử dụng đất; bồi thường, hỗ trợ, giải phóng mặt bằng, tái định cư; cấp hoặc thu hồi giấy chứng nhận quyền sử dụng đất; gia hạn thời hạn sử dụng đất',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC018', 'Về danh sách cử tri', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC019', 'QĐ kỷ luật buộc thôi việc công chức giữ giữ chức vụ từ Tổng cục trưởng và tương đương trở xuống',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC020',
           'QĐ của Chủ tịch UBND tỉnh, thành phố trực thuộc trung ương giải quyết khiếu nại đối với quyết định của Ban chủ nhiệm, Hội đồng khen thưởng, kỷ luật của Đoàn luật sư',
           'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC021', 'QĐ giải quyết khiếu nại về quyết định xử lý vụ việc cạnh tranh', 'L06', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('HC022', 'Các khiếu kiện hành chính khác', 'L06', 'N04');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS001', 'Doanh nghiệp nhà nước', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS002', 'Doanh nghiệp 100% vốn nhà nước', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS003', 'Doanh nghiệp vốn nhà nước chiếm giữ trên 50%', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS004', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Doanh nghiệp tư nhân', 'L07',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS005', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty Trách nhiệm hữu hạn',
           'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS006', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty cổ phần', 'L07',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS007', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty hợp danh', 'L07',
           'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS008', 'Doanh nghiệp 100% vốn đầu tư nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS009',
           'Doanh nghiệp có nhiều nguồn vốn (vốn nhà nước từ 50% trở xuống, một phần vốn nước ngoài, vốn thuộc sở hữu tư nhân)',
           'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS010', 'Hợp tác xã', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS011', 'Ngân hàng thương mại có một phần vốn góp nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS012', 'Ngân hàng thương mại không có vốn nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS013', 'Ngân hàng thương mại 100% vốn nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS014', 'Ngân hàng hợp tác xã', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS015', 'Quỹ tín dụng nhân dân', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS016', 'Tổ chức tín dụng phi ngân hàng có một phần vốn góp nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS017', 'Tổ chức tín dụng phi ngân hàng không có vốn nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS018', 'Tổ chức tín dụng phi ngân hàng 100% vốn nước ngoài', 'L07', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('PS019', 'Doanh nghiệp phá sản khác', 'L07', 'N04');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('BP001', 'Đưa vào trường giáo dưỡng', 'L08', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('BP002', 'Đưa vào cơ sở giáo dục bắt buộc', 'L08', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name, type_of_legal_case_id,
                                 legal_relationship_group_id)
    VALUES ('BP003', 'Đưa vào cơ sở cai nghiện bắt buộc', 'L08', 'N04');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS01', 'DS. Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS02', 'DS. Quyết định trưng cầu giám định', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS03', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS04', 'DS. Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS05', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS06', 'DS. Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS07', 'VDS. Quyết định phân công người tiến hành tố tụng', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS08', 'DS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS09', 'VDS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS10', 'DS. Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS11', 'VDS. Quyết định trưng cầu giám định', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS12', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS13', 'VDS. Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS14', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS15', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS16', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS17', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS18', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS19', 'VDS. Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS20', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS21', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS22', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS23', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS24', 'VDS. Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS25', 'DS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS26', 'VDS. Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS27', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS28', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS29', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS30', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS31', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS32', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS33', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS34', 'DS. Quyết định hoãn phiên tòa', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS35', 'DS. Quyết định tạm ngừng phiên tòa', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS36', 'DS. Quyết định sửa chữa, bổ sung bản án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS37', 'DS. Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS38', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS39', 'DS. Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS40', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS41', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS42', 'DS. Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS43', 'DS. Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS45', 'Quyết định nhập vụ án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS46', 'Quyết định tách vụ án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS55', 'Thông báo thụ lý bổ sung', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS56', 'Bản án', TRUE, 'L02', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS57', 'Quyết định hủy án', TRUE, 'L02', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('DS58', 'Quyết định sửa án', TRUE, 'L02', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN01', 'DS. Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN02', 'DS. Quyết định trưng cầu giám định', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN03', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN04', 'DS. Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN05', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN06', 'DS. Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN07', 'VDS. Quyết định phân công người tiến hành tố tụng', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN08', 'DS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN09', 'VDS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN10', 'DS. Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN11', 'VDS. Quyết định trưng cầu giám định', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN12', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN13', 'VDS. Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN14', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN15', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN16', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN17', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN18', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN19', 'VDS. Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN20', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN21', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN22', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN23', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN24', 'VDS. Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN25', 'DS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN26', 'VDS. Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN27', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN28', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN29', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN30', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN31', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN32', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN33', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN34', 'DS. Quyết định hoãn phiên tòa', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN35', 'DS. Quyết định tạm ngừng phiên tòa', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN36', 'DS. Quyết định sửa chữa, bổ sung bản án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN37', 'DS. Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN38', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN39', 'DS. Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN40', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN41', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN42', 'DS. Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN43', 'DS. Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN45', 'Quyết định nhập vụ án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN46', 'Quyết định tách vụ án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN55', 'Thông báo thụ lý bổ sung', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN56', 'Bản án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN57', 'Quyết định hủy án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HN58', 'Quyết định sửa án', TRUE, 'L03', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT02', 'Quyết định trưng cầu giám định', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT11', 'Quyết định trưng cầu giám định', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT34', 'Quyết định hoãn phiên tòa', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT45', 'Quyết định nhập vụ án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT46', 'Quyết định tách vụ án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT55', 'Thông báo thụ lý bổ sung', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT56', 'Bản án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT57', 'Quyết định hủy án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('KT58', 'Quyết định sửa án', TRUE, 'L03', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD02', 'Quyết định trưng cầu giám định', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD11', 'Quyết định trưng cầu giám định', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD34', 'Quyết định hoãn phiên tòa', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD45', 'Quyết định nhập vụ án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD46', 'Quyết định tách vụ án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD55', 'Thông báo thụ lý bổ sung', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD56', 'Bản án', TRUE, 'L05', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD57', 'Quyết định hủy án', TRUE, 'L05', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('LD58', 'Quyết định sửa án', TRUE, 'L05', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC02', 'Quyết định trưng cầu giám định', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC11', 'Quyết định trưng cầu giám định', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC34', 'Quyết định hoãn phiên tòa', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC45', 'Quyết định nhập vụ án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC46', 'Quyết định tách vụ án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC55', 'Thông báo thụ lý bổ sung', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC56', 'Bản án', TRUE, 'L06', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC57', 'Quyết định hủy án', TRUE, 'L06', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HC58', 'Quyết định sửa án', TRUE, 'L06', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS02', 'Quyết định trưng cầu giám định', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS11', 'Quyết định trưng cầu giám định', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS34', 'Quyết định hoãn phiên tòa', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS45', 'Quyết định nhập vụ án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS46', 'Quyết định tách vụ án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS55', 'Thông báo thụ lý bổ sung', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS56', 'Bản án', TRUE, 'L07', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS57', 'Quyết định hủy án', TRUE, 'L07', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('PS58', 'Quyết định sửa án', TRUE, 'L07', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP02', 'Quyết định trưng cầu giám định', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP11', 'Quyết định trưng cầu giám định', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP34', 'Quyết định hoãn phiên tòa', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP45', 'Quyết định nhập vụ án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP46', 'Quyết định tách vụ án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP55', 'Thông báo thụ lý bổ sung', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP56', 'Bản án', TRUE, 'L08', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP57', 'Quyết định hủy án', TRUE, 'L08', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('BP58', 'Quyết định sửa án', TRUE, 'L08', 'SUPERIOR_COURT');

INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS01', 'Quyết định áp dụng biện pháp bắt buộc chữa bệnh (dùng cho Chánh án, Phó Chánh án Tòa án trong giai đoạn xét xử)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS02', 'Quyết định áp dụng thủ tục rút gọn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS03', 'Quyết định hủy bỏ Quyết định áp dụng thủ tục rút gọn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS04', 'Quyết định trưng cầu giám định (dùng cho Thẩm phán được phân công giải quyết vụ án khi có yêu cầu)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS05', 'Quyết định trưng cầu giám định (dùng cho Thẩm phán được phân công giải quvết vụ án khi xét thấy cẩn thiết)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS06', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS07', 'Quyết định tạm đình chỉ vụ án (dùng cho Thẩm phán được phân công chủ tọa phiên tòa)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS08', 'Quyết định tạm đình chỉ vụ án (dùng cho Hội đồng xét xử sơ thẩm)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS09', 'Quyết định tạm đình chỉ vụ án và áp dụng biện pháp bắt buộc chữa bệnh (dùng cho Hội đồng xét xử sơ thẩm)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS10', 'Quyết định phục hồi vụ án (dùng cho Chánh án Tòa án, Thẩm phán được phân công chủ tọa phiên tòa)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS11', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS12', 'Quyết định hoãn phiên tòa (dùng cho Hội đồng xét xử)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS13', 'Quyết định hoãn phiên tòa (dùng cho Chánh án Tòa án)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS14', 'Quyết định về việc giải quyết kháng cáo quá hạn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS15', 'Quyết định rút hồ sơ vụ án hình sự', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS16', 'Quyết định thay đổi (bổ sung, rút) kháng nghị giám đốc thẩm', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS17', 'Quyết định khởi tố vụ án hình sự', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS18', 'Bản án', TRUE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS19', 'Quyết định trả hồ sơ điều tra bổ sung', TRUE, 'L01', 'CURRENT_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS20', 'Quyết định hủy án', TRUE, 'L01', 'SUPERIOR_COURT');
INSERT INTO type_of_decisions(type_of_decision_id, type_of_decision_name, the_end_decision, type_of_legal_case_id, court_issued) VALUES ('HS21', 'Quyết định sửa án', TRUE, 'L01', 'SUPERIOR_COURT');

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION', 0);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS', 0);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS44', 'IN_PROCESS', 'IN_PROCESS', 2);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS44', 'OVERDUE', 'IN_PROCESS', 2);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS55', 'IN_PROCESS', 'IN_PROCESS', 4);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS47', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS48', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS49', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS50', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS51', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS52', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS53', 'IN_PROCESS', 'SOLVED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS54', 'IN_PROCESS', 'SOLVED', 0);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS56', 'IN_PROCESS', 'SOLVED', 0);

INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS57', 'SOLVED', 'CANCELED', 0);
INSERT INTO handle_type_of_decisions(type_of_decision_id, pre_status, post_status, extension_period)
VALUES ('DS58', 'SOLVED', 'EDITED', 0);

