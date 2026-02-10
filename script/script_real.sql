/* Index */
-- Generated column
ALTER TABLE officers
    DROP COLUMN full_name;

ALTER TABLE officers
    ADD COLUMN full_name VARCHAR(255)
        GENERATED ALWAYS AS (last_name || ' ' || first_name) STORED;

/* type of legal case */
INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L01', 'Hình sự', 'HS');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L02', 'Dân sự', 'DS');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L03', 'Hôn nhân gia đình', 'HN');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L04', 'Kinh doanh thương mại', 'KT');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L05', 'Lao động', 'LD');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L06', 'Hành chính', 'HC');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L07', 'Phá sản', 'PS');

INSERT INTO legal_case_types (legal_case_type_id, legal_case_type_name, code_name)
VALUES ('L08', 'Biện pháp xử lý hành chính', 'BP');

/* legal relationship group */
INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
VALUES ('N01', 'Nhóm 01 - Hình sự', 'Các quan hệ pháp luật thuộc hình sự');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
VALUES ('N02', 'Nhóm 02 - Án ly hôn', 'Các quan hệ pháp luật thuộc hôn nhân gia đình');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
VALUES ('N03', 'Nhóm 03 - Án ly hôn có tài sản', 'Các quan hệ pháp luật thuộc dân sự liên quan tới đất đai');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
VALUES ('N04', 'Nhóm 04 - Đất', 'Các quan hệ pháp luật thuộc dân sự liên quan tới đất đai');

INSERT INTO legal_relationship_groups(legal_relationship_group_id, legal_relationship_group_name, description)
VALUES ('N05', 'Nhóm 05 - Còn lại', 'Các quan hệ pháp luật còn lại');

/* legal relationship */
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS001', 'Tội phản bội Tổ quốc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS002', 'Tội hoạt động nhằm lật đổ chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS003', 'Tội gián điệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS004', 'Tội xâm phạm an ninh lãnh thổ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS005', 'Tội bạo loạn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS006', 'Tội khủng bố nhằm chống chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS007', 'Tội phá hoại cơ sở vật chất - kỹ thuật của nước Cộng hòa xã hội chủ nghĩa Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS008', 'Tội phá hoại việc thực hiện các chính sách kinh tế - xã hội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS009', 'Tội phá hoại chính sách đoàn kết', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS010', 'Tội làm, tàng trữ, phát tán hoặc tuyên truyền thông tin, tài liệu, vật phẩm nhằm chống Nhà nước Cộng hòa xã hội chủ nghĩa Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS011', 'Tội phá rối an ninh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS012', 'Tội chống phá cơ sở giam giữ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS013', 'Tội tổ chức, cưỡng ép, xúi giục người khác trốn đi nước ngoài hoặc trốn ở lại nước ngoài nhằm chống chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS014', 'Tội trốn đi nước ngoài hoặc trốn ở lại nước ngoài nhằm chống chính quyền nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS015', 'Hình phạt bổ sung', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS016', 'Tội giết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS017', 'Tội giết hoặc vứt bỏ con mới đẻ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS018', 'Tội giết người trong trạng thái tinh thần bị kích động mạnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS019', 'Tội giết người do vượt quá giới hạn phòng vệ chính đáng hoặc do vượt quá mức cần thiết khi bắt giữ người phạm tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS020', 'Tội làm chết người trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS021', 'Tội vô ý làm chết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS022', 'Tội vô ý làm chết người do vi phạm quy tắc nghề nghiệp hoặc quy tắc hành chính', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS023', 'Tội bức tử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS024', 'Tội xúi giục hoặc giúp người khác tự sát', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS025', 'Tội không cứu giúp người đang ở trong tình trạng nguy hiểm đến tính mạng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS026', 'Tội đe dọa giết người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS027', 'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS028', 'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác trong trạng thái tinh thần bị kích động mạnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS029', 'Tội cố ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác do vượt quá giới hạn phòng vệ chính đáng hoặc do vượt quá mức cần thiết khi bắt giữ người phạm tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS030', 'Tội gây thương tích hoặc gây tổn hại cho sức khỏe của người khác trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS031', 'Tội vô ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS032', 'Tội vô ý gây thương tích hoặc gây tổn hại cho sức khỏe của người khác do vi phạm quy tắc nghề nghiệp hoặc quy tắc hành chính', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS033', 'Tội hành hạ người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS034', 'Tội hiếp dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS035', 'Tội hiếp dâm người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS036', 'Tội cưỡng dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS037', 'Tội cưỡng dâm người từ đủ 13 tuổi đến dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS038', 'Tội giao cấu hoặc thực hiện hành vi quan hệ tình dục khác với người từ đủ 13 tuổi đến dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS039', 'Tội dâm ô đối với người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS040', 'Tội sử dụng người dưới 16 tuổi vào mục đích khiêu dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS041', 'Tội lây truyền HIV cho người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS042', 'Tội cố ý truyền HIV cho người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS043', 'Tội mua bán người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS044', 'Tội mua bán người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS045', 'Tội đánh tráo người dưới 01 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS046', 'Tội chiếm đoạt người dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS047', 'Tội mua bán, chiếm đoạt mô hoặc bộ phận cơ thể người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS048', 'Tội làm nhục người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS049', 'Tội vu khống', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS050', 'Tội bắt, giữ hoặc giam người trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS051', 'Tội xâm phạm chỗ ở của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS052', 'Tội xâm phạm bí mật hoặc an toàn thư tín, điện thoại, điện tín hoặc hình thức trao đổi thông tin riêng tư khác của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS053', 'Tội xâm phạm quyền của công dân về bầu cử, ứng cử hoặc biểu quyết khi Nhà nước trưng cầu ý dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS054', 'Tội làm sai lệch kết quả bầu cử, kết quả trưng cầu ý dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS055', 'Tội buộc công chức, viên chức thôi việc hoặc sa thải người lao động trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS056', 'Tội xâm phạm quyền hội họp, lập hội của công dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS057', 'Tội xâm phạm quyền tự do tín ngưỡng, tôn giáo của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS058', 'Tội xâm phạm quyền bình đẳng giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS059', 'Tội xâm phạm quyền khiếu nại, tố cáo', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS060', 'Tội xâm phạm quyền tự do ngôn luận, tự do báo chí, tiếp cận thông tin, quyền biểu tình của công dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS061', 'Tội cướp tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS062', 'Tội bắt cóc nhằm chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS063', 'Tội cưỡng đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS064', 'Tội cướp giật tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS065', 'Tội công nhiên chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS066', 'Tội trộm cắp tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS067', 'Tội lừa đảo chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS068', 'Tội lạm dụng tín nhiệm chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS069', 'Tội chiếm giữ trái phép tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS070', 'Tội sử dụng trái phép tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS071', 'Tội hủy hoại hoặc cố ý làm hư hỏng tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS072', 'Tội thiếu trách nhiệm gây thiệt hại đến tài sản của Nhà nước, cơ quan, tổ chức, doanh nghiệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS073', 'Tội vô ý gây thiệt hại nghiêm trọng đến tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS074', 'Tội cưỡng ép kết hôn, ly hôn hoặc cản trở hôn nhân tự nguyện, tiến bộ, cản trở ly hôn tự nguyện', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS075', 'Tội vi phạm chế độ một vợ, một chồng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS076', 'Tội tổ chức tảo hôn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS077', 'Tội loạn luân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS078', 'Tội ngược đãi hoặc hành hạ ông bà, cha mẹ, vợ chồng, con, cháu hoặc người có công nuôi dưỡng mình', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS079', 'Tội từ chối hoặc trốn tránh nghĩa vụ cấp dưỡng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS080', 'Tội tổ chức mang thai hộ vì mục đích thương mại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS081', 'Tội buôn lậu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS082', 'Tội vận chuyển trái phép hàng hóa, tiền tệ qua biên giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS083', 'Tội sản xuất, buôn bán hàng cấm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS084', 'Tội tàng trữ, vận chuyển hàng cấm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS085', 'Tội sản xuất, buôn bán hàng giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS086', 'Tội sản xuất, buôn bán hàng giả là lương thực, thực phẩm, phụ gia thực phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS087', 'Tội sản xuất, buôn bán hàng giả là thuốc chữa bệnh, thuốc phòng bệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS088', 'Tội sản xuất, buôn bán hàng giả là thức ăn dùng để chăn nuôi, phân bón, thuốc thú y, thuốc bảo vệ thực vật, giống cây trồng, giống vật nuôi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS089', 'Tội đầu cơ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS090', 'Tội quảng cáo gian dối', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS091', 'Tội lừa dối khách hàng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS092', 'Tội vi phạm quy định về cung ứng điện', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS093', 'Tội trốn thuế', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS094', 'Tội cho vay lãi nặng trong giao dịch dân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS095', 'Tội làm, buôn bán tem giả, vé giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS096', 'Tội in, phát hành, mua bán trái phép hóa đơn, chứng từ thu nộp ngân sách nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS097', 'Tội vi phạm quy định về bảo quản, quản lý hóa đơn, chứng từ thu nộp ngân sách nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS098', 'Tội lập quỹ trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS099', 'Tội vi phạm quy định về hoạt động ngân hàng, hoạt động khác liên quan đến hoạt động ngân hàng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS100', 'Tội làm, tàng trữ, vận chuyển, lưu hành tiền giả', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS101', 'Tội làm, tàng trữ, vận chuyển, lưu hành công cụ chuyển nhượng giả hoặc các giấy tờ có giá giả khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS102', 'Tội cố ý công bố thông tin sai lệch hoặc che giấu thông tin trong hoạt động chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS103', 'Tội sử dụng thông tin nội bộ để mua bán chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS104', 'Tội thao túng thị trường chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS105', 'Tội làm giả tài liệu trong hồ sơ chào bán, niêm yết chứng khoán', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS106', 'Tội gian lận trong kinh doanh bảo hiểm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS107', 'Tội gian lận bảo hiểm xã hội, bảo hiểm thất nghiệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS108', 'Tội gian lận bảo hiểm y tế', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS109', 'Tội trốn đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp cho người lao động', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS110', 'Tội vi phạm quy định về cạnh tranh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS111', 'Tội vi phạm quy định về kinh doanh theo phương thức đa cấp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS112', 'Tội vi phạm quy định về hoạt động bán đấu giá tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS113', 'Tội vi phạm quy định về quản lý, sử dụng tài sản Nhà nước gây thất thoát, lãng phí', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS114', 'Tội vi phạm quy định172 về quản lý và sử dụng vốn đầu tư công gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS115', 'Tội vi phạm quy định174 về kế toán gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS116', 'Tội vi phạm quy định về đấu thầu gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS117', 'Tội thông đồng, bao che cho người nộp thuế gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS118', 'Tội vi phạm quy định về đầu tư công trình xây dựng gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS119', 'Tội xâm phạm quyền tác giả, quyền liên quan', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS120', 'Tội xâm phạm quyền Sở hữu công nghiệp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS121', 'Tội vi phạm quy định về nghiên cứu, thăm dò, khai thác tài nguyên', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS122', 'Tội vi phạm các quy định về sử dụng đất đai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS123', 'Tội vi phạm các quy định về quản lý đất đai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS124', 'Tội vi phạm quy định về bồi thường, hỗ trợ, tái định cư khi Nhà nước thu hồi đất', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS125', 'Tội cố ý làm trái quy định về phân phối tiền, hàng cứu trợ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS126', 'Tội vi phạm quy định về khai thác, bảo vệ rừng và lâm sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS127', 'Tội vi phạm quy định về quản lý rừng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS128', 'Tội vi phạm quy định về bảo vệ động vật hoang dã', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS129', 'Tội gây ô nhiễm môi trường', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS130', 'Tội vi phạm quy định về quản lý chất thải nguy hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS131', 'Tội vi phạm quy định về phòng ngừa, ứng phó, khắc phục sự cố môi trường', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS132', 'Tội vi phạm quy định về bảo vệ an toàn công trình thủy lợi, đê điều và phòng, chống thiên tai; vi phạm quy định về bảo vệ bờ, bãi sông', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS133', 'Tội đưa chất thải vào lãnh thổ Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS134', 'Tội làm lây lan dịch bệnh truyền nhiễm nguy hiểm cho người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS135', 'Tội làm lây lan dịch bệnh nguy hiểm cho động vật, thực vật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS136', 'Tội hủy hoại nguồn lợi thủy sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS137', 'Tội hủy hoại rừng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS138', 'Tội vi phạm quy định về bảo vệ động vật nguy cấp, quý, hiếm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS139', 'Tội vi phạm 234 quy định về quản lý khu bảo tồn thiên nhiên', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS140', 'Tội nhập khẩu, phát tán các loài ngoại lai xâm hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS141', 'Tội trồng cây thuốc phiện, cây côca, cây cần sa hoặc các loại cây khác có chứa chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS142', 'Tội sản xuất trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS143', 'Tội tàng trữ trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS144', 'Tội vận chuyển trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS145', 'Tội mua bán trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS146', 'Tội chiếm đoạt chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS147', 'Tội tàng trữ, vận chuyển, mua bán hoặc chiếm đoạt tiền chất dùng vào việc sản xuất trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS148', 'Tội sản xuất, tàng trữ, vận chuyển hoặc mua bán phương tiện, dụng cụ dùng vào việc sản xuất hoặc sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS149', 'Tội tổ chức sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS150', 'Tội chứa chấp việc sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS151', 'Tội cưỡng bức người khác sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS152', 'Tội lôi kéo người khác sử dụng trái phép chất ma túy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS153', 'Tội vi phạm quy định về quản lý chất ma túy, tiền chất, thuốc gây nghiện, thuốc hướng thần', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS154', 'Tội vi phạm quy định về tham gia giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS155', 'Tội cản trở giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS156', 'Tội đưa vào sử dụng phương tiện giao thông cơ giới đường bộ, xe máy chuyên dùng không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS157', 'Tội điều động người không đủ điều kiện điều khiển phương tiện tham gia giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS158', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện tham gia giao thông đường bộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS159', 'Tội tổ chức đua xe trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS160', 'Tội đua xe trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS161', 'Tội vi phạm quy định về điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS162', 'Tội cản trở giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS163', 'Tội đưa vào sử dụng phương tiện, thiết bị giao thông đường sắt không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS164', 'Tội điều động người không đủ điều kiện điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS165', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện giao thông đường sắt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS166', 'Tội vi phạm quy định về điều khiển phương tiện giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS167', 'Tội cản trở giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS168', 'Tội đưa vào sử dụng phương tiện giao thông đường thủy không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS169', 'Tội điều động người không đủ điều kiện điều khiển phương tiện giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS170', 'Tội giao cho người không đủ điều kiện điều khiển phương tiện giao thông đường thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS171', 'Tội vi phạm quy định về điều khiển tàu bay', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS172', 'Tội cản trở giao thông đường không', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS173', 'Tội đưa vào sử dụng tàu bay, thiết bị bảo đảm hoạt động bay không bảo đảm an toàn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS174', 'Tội điều động hoặc giao cho người không đủ điều kiện điều khiển tàu bay', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS175', 'Tội vi phạm quy định về duy tu, sửa chữa, quản lý công trình giao thông', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS176', 'Tội chiếm đoạt tàu bay, tàu thủy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS177', 'Tội điều khiển tàu bay vi phạm quy định về hàng không của nước Cộng hòa xã hội chủ nghĩa Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS178', 'Tội điều khiển phương tiện hàng hải vi phạm quy định về hàng hải của nước Cộng hòa xã hội chủ nghĩa Việt Nam', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS179', 'Tội sản xuất, mua bán, trao đổi hoặc tặng cho công cụ, thiết bị, phần mềm để sử dụng vào mục đích trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS180', 'Tội phát tán chương trình tin học gây hại cho hoạt động của mạng máy tính, mạng viễn thông, phương tiện điện tử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS181', 'Tội cản trở hoặc gây rối loạn hoạt động của mạng máy tính, mạng viễn thông, phương tiện điện tử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS182', 'Tội đưa hoặc sử dụng trái phép thông tin mạng máy tính, mạng viễn thông', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS183', 'Tội xâm nhập trái phép vào mạng máy tính, mạng viễn thông hoặc phương tiện điện tử của người khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS184', 'Tội sử dụng mạng máy tính, mạng viễn thông, phương tiện điện tử thực hiện hành vi chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS185', 'Tội thu thập, tàng trữ, trao đổi, mua bán, công khai hóa trái phép thông tin về tài khoản ngân hàng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS186', 'Tội sử dụng trái phép tần số vô tuyến điện dành riêng cho mục đích cấp cứu, an toàn, tìm kiếm, cứu hộ, cứu nạn, quốc phòng, an ninh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS187', 'Tội cố ý gây nhiễu có hại', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS188', 'Tội vi phạm quy định về an toàn lao động, vệ sinh lao động, về an toàn ở nơi đông người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS189', 'Tội vi phạm quy định về sử dụng người lao động dưới 16 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS190', 'Tội cưỡng bức lao động', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS191', 'Tội vi phạm quy định về xây dựng gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS192', 'Tội khủng bố', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS193', 'Tội tài trợ khủng bố', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS194', 'Tội bắt cóc con tin', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS195', 'Tội cướp biển', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS196', 'Tội phá hủy công trình, cơ sở, phương tiện quan trọng về an ninh quốc gia', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS197', 'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt vũ khí quân dụng, phương tiện kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS198', 'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt vật liệu nổ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS199', 'Tội chế tạo, tàng trữ, vận chuyển, sử dụng, mua bán trái phép hoặc chiếm đoạt súng săn, vũ khí thô sơ, vũ khí thể thao hoặc công cụ hỗ trợ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS200', 'Tội vi phạm quy định về quản lý vũ khí, vật liệu nổ, công cụ hỗ trợ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS201', 'Tội thiếu trách nhiệm trong việc giữ vũ khí, vật liệu nổ, công cụ hỗ trợ gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS202', 'Tội sản xuất, tàng trữ, vận chuyển, sử dụng, phát tán, mua bán trái phép hoặc chiếm đoạt chất phóng xạ, vật liệu hạt nhân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS203', 'Tội vi phạm quy định về quản lý chất phóng xạ, vật liệu hạt nhân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS204', 'Tội sản xuất, tàng trữ, vận chuyển, sử dụng hoặc mua bán trái phép chất cháy, chất độc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS205', 'Tội vi phạm quy định về quản lý chất cháy, chất độc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS206', 'Tội vi phạm quy định về phòng cháy, chữa cháy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS207', 'Tội vi phạm quy định về an toàn vận hành công trình điện lực', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS208', 'Tội vi phạm quy định về khám bệnh, chữa bệnh, sản xuất, pha chế, cấp phát, bán thuốc hoặc dịch vụ y tế khác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS209', 'Tội phá thai trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS210', 'Tội vi phạm quy định về an toàn thực phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS211', 'Tội gây rối trật tự công cộng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS212', 'Tội xâm phạm thi thể, mồ mả, hài cốt', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS213', 'Tội hành nghề mê tín, dị đoan', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS214', 'Tội đánh bạc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS215', 'Tội tổ chức đánh bạc hoặc gá bạc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS216', 'Tội chứa chấp hoặc tiêu thụ tài sản do người khác phạm tội mà có', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS217', 'Tội rửa tiền', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS218', 'Tội dụ dỗ, ép buộc hoặc chứa chấp người dưới 18 tuổi phạm pháp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS219', 'Tội truyền bá văn hóa phẩm đồi trụy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS220', 'Tội chứa mại dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS221', 'Tội môi giới mại dâm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS222', 'Tội mua dâm người dưới 18 tuổi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS223', 'Tội chống người thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS224', 'Tội lợi dụng các quyền tự do dân chủ xâm phạm lợi ích của Nhà nước, quyền, lợi ích hợp pháp của tổ chức, cá nhân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS225', 'Tội trốn tránh nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS226', 'Tội không chấp hành lệnh gọi quân nhân dự bị nhập ngũ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS227', 'Tội làm trái quy định về việc thực hiện nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS228', 'Tội cản trở việc thực hiện nghĩa vụ quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS229', 'Tội đăng ký hộ tịch trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS230', 'Tội cố ý làm lộ bí mật nhà nước; tội chiếm đoạt, mua bán hoặc tiêu hủy vật hoặc tài liệu bí mật nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS231', 'Tội vô ý làm lộ bí mật nhà nước; tội làm mất vật, tài liệu bí mật nhà nước', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS232', 'Tội giả mạo chức vụ, cấp bậc, vị trí công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS233', 'Tội sửa chữa và sử dụng giấy chứng nhận, các tài liệu của cơ quan, tổ chức', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS234', 'Tội làm giả con dấu, tài liệu của cơ quan, tổ chức; tội sử dụng con dấu hoặc tài liệu giả của cơ quan, tổ chức', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS235', 'Tội chiếm đoạt, mua bán, tiêu hủy con dấu, tài liệu của cơ quan, tổ chức', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS236', 'Tội vi phạm các quy định về quản lý nhà ở', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS237', 'Tội vi phạm quy định về hoạt động xuất bản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS238', 'Tội vi phạm các quy định về bảo vệ và sử dụng di tích lịch sử - văn hóa, danh lam, thắng cảnh gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS239', 'Tội vi phạm quy chế về khu vực biên giới', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS240', 'Tội vi phạm quy định về xuất cảnh, nhập cảnh; tội ở lại Việt Nam trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS241', 'Tội tổ chức, môi giới cho người khác xuất cảnh, nhập cảnh hoặc ở lại Việt Nam trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS242', 'Tội tổ chức, môi giới cho người khác trốn đi nước ngoài hoặc ở lại nước ngoài trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS243', 'Tội cưỡng ép người khác trốn đi nước ngoài hoặc ở lại nước ngoài trái phép', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS244', 'Tội xúc phạm Quốc kỳ, Quốc huy, Quốc ca', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS245', 'Khái niệm tội phạm về chức vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS246', 'Tội tham ô tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS247', 'Tội nhận hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS248', 'Tội lạm dụng chức vụ, quyền hạn chiếm đoạt tài sản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS249', 'Tội lợi dụng chức vụ, quyền hạn trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS250', 'Tội lạm quyền trong khi thi hành công vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS251', 'Tội lợi dụng chức vụ, quyền hạn gây ảnh hưởng đối với người khác để trục lợi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS252', 'Tội giả mạo trong công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS253', 'Tội thiếu trách nhiệm gây hậu quả nghiêm trọng', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS254', 'Tội cố ý làm lộ bí mật công tác; tội chiếm đoạt, mua bán hoặc tiêu hủy tài liệu bí mật công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS255', 'Tội vô ý làm lộ bí mật công tác; tội làm mất tài liệu bí mật công tác', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS256', 'Tội đào nhiệm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS257', 'Tội đưa hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS258', 'Tội môi giới hối lộ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS259', 'Tội lợi dụng ảnh hưởng đối với người có chức vụ, quyền hạn để trục lợi', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS260', 'Khái niệm tội xâm phạm hoạt động tư pháp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS261', 'Tội truy cứu trách nhiệm hình sự người không có tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS262', 'Tội không truy cứu trách nhiệm hình sự người có tội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS263', 'Tội ra bản án trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS264', 'Tội ra quyết định trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS265', 'Tội ép buộc người có thẩm quyền trong hoạt động tư pháp làm trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS266', 'Tội dùng nhục hình', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS267', 'Tội bức cung', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS268', 'Tội làm sai lệch hồ sơ vụ án, vụ việc', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS269', 'Tội thiếu trách nhiệm để người bị bắt, người bị tạm giữ, tạm giam, người đang chấp hành án phạt tù trốn', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS270', 'Tội lợi dụng chức vụ, quyền hạn bắt, giữ, giam người trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS271', 'Tội tha trái pháp luật người bị bắt, người đang bị tạm giữ, tạm giam, người đang chấp hành án phạt tù', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS272', 'Tội không thi hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS273', 'Tội không chấp hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS274', 'Tội cản trở việc thi hành án', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS275', 'Tội cung cấp tài liệu sai sự thật hoặc khai báo gian dối', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS276', 'Tội từ chối khai báo, từ chối kết luận giám định, định giá tài sản hoặc từ chối cung cấp tài liệu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS277', 'Tội mua chuộc hoặc cưỡng ép người khác trong việc khai báo, cung cấp tài liệu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS278', 'Tội vi phạm việc niêm phong, kê biên tài sản, phong tỏa tài khoản', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS279', 'Tội trốn khỏi nơi giam, giữ hoặc trốn khi đang bị áp giải, đang bị xét xử', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS280', 'Tội đánh tháo người bị bắt, bị tạm giữ, tạm giam, người đang bị áp giải, xét xử, chấp hành án phạt tù', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS281', 'Tội vi phạm quy định về giam giữ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS282', 'Tội che giấu tội phạm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS283', 'Tội không tố giác tội phạm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS284', 'Tội gây rối trật tự phiên tòa, phiên họp', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS285', 'Những người phải chịu trách nhiệm hình sự về các tội xâm phạm nghĩa vụ, trách nhiệm của quân nhân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS286', 'Tội ra mệnh lệnh trái pháp luật', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS287', 'Tội chống mệnh lệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS288', 'Tội chấp hành không nghiêm chỉnh mệnh lệnh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS289', 'Tội cản trở đồng đội thực hiện nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS290', 'Tội làm nhục đồng đội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS291', 'Tội hành hung đồng đội', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS292', 'Tội đầu hàng địch', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS293', 'Tội khai báo hoặc tự nguyện làm việc cho địch khi bị bắt làm tù binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS294', 'Tội bỏ vị trí chiến đấu hoặc không làm nhiệm vụ trong chiến đấu', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS295', 'Tội đào ngũ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS296', 'Tội trốn tránh nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS297', 'Tội cố ý làm lộ bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS298', 'Tội chiếm đoạt, mua bán hoặc tiêu hủy tài liệu bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS299', 'Tội vô ý làm lộ bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS300', 'Tội làm mất tài liệu bí mật công tác quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS301', 'Tội báo cáo sai', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS302', 'Tội vi phạm quy định về trực ban, trực chiến, trực chỉ huy', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS303', 'Tội vi phạm quy định về bảo vệ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS304', 'Tội vi phạm các quy định về bảo đảm an toàn trong chiến đấu hoặc trong huấn luyện', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS305', 'Tội vi phạm quy định về sử dụng vũ khí quân dụng, trang bị kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS306', 'Tội hủy hoại hoặc cố ý làm hư hỏng vũ khí quân dụng, trang bị kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS307', 'Tội làm mất hoặc vô ý làm hư hỏng vũ khí quân dụng, phương tiện kỹ thuật quân sự', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS308', 'Tội quấy nhiễu nhân dân', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS309', 'Tội lạm dụng nhu cầu quân sự trong khi thực hiện nhiệm vụ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS310', 'Tội cố ý bỏ thương binh, tử sĩ hoặc không chăm sóc, cứu chữa thương binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS311', 'Tội chiếm đoạt hoặc hủy hoại di vật của tử sĩ', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS312', 'Tội chiếm đoạt hoặc hủy hoại chiến lợi phẩm', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS313', 'Tội ngược đãi tù binh, hàng binh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS314', 'Tội phá hoại hòa bình, gây chiến tranh xâm lược', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS315', 'Tội chống loài người', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS316', 'Tội phạm chiến tranh', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS317', 'Tội tuyển mộ, huấn luyện hoặc sử dụng lính đánh thuê', 'L01', 'N01');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HS318', 'Tội làm lính đánh thuê', 'L01', 'N01');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS001', 'Tranh chấp giữa cá nhân với cá nhân vê quốc tịch Việt Nam', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS002', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Kiện đòi tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS003', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Tranh chấp về quyền sở hữu tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS004', 'Tranh chấp về quyền sở hữu và các quyền khác đối với tài sản - Các quyền khác đối với tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS005', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mua bán tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS006', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mua bán nhà', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS007', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng trao đổi tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS008', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng tặng cho tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS009', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng vay tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS010', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng tín dụng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS011', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về hụi, họ, biêu, phường', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS012', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS013', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê nhà', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS014', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng thuê khoán tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS015', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng mượn tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS016', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng hợp tác', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS017', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng dịch vụ', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS018', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng vận chuyển', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS019', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng bảo hiểm', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS020', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng gia công', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS021', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng gửi giữ tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS022', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp hợp đồng uỷ quyền', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS023', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về hợp đồng sử dụng tác phẩm', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS024', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về Hứa thưởng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS025', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp về Thi có giải', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS026', 'Tranh chấp về giao dịch dân sự, hợp đồng dân sự - Tranh chấp khác', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS027', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền tác giả - Tranh chấp về quyền liên quan đến tác phẩm văn học, nghệ thuật, khoa học', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS028', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền tác giả - Tranh chấp về quyền liên quan đến tác giả', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS029', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Sáng chế, giải pháp hữu ích', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS030', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Kiểu dáng công nghiệp', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS031', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Thiết kế bố trí mạch tích hợp bán dẫn', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS032', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Bí mật kinh doanh', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS033', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Nhãn hiệu', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS034', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về sở hữu công nghiệp - Tên thương mại và chỉ dẫn địa lý', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS035', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về quyền đối với giống cây trồng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS036', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ - Tranh chấp về hợp đồng chuyển giao công nghệ', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS037', 'Tranh chấp về thừa kế tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS038', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại về tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS039', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại sức khỏe, tính mạng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS040', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại về danh dự, nhân phẩm, uy tín', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS041', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Các thiệt hại khác trong lĩnh vực sản xuất kinh doanh, vệ sinh môi trường...', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS042', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Thiệt hại do vi phạm quyền lợi của người tiêu dùng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS043', 'Đòi bồi thường thiệt hại ngoài hợp đồng - Các thiệt hại khác', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS044', 'Thiệt hại do Tòa án áp dụng biện pháp khẩn cấp tạm thời không đúng - Theo khoản 1 Điều 113', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS045', 'Thiệt hại do Tòa án áp dụng biện pháp khẩn cấp tạm thời không đúng - Theo khoản 2 Điều 113', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS046', 'Tranh chấp về bồi thường hiệt hại do áp dụng biện pháp ngăn chặn hành chính không đúng theo quy định của pháp luật về cạnh tranh', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS047', 'Tranh chấp về khai thác, sử dụng tài nguyên nước, xả thải vào nguồn nước theo quy định của Luật tài nguyên nước', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS048', 'Tranh chấp đất đai - Tranh chấp hợp đồng chuyển đổi qsd đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS049', 'Tranh chấp đất đai - Tranh chấp hợp đồng chuyển nhượng qsd đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS050', 'Tranh chấp đất đai - Tranh chấp hợp đồng thuê qsd đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS051', 'Tranh chấp đất đai - Tranh chấp hợp đồng thế chấp qsd đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS052', 'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS053', 'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất - Đối với đất nông nghiệp để trồng cây hàng năm, nuôi trồng thủy sản.', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS054', 'Tranh chấp đất đai - Tranh chấp thừa kế qsd đất - Đối với đất nông nghiệp để trồng cây lâu năm, đất lâm nghiệp để trồng rừng, đất ở.', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS055', 'Tranh chấp đất đai - Đòi đất cho mượn, cho sử dụng nhờ, lấn chiếm...', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS056', 'Tranh chấp đất đai - Tranh chấp quyền sử dụng đất', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS057', 'Tranh chấp đất đai - Tranh chấp quyền sử dụng rừng và đất rừng', 'L02', 'N04');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS058', 'Tranh chấp liên quan đến hoạt động nghiệp vụ báo chí theo quy định của pháp luật về báo chí', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS059', 'Tranh chấp liên quan đến yêu cầu tuyên bố văn bản công chứng vô hiệu', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS060', 'Tranh chấp liên quan đến tài sản bị cưỡng chế để thi hành án theo quy định của pháp luật về thi hành án dân sự', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS061', 'Tranh chấp về kết quả bán đấu giá tài sản, thanh toán phí tổn đăng ký mua tài sản bán đấu giá theo quy định của pháp luật về thi hành án dân sự', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS062', 'Các tranh chấp dân sự trong trường hợp chưa có điều luật áp dụng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS063', 'Các tranh chấp dân sự khác', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS064', 'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người mất năng lực hành vi dân sự, bị hạn chế năng lực hành vi dân sự hoặc có khó khăn trong nhận thức, làm chủ hành vi', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS065', 'Yêu cầu thông báo tìm kiếm người vắng mặt tại nơi cư trú và quản lý tài sản của người đó', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS066', 'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người mất tích', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS067', 'Yêu cầu tuyên bố hoặc hủy bỏ quyết định tuyên bố một người là đã chết', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS068', 'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án, quyết định về dân sự', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS069', 'Yêu cầu không công nhận bản án, quyết định về dân sự, quyết định về tài sản trong bản án, quyết định', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS070', 'Yêu cầu tuyên bố văn bản công chứng vô hiệu', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS071', 'Yêu cầu công nhận kết quả hòa giải thành ngoài Tòa án', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS072', 'Yêu cầu công nhận tài sản có trên lãnh thổ Việt Nam là vô chủ', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS073', 'Yêu cầu xác định quyền sở hữu, quyền sử dụng tài sản', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS074', 'Các yêu cầu dân sự trong trường hợp chưa có điều luật để áp dụng', 'L02', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('DS075', 'Các yêu cầu dân sự khác', 'L02', 'N05');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN001', 'Vụ án ly hôn - Mâu thuẫn gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN002', 'Vụ án ly hôn - Bạo lực gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN003', 'Vụ án ly hôn - Ngoại tình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN004', 'Vụ án ly hôn - Bệnh tật, không có con', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN005', 'Vụ án ly hôn - Do nghiện ma tuý, rượu chè, cờ bạc', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN006', 'Vụ án ly hôn - Một bên ở nước ngoài', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN007', 'Vụ án ly hôn - Một bên bị mất tích', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN008', 'Vụ án ly hôn - Mâu thuẫn về kinh tế', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN009', 'Vụ án ly hôn - Các nguyên nhân khác', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN010', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản khi ly hôn', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN011', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản sau khi ly hôn', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN012', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về chia tài sản chung của vợ chồng trong thời kỳ hôn nhân', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN013', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về thay đổi người trực tiếp nuôi con sau khi ly hôn', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN014', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về xác định cha, mẹ cho con hoặc con cho cha mẹ', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN015', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về cấp dưỡng', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN016', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về sinh con bằng kỹ thuật hỗ trợ sinh sản, mang thai hộ vì mục đích nhân đạo', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN017', 'Vụ án liên quan đến Hôn nhân và gia đình - Tranh chấp về nuôi con, chia tài sản của nam, nữ chung sống với nhau như vợ chồng mà không đăng ký kết hôn hoặc hủy kết hôn trái pháp luật', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN018', 'Tranh chấp về hôn nhân gia đình trong trường hợp chưa có điều luật áp dụng', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN019', 'Yêu cầu huỷ việc kết hôn trái pháp luật', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN020', 'Yêu cầu công nhận thuận tình ly hôn, thỏa thuận nuôi con, chia tài sản khi ly hôn', 'L03', 'N03');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN021', 'Yêu cầu công nhận thoả thuận về thay đổi người trực tiếp nuôi con sau khi ly hôn hoặc công nhận việc thay đổi người trực tiếp nuôi con sau khi ly hôn của cơ quan, tổ chức, cá nhân theo quy định của pháp luật về hôn nhân và gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN022', 'Yêu cầu hạn chế quyền cha, mẹ đối với con chưa thành niên hoặc quyền thăm nom con sau khi ly hôn', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN023', 'Yêu cầu nhằm chấm dứt việc nuôi con nuôi', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN024', 'Yêu cầu liên quan đến việc mang thai hộ theo quy định của pháp luật về hôn nhân và gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN025', 'Yêu cầu công nhận thỏa thuận chấm dứt hiệu lực của việc chia tài sản chung trong thời kỳ hôn nhân đã được thực hiện theo bản án, quyết định của Tòa án', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN026', 'Yêu cầu tuyên bố vô hiệu thỏa thuận về chế độ tài sản của vợ chồng theo quy định của pháp luật hôn nhân và gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN027', 'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án, quyết định về hôn nhân và gia đình của Tòa án nước ngoài hoặc cơ quan khác', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN028', 'Yêu cầu không công nhận bản án, quyết định về hôn nhân và gia đình của Tòa án nước ngoài hoặc cơ quan khác', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN029', 'Yêu cầu xác định cha, mẹ cho con hoặc con cho cha mẹ theo quy định của pháp luật về hôn nhân và gia đình', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN030', 'Các yêu cầu hôn nhân gia đình trong trường hợp chưa có điều luật áp dụng', 'L03', 'N02');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HN031', 'Các yêu cầu hôn nhân gia đình khác', 'L03', 'N02');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT001', 'Mua bán hàng hoá', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT002', 'Gia công hàng hóa', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT003', 'Cung ứng dịch vụ', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT004', 'Phân phối', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT005', 'Đại diện, đại lý', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT006', 'Ký gửi', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT007', 'Ký quỹ', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT008', 'Cầm giữ tài sản', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT009', 'Bảo lãnh', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT010', 'Thế chấp', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT011', 'Đặt cọc', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT012', 'Thuê, cho thuê, thuê mua', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT013', 'Xây dựng', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT014', 'Tư vấn kỹ thuật', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT015', 'Vận chuyển hàng hoá, hành khách bằng đường sắt, đường bộ, đường thủy nội địa', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT016', 'Vận chuyển hàng hoá, hành khách bằng đường hàng không, đường biển', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT017', 'Mua bán cổ phiếu, trái phiếu và giấy tờ có giá khác', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT018', 'Đầu tư tài chính, ngân hàng', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT019', 'Bảo hiểm', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT020', 'Liên doanh liên kết', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT021', 'Hợp đồng đầu tư', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT022', 'Hợp đồng quảng cáo', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT023', 'Thăm dò, khai thác', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT024', 'Tranh chấp về quyền sở hữu trí tuệ, chuyển giao công nghệ giữa cá nhân, tổ chức với nhau', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT025', 'Tranh chấp giữa người chưa phải là thành viên công ty nhưng có giao dịch về chuyển nhượng phần vốn góp với công ty, thành viên công ty', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT026', 'Tranh chấp giữa công ty với các thành viên của công ty', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT027', 'Tranh chấp giữa công ty với người quản lý trong công ty', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT028', 'Các tranh chấp kinh doanh thương mại trong trường hợp chưa có điều luật để áp dụng', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT029', 'Các tranh chấp kinh doanh thương mại khác', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT030', 'Yêu cầu hủy bỏ nghị quyết của Đại hội đồng cổ đông, nghị quyết của Hội đồng thành viên theo quy định của pháp luật về doanh nghiệp', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT031', 'Yêu cầu liên quan việc trọng tài thương mại Việt Nam giải quyết tranh chấp theo quy định của pháp luật về Trọng tài thương mại', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT032', 'Yêu cầu bắt giữ tàu bay, tàu biển theo quy định của pháp luật hàng không dân dụng Việt Nam, về hàng hải VN, trừ trường hợp bắt giữ tàu bay, tàu biển để bảo đảm giải quyết vụ án', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT033', 'Yêu cầu công nhận và cho thi hành tại Việt Nam bản án quyết định kinh doanh, thương mại của Toà án nước ngoài', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT034', 'Yêu cầu không công nhận bản án, quyết định kinh doanh thương mại của Tòa án nước ngoài không có yêu cầu thi hành tại Việt Nam', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT035', 'Yêu cầu công nhận và cho thi hành tại Việt Nam phán quyết kinh doanh, thương mại của Trọng tài nước ngoài', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT036', 'Yêu cầu công nhận và cho thi hành quyết định giải quyết phá sản của Tòa án nước ngoài tại Việt Nam', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT037', 'Các yêu cầu kinh doanh thương mại trong trường hợp chưa có điều luật để áp dụng', 'L04', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('KT038', 'Các yêu cầu kinh doanh thương mại khác', 'L04', 'N05');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD001', 'Về xử lý kỷ luật, sa thải, đơn phương chấm dứt hợp đồng lao động', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD002', 'Về bồi thường thiệt hại, trợ cấp khi chấm dứt hợp đồng lao động', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD003', 'Giữa người giúp việc gia đình với người sử dụng lao động', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD004', 'Về bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, bảo hiểm tai nạn lao động, bệnh nghề nghiệp', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD005', 'Về bồi thường thiệt hại giữa người lao động với doanh nghiệp, đơn vị sự nghiệp công lập đưa người lao động đi làm việc ở nước ngoài theo hợp đồng', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD006', 'Về quyền, lợi ích liên quan đến việc làm, tiền lương...', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD007', 'Về việc thực hiện thoả ước lao động tập thể', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD008', 'Về quyền thành lập, gia nhập, hoạt động công đoàn', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD009', 'Về học nghề, tập nghề', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD010', 'Về cho thuê lại lao động', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD011', 'Về quyền công đoàn, kinh phí công đoàn', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD012', 'Về an toàn lao động, vệ sinh lao động', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD013', 'Về bồi thường thiệt hại do đình công bất hợp pháp', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD014', 'Các tranh chấp lao động trong trường hợp chưa có điều luật áp dụng', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD015', 'Các tranh chấp lao động khác', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD016', 'Yêu cầu tuyên bố hợp đồng lao động, thỏa ước lao động tập thể vô hiệu', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD017', 'Yêu cầu xét tính hợp pháp của cuộc đình công', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD018', 'Yêu cầu công nhận và cho thi hành án tại Việt Nam bản án, quyết định lao động của Tòa án nước ngoài', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD019', 'Yêu cầu không công nhận bản án, quyết định lao động của Tòa án nước ngoài không có yêu cầu thi hành tại Việt Nam', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD020', 'Yêu cầu công nhận và cho thi hành tại Việt Nam phán quyết lao động của Trọng tài nước ngoài', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD021', 'Các yêu cầu lao động trong trường hợp chưa có điều luật áp dụng', 'L05', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('LD022', 'Các yêu cầu lao động khác', 'L05', 'N05');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC001', 'QĐ xử phạt vi phạm hành chính', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC002', 'QĐ áp dụng các biện pháp ngăn chặn và bảo đảm việc xử lý vi phạm hành chính', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC003', 'QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp cưỡng chế thi hành quyết định xừ phạt vi phạm hành chính', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC004', 'QĐ hành chính, hành vi hành chính trong việc áp dụng hoặc thi hành biện pháp xử lý hành chính bằng một trong các hình thức giáo dục tại xã, phường, thị trấn; đưa vào trường giáo dưỡng; đưa vào cơ sở giáo dục; đưa vào cơ sở chữa bệnh; quản chế hành chính', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC005', 'QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp buộc tháo dỡ nhà ở, công trình, vật kiến trúc kiên cố khác', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC006', 'QĐ hành chính, hành vi hành chính trong việc cấp, thu hồi giấy phép về xây dựng cơ bản, sản xuất, kinh doanh; giấy chứng nhận đăng ký kinh doanh và chứng chỉ hành nghề hoặc khiếu kiện QĐ hành chính, hành vi hành chính khác liên quan đến hoạt động kinh doanh, tài chính của thương nhân', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC007', 'QĐ hành chính, hành vi hành chính liên quan đến thương mại hàng hoá quốc tế hoặc trong nước', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC008', 'QĐ hành chính, hành vi hành chính liên quan đến chuyển giao tài chính trong nước và quôc tế, dịch vụ và cung ứng dịch vụ', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC009', 'QĐ hành chính, hành vi hành chính trong việc trưng dụng, trưng mua, tịch thu tài sản', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC010', 'QĐ hành chính, hành vi hành chính trong việc áp dụng thuế, thu thuế, truy thu thuế', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC011', 'QĐ hành chính, hành vi hành chính trong việc áp dụng phí, thu phí, lệ phí; thu tiền sử dụng đất', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC012', 'QĐ hành chính, hành vi hành chính trong quản lý nhà nước về sở hữu trí tuệ và chuyển giao công nghệ', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC013', 'QĐ hành chính, hành vi hành chính trong quản lý nhà nước về đầu tư', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC014', 'QĐ hành chính, hành vi hành chính của cơ quan hải quan, công chức hải quan', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC015', 'QĐ hành chính, hành vi hành chính về quản lý hộ tịch', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC016', 'QĐ hành chính, hành vi hành chính đối với việc từ chối công chứng, chứng thực', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC017', 'QĐ hành chính, hành vi hành chính về quản lý đất đai trong trường hợp giao đất, cho thuê đất, thu hồi đất, trưng dụng đất, cho phép chuyển mục đích sử dụng đất; bồi thường, hỗ trợ, giải phóng mặt bằng, tái định cư; cấp hoặc thu hồi giấy chứng nhận quyền sử dụng đất; gia hạn thời hạn sử dụng đất', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC018', 'Về danh sách cử tri', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC019', 'QĐ kỷ luật buộc thôi việc công chức giữ giữ chức vụ từ Tổng cục trưởng và tương đương trở xuống', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC020', 'QĐ của Chủ tịch UBND tỉnh, thành phố trực thuộc trung ương giải quyết khiếu nại đối với quyết định của Ban chủ nhiệm, Hội đồng khen thưởng, kỷ luật của Đoàn luật sư', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC021', 'QĐ giải quyết khiếu nại về quyết định xử lý vụ việc cạnh tranh', 'L06', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('HC022', 'Các khiếu kiện hành chính khác', 'L06', 'N05');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS001', 'Doanh nghiệp nhà nước', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS002', 'Doanh nghiệp 100% vốn nhà nước', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS003', 'Doanh nghiệp vốn nhà nước chiếm giữ trên 50%', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS004', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Doanh nghiệp tư nhân', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS005', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty Trách nhiệm hữu hạn', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS006', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty cổ phần', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS007', 'Doanh nghiệp không có vốn nhà nước và đầu tư trực tiếp nước ngoài - Công ty hợp danh', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS008', 'Doanh nghiệp 100% vốn đầu tư nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS009', 'Doanh nghiệp có nhiều nguồn vốn (vốn nhà nước từ 50% trở xuống, một phần vốn nước ngoài, vốn thuộc sở hữu tư nhân)', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS010', 'Hợp tác xã', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS011', 'Ngân hàng thương mại có một phần vốn góp nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS012', 'Ngân hàng thương mại không có vốn nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS013', 'Ngân hàng thương mại 100% vốn nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS014', 'Ngân hàng hợp tác xã', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS015', 'Quỹ tín dụng nhân dân', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS016', 'Tổ chức tín dụng phi ngân hàng có một phần vốn góp nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS017', 'Tổ chức tín dụng phi ngân hàng không có vốn nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS018', 'Tổ chức tín dụng phi ngân hàng 100% vốn nước ngoài', 'L07', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('PS019', 'Doanh nghiệp phá sản khác', 'L07', 'N05');

INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('BP001', 'Đưa vào trường giáo dưỡng', 'L08', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('BP002', 'Đưa vào cơ sở giáo dục bắt buộc', 'L08', 'N05');
INSERT INTO legal_relationships (legal_relationship_id, legal_relationship_name,legal_case_type_id, legal_relationship_group_id)
VALUES ('BP003', 'Đưa vào cơ sở cai nghiện bắt buộc', 'L08', 'N05');



INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS01', 'DS. Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS02', 'DS. Quyết định trưng cầu giám định', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS03', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS04', 'DS. Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS05', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS06', 'DS. Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS07', 'VDS. Quyết định phân công người tiến hành tố tụng', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS08', 'DS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS09', 'VDS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS10', 'DS. Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS11', 'VDS. Quyết định trưng cầu giám định', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS12', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS13', 'VDS. Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS14', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS15', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS16', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS17', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS18', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS19', 'VDS. Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS20', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS21', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS22', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS23', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS24', 'VDS. Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS25', 'DS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS26', 'VDS. Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS27', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS28', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS29', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS30', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS31', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS32', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS33', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS34', 'DS. Quyết định hoãn phiên tòa', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS35', 'DS. Quyết định tạm ngừng phiên tòa', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS36', 'DS. Quyết định sửa chữa, bổ sung bản án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS37', 'DS. Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS38', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS39', 'DS. Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS40', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS41', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS42', 'DS. Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS43', 'DS. Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS45', 'Quyết định nhập vụ án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS46', 'Quyết định tách vụ án', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS55', 'Thông báo thụ lý bổ sung', FALSE, 'L02', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS56', 'Bản án', TRUE, 'L02', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS57', 'Quyết định hủy án', TRUE, 'L02', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('DS58', 'Quyết định sửa án', TRUE, 'L02', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN01', 'DS. Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN02', 'DS. Quyết định trưng cầu giám định', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN03', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN04', 'DS. Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN05', 'VDS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN06', 'DS. Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN07', 'VDS. Quyết định phân công người tiến hành tố tụng', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN08', 'DS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN09', 'VDS. Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN10', 'DS. Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN11', 'VDS. Quyết định trưng cầu giám định', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN12', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN13', 'VDS. Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN14', 'DS. Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN15', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN16', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN17', 'VDS. Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN18', 'DS. Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN19', 'VDS. Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN20', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN21', 'DS. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN22', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN23', 'DS. Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN24', 'VDS. Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN25', 'DS. Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN26', 'VDS. Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN27', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN28', 'VDS. Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN29', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN30', 'DS. Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN31', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN32', 'DS. Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN33', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN34', 'DS. Quyết định hoãn phiên tòa', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN35', 'DS. Quyết định tạm ngừng phiên tòa', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN36', 'DS. Quyết định sửa chữa, bổ sung bản án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN37', 'DS. Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN38', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN39', 'DS. Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN40', 'HC. Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN41', 'DS. Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN42', 'DS. Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN43', 'DS. Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN45', 'Quyết định nhập vụ án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN46', 'Quyết định tách vụ án', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN55', 'Thông báo thụ lý bổ sung', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN56', 'Bản án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN57', 'Quyết định hủy án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HN58', 'Quyết định sửa án', TRUE, 'L03', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT02', 'Quyết định trưng cầu giám định', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT11', 'Quyết định trưng cầu giám định', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT34', 'Quyết định hoãn phiên tòa', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT45', 'Quyết định nhập vụ án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT46', 'Quyết định tách vụ án', FALSE, 'L04', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT55', 'Thông báo thụ lý bổ sung', FALSE, 'L03', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT56', 'Bản án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT57', 'Quyết định hủy án', TRUE, 'L03', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('KT58', 'Quyết định sửa án', TRUE, 'L03', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD02', 'Quyết định trưng cầu giám định', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD11', 'Quyết định trưng cầu giám định', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD34', 'Quyết định hoãn phiên tòa', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD45', 'Quyết định nhập vụ án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD46', 'Quyết định tách vụ án', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD55', 'Thông báo thụ lý bổ sung', FALSE, 'L05', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD56', 'Bản án', TRUE, 'L05', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD57', 'Quyết định hủy án', TRUE, 'L05', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('LD58', 'Quyết định sửa án', TRUE, 'L05', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC02', 'Quyết định trưng cầu giám định', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC11', 'Quyết định trưng cầu giám định', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC34', 'Quyết định hoãn phiên tòa', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC45', 'Quyết định nhập vụ án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC46', 'Quyết định tách vụ án', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC55', 'Thông báo thụ lý bổ sung', FALSE, 'L06', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC56', 'Bản án', TRUE, 'L06', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC57', 'Quyết định hủy án', TRUE, 'L06', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HC58', 'Quyết định sửa án', TRUE, 'L06', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS02', 'Quyết định trưng cầu giám định', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS11', 'Quyết định trưng cầu giám định', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS34', 'Quyết định hoãn phiên tòa', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS45', 'Quyết định nhập vụ án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS46', 'Quyết định tách vụ án', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS55', 'Thông báo thụ lý bổ sung', FALSE, 'L07', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS56', 'Bản án', TRUE, 'L07', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS57', 'Quyết định hủy án', TRUE, 'L07', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('PS58', 'Quyết định sửa án', TRUE, 'L07', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP01', 'Quyết định xem xét, thẩm định tại chỗ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP02', 'Quyết định trưng cầu giám định', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP03', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP04', 'Quyết định định giá tài sản và thành lập Hội đồng định giá', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP05', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn yêu cầu giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP06', 'Quyết định thay đổi thành viên Hội đồng định giá', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP07', 'Quyết định phân công người tiến hành tố tụng', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP08', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP09', 'Quyết định yêu cầu cung cấp tài liệu, chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP10', 'Quyết định uỷ thác thu thập chứng cứ', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP11', 'Quyết định trưng cầu giám định', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP12', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP13', 'Quyết định mở phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP14', 'Quyết định buộc thực hiện biện pháp bảo đảm (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP15', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP16', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP17', 'Quyết định hoãn phiên họp sơ thẩm giải quyết việc dân sự Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Chánh án)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP18', 'Quyết định áp dụng biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP19', 'Quyết định thay đổi người tiến hành tố tụng giải quyết việc dân sự (dành cho Hội đồng giải quyết việc dân sự)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP20', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP21', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP22', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP23', 'Quyết định huỷ bỏ biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP24', 'Quyết định hoãn phiên họp phúc thẩm giải quyết việc dân sự', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP25', 'Quyết định giải quyết khiếu nại, kiến nghị việc trả lại đơn khởi kiện', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP26', 'Quyết định thông báo tìm kiếm người vắng mặt tại nơi cư trú', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP27', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố mất tích', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP28', 'Quyết định thông báo tìm kiếm người bị yêu cầu tuyên bố là đã chết', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP29', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP30', 'Quyết định tạm đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP31', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP32', 'Quyết định tiếp tục giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP33', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP34', 'Quyết định hoãn phiên tòa', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP35', 'Quyết định tạm ngừng phiên tòa', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP36', 'Quyết định sửa chữa, bổ sung bản án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP37', 'Quyết định chấp nhận việc kháng cáo quá hạn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP38', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Thẩm phán)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP39', 'Quyết định không chấp nhận việc kháng cáo quá hạn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP40', 'Quyết định thay đổi biện pháp khẩn cấp tạm thời (dành cho Hội đồng xét xử sơ thẩm và Hội đồng xét xử phúc thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP41', 'Quyết định đưa vụ án ra xét xử sơ thẩm theo thủ tục rút gọn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP42', 'Quyết định giải quyết khiếu nại, kiến nghị về quyết định đưa vụ án ra xét xử theo thủ tục rút gọn', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP43', 'Quyết định chuyển vụ án giải quyết theo thủ tục rút gọn sang giải quyết theo thủ tục thông thường (tại Tòa án cấp sơ thẩm)', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP44', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP45', 'Quyết định nhập vụ án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP46', 'Quyết định tách vụ án', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP47', 'VDS. Quyết định đình chỉ việc xét đơn yêu cầu giải quyết việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP48', 'VDS. Quyết định đình chỉ giải quyết sơ thẩm việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP49', 'VDS. Quyết định sơ thẩm giải quyết việc dân sự', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP50', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Thẩm phán)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP51', 'DS. Quyết định công nhận sự thoả thuận của các đương sự (dành cho Hội đồng xét xử)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP52', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Thẩm phán)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP53', 'DS. Quyết định đình chỉ giải quyết vụ án dân sự (dành cho Hội đồng xét xử)', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP54', 'Quyết định chuyển vụ án vì không thuộc thẩm quyền', TRUE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP55', 'Thông báo thụ lý bổ sung', FALSE, 'L08', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP56', 'Bản án', TRUE, 'L08', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP57', 'Quyết định hủy án', TRUE, 'L08', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('BP58', 'Quyết định sửa án', TRUE, 'L08', 'SUPERIOR_COURT');

INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS01', 'Quyết định áp dụng biện pháp bắt buộc chữa bệnh (dùng cho Chánh án, Phó Chánh án Tòa án trong giai đoạn xét xử)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS02', 'Quyết định áp dụng thủ tục rút gọn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS03', 'Quyết định hủy bỏ Quyết định áp dụng thủ tục rút gọn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS04', 'Quyết định trưng cầu giám định (dùng cho Thẩm phán được phân công giải quyết vụ án khi có yêu cầu)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS05', 'Quyết định trưng cầu giám định (dùng cho Thẩm phán được phân công giải quvết vụ án khi xét thấy cẩn thiết)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS06', 'Quyết định đưa vụ án ra xét xử sơ thẩm', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS07', 'Quyết định tạm đình chỉ vụ án (dùng cho Thẩm phán được phân công chủ tọa phiên tòa)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS08', 'Quyết định tạm đình chỉ vụ án (dùng cho Hội đồng xét xử sơ thẩm)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS09', 'Quyết định tạm đình chỉ vụ án và áp dụng biện pháp bắt buộc chữa bệnh (dùng cho Hội đồng xét xử sơ thẩm)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS10', 'Quyết định phục hồi vụ án (dùng cho Chánh án Tòa án, Thẩm phán được phân công chủ tọa phiên tòa)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS11', 'Quyết định gia hạn thời hạn chuẩn bị xét xử', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS12', 'Quyết định hoãn phiên tòa (dùng cho Hội đồng xét xử)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS13', 'Quyết định hoãn phiên tòa (dùng cho Chánh án Tòa án)', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS14', 'Quyết định về việc giải quyết kháng cáo quá hạn', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS15', 'Quyết định rút hồ sơ vụ án hình sự', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS16', 'Quyết định thay đổi (bổ sung, rút) kháng nghị giám đốc thẩm', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS17', 'Quyết định khởi tố vụ án hình sự', FALSE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS18', 'Bản án', TRUE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS19', 'Quyết định trả hồ sơ điều tra bổ sung', TRUE, 'L01', 'CURRENT_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS20', 'Quyết định hủy án', TRUE, 'L01', 'SUPERIOR_COURT');
INSERT INTO decision_types(decision_type_id, decision_type_name, is_the_end_decision, legal_case_type_id, court_issued) VALUES ('HS21', 'Quyết định sửa án', TRUE, 'L01', 'SUPERIOR_COURT');


/* Handle type of decision  */
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('DS58', 'SOLVED', 'EDITED',FALSE, NULL);

/**/

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HN58', 'SOLVED', 'EDITED',FALSE, NULL);


INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('KT58', 'SOLVED', 'EDITED',FALSE, NULL);


INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('LD58', 'SOLVED', 'EDITED',FALSE, NULL);


INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HC58', 'SOLVED', 'EDITED',FALSE, NULL);


INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('PS58', 'SOLVED', 'EDITED',FALSE, NULL);


INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP29', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP30', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP31', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP32', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP44', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP44', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP47', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP48', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP49', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP50', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP51', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP52', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP53', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP54', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP55', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP56', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP57', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('BP58', 'SOLVED', 'EDITED',FALSE, NULL);


/* Hình sự đặc biệt hơn những án khác */
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS07', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS08', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS09', 'IN_PROCESS', 'TEMPORARY_SUSPENSION',TRUE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS10', 'TEMPORARY_SUSPENSION', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS11', 'IN_PROCESS', 'IN_PROCESS',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS11', 'OVERDUE', 'IN_PROCESS',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS18', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS19', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS20', 'IN_PROCESS', 'SOLVED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS21', 'IN_PROCESS', 'SOLVED',FALSE, NULL);

INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS20', 'SOLVED', 'CANCELED',FALSE, NULL);
INSERT INTO handle_decision_types(decision_type_id, pre_status, post_status, is_temporarily_postponed, extension_period)
VALUES ('HS21', 'SOLVED', 'EDITED',FALSE, NULL);

/* Thẩm phán */
INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP01', 'Nguyễn Xuân', 'Trà', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP01', 90);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP01', 'TP01', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'ADMIN', 'xuantranguyen1975@gmail.com', 'TP01', 'ACTIVE');


INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP02', 'Châu Văn', 'Sang', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP02', 90);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP02', 'TP02','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'chauvansang.toaan@gmail.com', 'TP02', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP03', 'Huỳnh Trung', 'Dũng', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP03', 90);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP03', 'TP03','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'huynhtrungdung1985@gmail.com', 'TP03', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP04', 'Võ Thị Kim', 'Hoa', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP04', 90);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP04', 'TP04','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MANAGER', 'vtkimhoa.qtkd@gmail.com', 'TP04', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP05', 'Trịnh Hữu', 'Chinh', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP05', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP05', 'TP05','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'chinhthta@gmail.com', 'TP05', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP06', 'Trần Hữu', 'Hà', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP06', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP06', 'TP06','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'thha.mk@gmail.com', 'TP06', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP07', 'Phan Thị Phương', 'Thảo', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP07', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP07', 'TP07','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'ptpthao1988@gmail.com', 'TP07', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP08', 'Phan Thị Nhã', 'Quyên', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP08', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP08', 'TP08','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'nhaquyenta@gmail.com', 'TP08', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP09', 'Võ Thị Ngọc', 'Minh', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP09', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP09', 'TP09','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'minhminhtatp@gmail.com', 'TP09', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP10', 'Trương Trường', 'Chinh', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP10', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP10', 'TP10','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MANAGER', 'ttchinh99@gmail.com', 'TP10', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP11', 'Phạm Thị Kim', 'Yến', 'ON_LEAVE');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP11', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP11', 'TP11','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'awaysmile15@gmail.com', 'TP11', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP12', 'Lê Chí', 'Tâm', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP12', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP12', 'TP12','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'letamct2@gmail.com', 'TP12', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP13', 'Trịnh Thùy', 'Vân', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP13', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP13', 'TP13','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'thuyvan.trinh3@gmail.com', 'TP13', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP14', 'Nguyễn Hoàng Thanh', 'Trúc', 'ON_LEAVE');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP14', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP14', 'TP14','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'thanhtruc.cl@gmail.com', 'TP14', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP15', 'Trần Hồng', 'Thắm', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP15', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP15', 'TP15','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'hongtham12021992@gmail.com', 'TP15', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP16', 'Nguyễn Thị', 'Duyên', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP16', 90);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP16', 'TP16','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'duyentatdt@gmail.com', 'TP16', 'ACTIVE');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('TP17', 'Nguyễn Tấn', 'Lợi', 'WORKING');
INSERT INTO judges(officer_id, max_number_of_legal_case)
VALUES ('TP17', -1);
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('TP17', 'TP17','$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'JUDGE', 'nguyentanloimt@gmail.com', 'TP17', 'ACTIVE');

/* Hòa giải viên */
INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG01', 'Nguyễn Văn', 'Vững', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG01');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG01', 'HG01', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG01@gmail.com', 'HG01', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG02', 'Nguyễn Tấn', 'Tới', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG02');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG02', 'HG02', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG02@gmail.com', 'HG02', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG03', 'Bùi Thanh', 'Thúy', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG03');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG03', 'HG03', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG03@gmail.com', 'HG03', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG04', 'Nguyễn Trần Ngọc', 'Thảo', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG04');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG04', 'HG04', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG04@gmail.com', 'HG04', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG05', 'Lê Thanh', 'Tú', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG05');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG05', 'HG05', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG05@gmail.com', 'HG05', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG06', 'Lê Thanh', 'Hùng', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG06');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG06', 'HG06', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG06@gmail.com', 'HG06', 'BLOCKED');

INSERT INTO officers (officer_id, last_name, first_name, officer_status)
VALUES ('HG07', 'Đăng Thị Kim', 'Tư', 'WORKING');
INSERT INTO mediators (officer_id)
VALUES ('HG07');
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('HG07', 'HG07', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'MEDIATOR', 'HG07@gmail.com', 'HG07', 'BLOCKED');

/* Quản trị viên*/
INSERT INTO  accounts (account_id, username, password, role, email, officer_id, account_status)
VALUES ('AD02', 'admin02', '$2a$10$JDwQJ0mKRjLd35GnXhZ92ebB6mcZWh2Wb99x4h8FSs1SyuG3lDIOe', 'ADMIN', 'daokimxoa89@gmail.com', NULL, 'ACTIVE');

INSERT INTO judge_restricted_groups(judge_id, legal_relationship_group_id)
VALUES ('TP01', 'N04');

INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D001', 'Đợt 1', NULL, '2025-10-07 04:48:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D002', 'Đợt 2', NULL, '2025-10-09 07:55:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D003', 'Đợt 3', NULL, '2025-10-13 05:14:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D004', 'Đợt 4', NULL, '2025-10-14 12:33:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D005', 'Đợt 5', '20 vụ', '2025-10-16 01:41:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D006', 'Đợt 6', '01 vụ', '2025-10-17 07:51:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D007', 'Đợt 7', '27 vụ', '2025-10-20 07:15:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D008', 'Đợt 8', '16 vụ', '2025-10-21 01:32:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D009', 'Đợt 9', '15 vụ + 24 vụ HGV (Vy)', '2025-10-23 00:54:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D010', 'Đợt 10', '28 vụ dân sự (VY)', '2025-10-27 08:23:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D011', 'Đợt 11', 'Ngọc 30 vụ + Vy 12 vụ', '2025-10-29 05:08:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D012', 'Đợt 12', '10 vụ (Ngọc)', '2025-10-30 09:51:00');
INSERT INTO batches(batch_id, batch_name, note, storage_date)
VALUES ('2026D013', 'Đợt 13', '02 vụ (Vy)', '2025-10-31 02:06:00');

INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2022DS00001', '2022-10-05', '538', 'ASSIGN', '2025-10-09 07:52:00', '2023-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00001', '2023-02-12', '108', 'ASSIGN', '2025-10-09 07:52:00', '2023-06-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS040', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00002', '2023-03-27', '214', 'ASSIGN', '2025-10-09 07:52:00', '2023-07-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00003', '2023-05-23', '498', 'ASSIGN', '2025-10-09 07:52:00', '2023-09-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00004', '2023-06-12', '578', 'ASSIGN', '2025-10-09 07:52:00', '2023-10-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00005', '2023-06-14', '588', 'ASSIGN', '2025-10-09 07:52:00', '2023-10-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00006', '2023-06-14', '593', 'ASSIGN', '2025-10-09 07:52:00', '2023-10-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00007', '2023-06-26', '621', 'ASSIGN', '2025-10-09 07:52:00', '2023-10-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00008', '2023-10-01', '773', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00009', '2023-10-01', '776', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00010', '2023-10-01', '778', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00011', '2023-10-01', '792', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00012', '2023-10-15', '869', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-15', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00013', '2023-10-15', '876', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-15', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00014', '2023-10-17', '887', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00015', '2023-10-17', '891', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00016', '2023-10-22', '925', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-22', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00017', '2023-10-22', '932', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-22', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00018', '2023-10-29', '954', 'ASSIGN', '2025-10-09 07:52:00', '2024-02-29', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00019', '2023-11-07', '986', 'ASSIGN', '2025-10-09 07:52:00', '2024-03-07', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00020', '2023-11-14', '1043', 'ASSIGN', '2025-10-09 07:52:00', '2024-03-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00021', '2023-12-10', '1171', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00022', '2023-12-19', '1190', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-19', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00023', '2023-12-19', '1191', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-19', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00024', '2023-12-25', '1192', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-25', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00025', '2023-12-26', '1222', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023DS00026', '2023-12-26', '1228', 'ASSIGN', '2025-10-09 07:52:00', '2024-04-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2023HN00001', '2023-05-29', '372', 'ASSIGN', '2025-10-09 07:52:00', '2023-09-29', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00001', '2024-01-07', '22', 'ASSIGN', '2025-10-09 07:52:00', '2024-05-07', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00002', '2024-01-08', '31', 'ASSIGN', '2025-10-09 07:52:00', '2024-05-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00003', '2024-02-21', '51', 'ASSIGN', '2025-10-09 07:52:00', '2024-06-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00004', '2024-02-25', '76', 'ASSIGN', '2025-10-09 07:52:00', '2024-06-25', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00005', '2024-03-03', '98', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00006', '2024-03-10', '110', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00007', '2024-03-13', '119', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00008', '2024-03-17', '133', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00009', '2024-03-18', '140', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00010', '2024-03-20', '149', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00001', '2024-03-31', '183', 'ASSIGN', '2025-10-09 07:52:00', '2024-07-31', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00011', '2024-04-02', '211', 'ASSIGN', '2025-10-09 07:52:00', '2024-08-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00012', '2024-04-14', '234', 'ASSIGN', '2025-10-09 07:52:00', '2024-08-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00013', '2024-04-21', '249', 'ASSIGN', '2025-10-09 07:52:00', '2024-08-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00014', '2024-05-12', '289', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00015', '2024-05-12', '292', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00016', '2024-05-20', '303', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00017', '2024-05-21', '309', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00018', '2024-05-22', '311', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-22', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00019', '2024-05-27', '322', 'ASSIGN', '2025-10-09 07:52:00', '2024-09-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00020', '2024-07-23', '455', 'ASSIGN', '2025-10-09 07:52:00', '2024-11-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00021', '2024-09-30', '466', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00022', '2024-09-30', '468', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00023', '2024-09-30', '471', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00024', '2024-09-30', '475', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00025', '2024-09-30', '486', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00026', '2024-09-30', '494', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00027', '2024-09-30', '504', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00028', '2024-09-30', '506', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00029', '2024-09-30', '513', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00030', '2024-09-30', '519', 'ASSIGN', '2025-10-09 07:52:00', '2025-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00031', '2024-10-06', '537', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00032', '2024-10-06', '548', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00033', '2024-10-06', '559', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00034', '2024-10-06', '561', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00035', '2024-10-09', '576', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-09', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00036', '2024-10-14', '581', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00037', '2024-10-14', '583', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00038', '2024-10-14', '584', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00039', '2024-10-14', '590', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00040', '2024-10-14', '596', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00041', '2024-10-14', '598', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00042', '2024-10-20', '620', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00043', '2024-10-23', '625', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00044', '2024-10-27', '630', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00045', '2024-10-27', '632', 'ASSIGN', '2025-10-09 07:52:00', '2025-02-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00046', '2024-11-03', '666', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00047', '2024-11-03', '671', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00048', '2024-11-03', '677', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00049', '2024-11-06', '701', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00050', '2024-11-06', '702', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00051', '2024-11-06', '705', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00052', '2024-11-13', '751', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00053', '2024-11-13', '756', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00054', '2024-11-13', '760', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00055', '2024-11-18', '763', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00056', '2024-11-25', '770', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-25', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS016', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00057', '2024-11-25', '771', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-25', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS016', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00058', '2024-11-27', '784', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00059', '2024-12-02', '793', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00060', '2024-12-02', '795', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00061', '2024-12-02', '812', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00062', '2024-12-03', '817', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00063', '2024-12-08', '861', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS008', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00064', '2024-12-08', '867', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00065', '2024-12-11', '883', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-11', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00066', '2024-12-16', '888', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00067', '2024-12-24', '918', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-24', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024DS00068', '2024-12-24', '919', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-24', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024HN00001', '2024-11-13', '727', 'ASSIGN', '2025-10-09 07:52:00', '2025-03-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024HN00002', '2024-12-16', '775', 'ASSIGN', '2025-10-09 07:52:00', '2025-04-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2024KT00001', '2024-06-10', '14', 'ASSIGN', '2025-10-09 07:52:00', '2024-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'KT013', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00002', '2025-01-02', '2', 'ASSIGN', '2025-10-09 07:52:00', '2025-05-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00003', '2025-01-08', '23', 'ASSIGN', '2025-10-09 07:52:00', '2025-05-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00004', '2025-02-10', '37', 'ASSIGN', '2025-10-09 07:52:00', '2025-06-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00005', '2025-02-24', '75', 'ASSIGN', '2025-10-09 07:52:00', '2025-06-24', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00006', '2025-02-26', '79', 'ASSIGN', '2025-10-09 07:52:00', '2025-06-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00007', '2025-03-03', '90', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-03', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00008', '2025-03-05', '94', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00009', '2025-03-05', '99', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00010', '2025-03-05', '101', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00011', '2025-03-10', '109', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00012', '2025-03-10', '110', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00013', '2025-03-10', '121', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00014', '2025-03-11', '137', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-11', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00015', '2025-03-12', '138', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00016', '2025-03-12', '144', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00017', '2025-03-17', '147', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00018', '2025-03-17', '148', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00019', '2025-03-18', '158', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00020', '2025-03-18', '162', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00021', '2025-03-18', '163', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00022', '2025-03-23', '179', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00023', '2025-03-23', '186', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00024', '2025-03-30', '210', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00025', '2025-03-30', '218', 'ASSIGN', '2025-10-09 07:52:00', '2025-07-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00026', '2025-04-08', '227', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00027', '2025-04-08', '248', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00028', '2025-04-10', '259', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00029', '2025-04-17', '271', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00030', '2025-04-17', '275', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00031', '2025-04-21', '277', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00032', '2025-04-24', '285', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-24', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00033', '2025-04-24', '288', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-24', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00034', '2025-04-29', '300', 'ASSIGN', '2025-10-09 07:52:00', '2025-08-29', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00035', '2025-08-04', '305', 'ASSIGN', '2025-10-09 07:52:00', '2025-12-04', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00036', '2025-05-13', '314', 'ASSIGN', '2025-10-09 07:52:00', '2025-09-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00037', '2025-05-20', '333', 'ASSIGN', '2025-10-09 07:52:00', '2025-09-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00038', '2025-05-20', '338', 'ASSIGN', '2025-10-09 07:52:00', '2025-09-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00039', '2025-05-27', '354', 'ASSIGN', '2025-10-09 07:52:00', '2025-09-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00040', '2025-05-27', '374', 'ASSIGN', '2025-10-09 07:52:00', '2025-09-27', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00041', '2025-06-01', '384', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00042', '2025-06-01', '393', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00043', '2025-06-01', '395', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00044', '2025-06-10', '412', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00045', '2025-06-10', '413', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00046', '2025-06-10', '432', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00047', '2025-06-10', '433', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00048', '2025-06-10', '444', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00049', '2025-06-10', '449', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00050', '2025-06-18', '458', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00051', '2025-06-18', '462', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00052', '2025-06-23', '466', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00053', '2025-07-14', '11', 'ASSIGN', '2025-10-09 07:52:00', '2025-11-14', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00054', '2025-07-18', '26', 'ASSIGN', '2025-10-09 07:52:00', '2025-11-18', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00055', '2025-07-23', '27', 'ASSIGN', '2025-10-09 07:52:00', '2025-11-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00056', '2025-09-10', '178', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00057', '2025-09-30', '245', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00058', '2025-09-30', '246', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00059', '2025-09-30', '247', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00060', '2025-09-30', '248', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00061', '2025-09-30', '249', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00062', '2025-09-30', '250', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00063', '2025-09-30', '251', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS066', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00064', '2025-09-30', '252', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00065', '2025-09-30', '253', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00066', '2025-09-30', '254', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00067', '2025-09-30', '255', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00068', '2025-09-30', '256', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00069', '2025-09-30', '257', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00070', '2025-09-30', '258', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00071', '2025-09-30', '259', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00072', '2025-09-30', '260', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00073', '2025-09-30', '261', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00074', '2025-09-30', '262', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00075', '2025-09-30', '263', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00076', '2025-09-30', '264', 'RANDOM', '2025-10-10 00:35:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00077', '2025-09-30', '265', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00078', '2025-09-30', '266', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00079', '2025-09-30', '267', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00080', '2025-09-30', '268', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00081', '2025-09-30', '269', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00082', '2025-09-30', '270', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00083', '2025-09-30', '271', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00084', '2025-09-30', '272', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00085', '2025-09-30', '273', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00086', '2025-09-30', '274', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00087', '2025-10-01', '275', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00088', '2025-10-01', '276', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00089', '2025-10-01', '277', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00090', '2025-10-01', '278', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00091', '2025-10-01', '279', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00092', '2025-10-01', '280', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS040', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00093', '2025-10-01', '281', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00094', '2025-10-01', '282', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP08', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00095', '2025-10-01', '283', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00096', '2025-10-01', '284', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00097', '2025-10-01', '285', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00098', '2025-10-01', '286', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00099', '2025-10-01', '287', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00100', '2025-10-02', '288', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00101', '2025-10-05', '289', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00102', '2025-10-05', '290', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00103', '2025-10-05', '291', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00104', '2025-10-05', '292', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00105', '2025-10-05', '293', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00106', '2025-10-05', '294', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00107', '2025-10-05', '295', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS016', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00108', '2025-10-05', '296', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00109', '2025-10-05', '297', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00110', '2025-10-05', '298', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-05', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00111', '2025-10-08', '299', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP07', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00112', '2025-10-08', '300', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP02', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00113', '2025-10-08', '301', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP08', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00114', '2025-10-08', '302', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP17', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00115', '2025-10-08', '303', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00116', '2025-10-08', '304', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP04', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00117', '2025-10-08', '305', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP05', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00118', '2025-10-08', '306', 'RANDOM', '2025-10-10 09:09:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP03', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00119', '2025-10-08', '307', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00120', '2025-10-08', '308', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP10', 'DS043', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00121', '2025-10-08', '309', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP12', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00122', '2025-10-08', '310', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00123', '2025-10-08', '311', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP06', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00124', '2025-10-08', '312', 'RANDOM', '2025-10-10 00:35:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP09', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00125', '2025-10-08', '313', 'ASSIGN', '2025-10-09 12:05:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP13', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00126', '2025-10-08', '314', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP15', 'DS012', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00127', '2025-10-08', '315', 'ASSIGN', '2025-10-09 12:05:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00128', '2025-10-08', '316', 'ASSIGN', '2025-10-09 12:05:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00129', '2025-10-08', '317', 'ASSIGN', '2025-10-09 12:05:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00130', '2025-10-08', '318', 'ASSIGN', '2025-10-09 12:05:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP02', 'DS011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00131', '2025-10-08', '319', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP03', 'DS012', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00132', '2025-10-08', '320', 'RANDOM', '2025-10-10 04:27:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP03', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00133', '2025-10-10', '321', 'RANDOM', '2025-10-10 04:48:00', '2026-02-10', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP03', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00134', '2025-10-09', '321', 'ASSIGN', '2025-10-13 05:16:00', '2026-02-09', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP03', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00135', '2025-10-13', '322', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP15', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00136', '2025-10-13', '323', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP01', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00137', '2025-10-13', '324', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP02', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00138', '2025-10-13', '325', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP16', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00139', '2025-10-13', '326', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00140', '2025-10-13', '327', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP17', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00141', '2025-10-13', '328', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP13', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00142', '2025-10-13', '329', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP07', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00143', '2025-10-13', '330', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP04', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00144', '2025-10-13', '331', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP05', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00145', '2025-10-13', '332', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP09', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00146', '2025-10-13', '333', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP12', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00147', '2025-10-13', '334', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP06', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00148', '2025-10-13', '335', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP03', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00149', '2025-10-13', '336', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP10', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00150', '2025-10-13', '337', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP03', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00151', '2025-10-13', '338', 'ASSIGN', '2025-10-13 05:16:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP06', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00152', '2025-10-13', '339', 'RANDOM', '2025-10-14 10:56:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP08', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00153', '2025-10-13', '340', 'ASSIGN', '2025-10-13 05:16:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP02', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00154', '2025-10-13', '341', 'ASSIGN', '2025-10-13 05:16:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP03', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00155', '2025-10-14', '11', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP04', 'DS009', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00156', '2025-10-14', '12', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP03', 'DS009', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00157', '2025-10-14', '13', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP17', 'DS009', 'HG03');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00158', '2025-10-14', '14', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP12', 'DS009', 'HG02');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00159', '2025-10-16', '342', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP17', 'DS053', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00160', '2025-10-16', '343', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP10', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00161', '2025-10-16', '344', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP02', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00162', '2025-10-16', '345', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP15', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00163', '2025-10-16', '346', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP04', 'DS057', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00164', '2025-10-16', '347', 'ASSIGN', '2025-10-16 01:45:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP16', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00165', '2025-10-16', '348', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP13', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00166', '2025-10-16', '349', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP16', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00167', '2025-10-16', '350', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP03', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00168', '2025-10-16', '351', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP07', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00169', '2025-10-16', '352', 'RANDOM', '2025-10-16 01:51:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00170', '2025-10-16', '353', 'RANDOM', '2025-10-16 01:51:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP08', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00171', '2025-10-16', '354', 'RANDOM', '2025-10-16 01:51:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00172', '2025-10-16', '355', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP09', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00173', '2025-10-16', '356', 'RANDOM', '2025-10-16 05:00:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP06', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00174', '2025-10-16', '357', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP08', 'DS053', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00175', '2025-10-16', '358', 'ASSIGN', '2025-10-16 01:45:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP17', 'DS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00176', '2025-10-16', '359', 'RANDOM', '2025-10-16 01:51:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00177', '2025-10-16', '360', 'RANDOM', '2025-10-16 01:50:00', '2026-02-16', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP06', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00178', '2025-10-17', '15', 'RANDOM', '2025-10-17 07:53:00', '2026-02-17', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D006', 'TP01', 'DS009', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00179', '2025-10-20', '362', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP03', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00180', '2025-10-20', '363', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP01', 'DS011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00181', '2025-10-20', '364', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP10', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00182', '2025-10-20', '365', 'RANDOM', '2025-10-20 07:17:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP17', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00183', '2025-10-20', '366', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00184', '2025-10-20', '367', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP08', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00185', '2025-10-20', '368', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP03', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00186', '2025-10-20', '369', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00187', '2025-10-20', '370', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00188', '2025-10-20', '371', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP05', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00189', '2025-10-20', '372', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP15', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00190', '2025-10-20', '373', 'RANDOM', '2025-10-20 07:17:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP04', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00191', '2025-10-20', '374', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP04', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00192', '2025-10-20', '375', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP13', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00193', '2025-10-20', '376', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00194', '2025-10-20', '377', 'RANDOM', '2025-10-20 07:20:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP04', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00195', '2025-10-20', '378', 'RANDOM', '2025-10-20 07:17:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP03', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00196', '2025-10-21', '379', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP16', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00197', '2025-10-21', '380', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP08', 'DS050', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00198', '2025-10-21', '381', 'RANDOM', '2025-10-23 00:51:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP17', 'DS016', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00199', '2025-10-21', '382', 'RANDOM', '2025-10-21 01:36:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP08', 'DS026', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00200', '2025-10-21', '383', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP12', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00201', '2025-10-21', '384', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP05', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00202', '2025-10-21', '385', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP15', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00203', '2025-10-21', '386', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP02', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00204', '2025-10-21', '387', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP13', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00205', '2025-10-21', '388', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP03', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00206', '2025-10-21', '389', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP17', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00207', '2025-10-21', '390', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP10', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00208', '2025-10-21', '391', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP07', 'DS056', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00209', '2025-10-21', '392', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP04', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00210', '2025-10-21', '393', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP09', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00211', '2025-10-21', '394', 'RANDOM', '2025-10-21 01:35:00', '2026-02-21', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP06', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00212', '2025-10-23', '395', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00213', '2025-10-23', '396', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00214', '2025-10-23', '397', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP03', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00215', '2025-10-23', '398', 'RANDOM', '2025-10-28 04:10:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00216', '2025-10-23', '399', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP08', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00217', '2025-10-23', '400', 'ASSIGN', '2025-10-23 09:34:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP07', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00218', '2025-10-23', '401', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP06', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00219', '2025-10-23', '402', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP04', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00220', '2025-10-23', '403', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP16', 'DS008', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00221', '2025-10-23', '404', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP12', 'DS011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00222', '2025-10-23', '405', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00223', '2025-10-23', '406', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP13', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00224', '2025-10-23', '408', 'ASSIGN', '2025-10-23 09:34:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP13', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00225', '2025-10-23', '407', 'ASSIGN', '2025-10-23 09:34:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP09', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00226', '2025-10-23', '15', 'RANDOM', '2025-10-25 08:30:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP13', 'DS009', 'HG01');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00227', '2025-10-23', '16', 'RANDOM', '2025-10-25 08:30:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP08', 'DS009', 'HG03');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00228', '2025-10-23', '17', 'RANDOM', '2025-10-25 08:30:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'DS009', 'HG03');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00229', '2025-10-23', '18', 'RANDOM', '2025-10-29 09:37:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'DS009', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00230', '2025-10-28', '410', 'RANDOM', '2025-10-28 04:43:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP13', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00231', '2025-10-28', '411', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP07', 'DS012', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00232', '2025-10-28', '412', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP17', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00233', '2025-10-28', '413', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP06', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00234', '2025-10-28', '414', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00235', '2025-10-28', '415', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP10', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00236', '2025-10-28', '416', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP12', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00237', '2025-10-28', '417', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00238', '2025-10-28', '418', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP01', 'DS002', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00239', '2025-10-28', '419', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP12', 'DS048', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00240', '2025-10-28', '420', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00241', '2025-10-28', '422', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP13', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00242', '2025-10-28', '423', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP09', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00243', '2025-10-28', '424', 'RANDOM', '2025-10-28 04:43:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP17', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00244', '2025-10-28', '425', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP12', 'DS064', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00245', '2025-10-28', '426', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00246', '2025-10-28', '427', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP16', 'DS066', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00247', '2025-10-28', '428', 'RANDOM', '2025-10-28 04:43:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP07', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00248', '2025-10-28', '429', 'RANDOM', '2025-10-28 04:43:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP04', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00249', '2025-10-28', '430', 'RANDOM', '2025-10-30 09:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP03', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00250', '2025-10-28', '431', 'RANDOM', '2025-10-29 09:36:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP04', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00251', '2025-10-28', '432', 'RANDOM', '2025-10-30 09:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP12', 'DS073', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00252', '2025-10-28', '433', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP16', 'DS012', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00253', '2025-10-28', '434', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP03', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00254', '2025-10-28', '435', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP04', 'DS006', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00255', '2025-10-28', '436', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP05', 'DS006', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00256', '2025-10-23', '409', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP02', 'DS037', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00257', '2025-10-28', '437', 'RANDOM', '2025-10-28 04:43:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP15', 'DS052', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00258', '2025-10-28', '438', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP02', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00259', '2025-10-28', '421', 'ASSIGN', '2025-10-29 05:09:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00260', '2025-10-30', '464', 'ASSIGN', '2025-10-29 05:09:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP17', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00261', '2025-10-29', '439', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00262', '2025-10-29', '440', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP08', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00263', '2025-10-29', '441', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP08', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00264', '2025-10-29', '442', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP05', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00265', '2025-10-29', '443', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP06', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00266', '2025-10-29', '444', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP16', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00267', '2025-10-29', '445', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP03', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00268', '2025-10-29', '446', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP09', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00269', '2025-10-29', '447', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP01', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00270', '2025-10-29', '448', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP10', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00271', '2025-10-29', '449', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00272', '2025-10-29', '450', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP12', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00273', '2025-10-29', '451', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP04', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00274', '2025-10-29', '452', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP13', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00275', '2025-10-29', '453', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP13', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00276', '2025-10-29', '454', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00277', '2025-10-29', '455', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP10', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00278', '2025-10-29', '456', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP12', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00279', '2025-10-29', '457', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP16', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00280', '2025-10-29', '458', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP08', 'DS053', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00281', '2025-10-29', '459', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP04', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00282', '2025-10-29', '460', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP15', 'DS055', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00283', '2025-10-29', '461', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP17', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00284', '2025-10-29', '462', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP07', 'DS005', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00285', '2025-10-29', '463', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP12', 'DS053', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00286', '2025-10-29', '465', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP07', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00287', '2025-10-29', '466', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP04', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00288', '2025-10-29', '467', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP02', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00289', '2025-10-29', '468', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP01', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00290', '2025-10-29', '469', 'RANDOM', '2025-10-29 05:13:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP15', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025DS00291', '2025-10-30', '470', 'RANDOM', '2025-10-30 07:20:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00001', '2025-10-31', '471', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP09', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00002', '2025-10-31', '472', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP12', 'DS064', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00003', '2025-10-31', '473', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP15', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00004', '2025-10-31', '474', 'RANDOM', '2025-10-31 07:55:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP03', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00005', '2025-10-31', '475', 'RANDOM', '2025-10-30 09:52:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP16', 'DS049', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00006', '2025-10-31', '476', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP01', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00007', '2025-10-31', '477', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP06', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00008', '2025-10-31', '478', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP04', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00009', '2025-10-31', '479', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP17', 'DS010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00010', '2025-10-31', '480', 'RANDOM', '2025-10-30 09:53:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D012', 'TP08', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026DS00011', '2025-10-31', '481', 'RANDOM', '2025-10-31 02:08:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D013', 'TP01', 'DS009', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HC00001', '2025-10-28', '421', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP07', 'HC010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HC00002', '2025-10-28', '1', 'ASSIGN', '2025-10-30 07:19:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP07', 'HC010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00001', '2025-09-30', '78', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00002', '2025-09-30', '79', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00003', '2025-09-30', '80', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00004', '2025-09-30', '81', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00005', '2025-09-30', '82', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00006', '2025-09-30', '83', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00007', '2025-09-30', '84', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00008', '2025-09-30', '85', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'HN010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00009', '2025-09-30', '86', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00010', '2025-09-30', '87', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00011', '2025-09-30', '88', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00012', '2025-09-30', '89', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00013', '2025-09-30', '90', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00014', '2025-09-30', '91', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00015', '2025-09-30', '92', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00016', '2025-09-30', '93', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00017', '2025-09-30', '94', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00018', '2025-09-30', '95', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00019', '2025-09-30', '96', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00020', '2025-09-30', '97', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'HN029', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00021', '2025-09-30', '98', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00022', '2025-09-30', '99', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00023', '2025-09-30', '100', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'HN029', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00024', '2025-09-30', '101', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00025', '2025-09-30', '102', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00026', '2025-09-30', '103', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00027', '2025-09-30', '104', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00028', '2025-09-30', '105', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00029', '2025-09-30', '106', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00030', '2025-09-30', '107', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00031', '2025-09-30', '108', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN029', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00032', '2025-09-30', '109', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00033', '2025-09-30', '110', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP15', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00034', '2025-09-30', '111', 'ASSIGN', '2025-10-09 07:52:00', '2026-01-30', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00035', '2025-10-02', '112', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00036', '2025-10-02', '113', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00037', '2025-10-02', '114', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00038', '2025-10-02', '115', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00039', '2025-10-02', '116', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00040', '2025-10-02', '117', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00041', '2025-10-02', '118', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00042', '2025-10-02', '119', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00043', '2025-10-02', '120', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00044', '2025-10-02', '121', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00045', '2025-10-02', '122', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00046', '2025-10-02', '123', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00047', '2025-10-02', '124', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP09', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00048', '2025-10-02', '125', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP16', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00049', '2025-10-02', '126', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00050', '2025-10-02', '127', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP13', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00051', '2025-10-02', '128', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00052', '2025-10-02', '129', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00053', '2025-10-02', '130', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00054', '2025-10-02', '131', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP04', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00055', '2025-10-02', '132', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00056', '2025-10-02', '133', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00057', '2025-10-02', '134', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00058', '2025-10-02', '135', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00059', '2025-10-02', '136', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00060', '2025-10-02', '137', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00061', '2025-10-02', '138', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP05', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00062', '2025-10-02', '139', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP12', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00063', '2025-10-02', '140', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00064', '2025-10-02', '141', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'HN020', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00065', '2025-10-02', '142', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00066', '2025-10-14', '144', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP03', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00067', '2025-10-14', '145', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP02', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00068', '2025-10-14', '146', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP16', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00069', '2025-10-14', '147', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP08', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00070', '2025-10-14', '148', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP15', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00071', '2025-10-14', '149', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP07', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00072', '2025-10-14', '150', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP13', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00073', '2025-10-14', '151', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP10', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00074', '2025-10-14', '152', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP05', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00075', '2025-10-14', '153', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP15', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00076', '2025-10-14', '154', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP04', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00077', '2025-10-14', '155', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP09', 'HN001', 'HG03');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00078', '2025-10-14', '156', 'RANDOM', '2025-10-15 03:02:00', '2026-02-13', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D004', 'TP06', 'HN001', 'HG03');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00079', '2025-10-15', '143', 'ASSIGN', '2025-10-16 01:45:00', '2026-02-15', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D005', 'TP17', 'HN010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00080', '2025-10-20', '144', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP16', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00081', '2025-10-20', '145', 'ASSIGN', '2025-10-20 07:16:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00082', '2025-10-20', '146', 'RANDOM', '2025-10-20 07:19:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP01', 'HN020', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00083', '2025-10-20', '147', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP17', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00084', '2025-10-20', '148', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP04', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00085', '2025-10-20', '149', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP13', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00086', '2025-10-20', '150', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP08', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00087', '2025-10-20', '151', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP15', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00088', '2025-10-20', '152', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP03', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00089', '2025-10-20', '153', 'RANDOM', '2025-10-20 07:18:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D007', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00090', '2025-10-20', '154', 'ASSIGN', '2025-10-21 07:15:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00091', '2025-10-20', '155', 'ASSIGN', '2025-10-21 07:15:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00092', '2025-10-20', '156', 'ASSIGN', '2025-10-21 07:15:00', '2026-02-20', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D008', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00093', '2025-10-23', '157', 'RANDOM', '2025-10-23 09:35:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP15', 'HN011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00094', '2025-10-23', '157', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP13', 'HN001', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00095', '2025-10-23', '158', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP15', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00096', '2025-10-23', '159', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP05', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00097', '2025-10-23', '160', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00098', '2025-10-23', '161', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP09', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00099', '2025-10-23', '162', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP15', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00100', '2025-10-23', '163', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP16', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00101', '2025-10-23', '164', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP13', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00102', '2025-10-23', '165', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP04', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00103', '2025-10-23', '166', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP07', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00104', '2025-10-23', '167', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP03', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00105', '2025-10-23', '168', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP17', 'HN020', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00106', '2025-10-23', '169', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP06', 'HN020', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00107', '2025-10-23', '170', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP12', 'HN020', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00108', '2025-10-23', '171', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP12', 'HN020', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00109', '2025-10-23', '172', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP08', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00110', '2025-10-23', '173', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP01', 'HN020', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00111', '2025-10-23', '174', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP10', 'HN001', 'HG04');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00112', '2025-10-23', '175', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP07', 'HN020', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00113', '2025-10-23', '176', 'RANDOM', '2025-10-25 08:31:00', '2026-02-23', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D009', 'TP02', 'HN001', 'HG05');
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00114', '2025-10-28', '158', 'ASSIGN', '2025-10-28 04:14:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP02', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00115', '2025-10-28', '159', 'RANDOM', '2025-10-28 04:46:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D010', 'TP01', 'HN020', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00116', '2025-10-30', '160', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP07', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00117', '2025-10-30', '161', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP06', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00118', '2025-10-30', '162', 'ASSIGN', '2025-10-29 05:09:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00119', '2025-10-30', '163', 'RANDOM', '2025-10-29 05:11:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP17', 'HN011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00120', '2025-10-30', '164', 'ASSIGN', '2025-10-29 05:09:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP13', 'HN011', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00121', '2025-10-30', '165', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00122', '2025-10-30', '166', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP03', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00123', '2025-10-30', '167', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP16', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00124', '2025-10-30', '168', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP10', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HN00125', '2025-10-30', '169', 'RANDOM', '2025-10-29 05:12:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D011', 'TP13', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2026HN00001', '2025-10-31', '170', 'RANDOM', '2025-10-31 02:07:00', '2026-02-28', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D013', 'TP01', 'HN001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00001', '2025-08-26', '26', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HS211', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00002', '2025-08-26', '27', 'ASSIGN', '2025-10-09 07:52:00', '2025-10-26', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HS211', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00003', '2025-10-14', '33', 'ASSIGN', '2025-10-30 14:57:00', '2025-12-14', 'WAITING_FOR_ASSIGNMENT', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HS038', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00004', '2025-10-20', '34', 'ASSIGN', '2025-10-30 14:58:00', '2025-12-20', 'WAITING_FOR_ASSIGNMENT', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HS035', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00005', '2025-10-27', '35', 'ASSIGN', '2025-10-30 14:59:00', '2025-12-27', 'WAITING_FOR_ASSIGNMENT', NULL, '2025-10-01 07:52:00', '2026D001', 'TP03', 'HS027', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025HS00006', '2025-10-27', '36', 'ASSIGN', '2025-10-30 14:59:00', '2025-12-27', 'WAITING_FOR_ASSIGNMENT', NULL, '2025-10-01 07:52:00', '2026D001', 'TP01', 'HS027', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025KT00001', '2025-01-06', '1', 'ASSIGN', '2025-10-09 07:52:00', '2025-05-06', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'KT001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025KT00002', '2025-10-01', '1', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-01', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP06', 'KT025', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025KT00003', '2025-10-02', '2', 'ASSIGN', '2025-10-09 07:52:00', '2026-02-02', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D001', 'TP02', 'KT010', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025KT00004', '2025-10-08', '3', 'RANDOM', '2025-10-10 00:38:00', '2026-02-08', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D002', 'TP13', 'KT001', NULL);
INSERT INTO legal_cases(legal_case_id, acceptance_date, acceptance_number, assignment, assignment_date, expired_date, legal_case_status, note, storage_date, batch_id, judge_id, legal_relationship_id, mediator_id) VALUES ('2025KT00005', '2025-10-13', '4', 'RANDOM', '2025-10-13 07:42:00', '2026-02-12', 'IN_PROCESS', NULL, '2025-10-01 07:52:00', '2026D003', 'TP08', 'KT029', NULL);

/*Bi don */
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2022DS00001', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Bích', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00001', 'DEFENDANT', 1, 'Nguyễn Phi Hùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00002', 'DEFENDANT', 1, 'Cục dự trữ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00003', 'DEFENDANT', 1, 'Dương Thị Kích', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00004', 'DEFENDANT', 1, 'Nguyễn Thị Cẩm Trinh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00005', 'DEFENDANT', 1, 'Huỳnh Thanh Thủy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00006', 'DEFENDANT', 1, 'Nguyễn Thị Phương Linh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00007', 'DEFENDANT', 1, 'Nguyễn Thị RuLi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00008', 'DEFENDANT', 1, 'Nguyễn Bá Lộc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00008', 'DEFENDANT', 2, 'Bùi Thị Cẩm Thu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00009', 'DEFENDANT', 1, 'Trương Hoài Phong', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00010', 'DEFENDANT', 1, 'Lê Thị Huỳnh Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00011', 'DEFENDANT', 1, 'Đặng Hùng Cường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00012', 'DEFENDANT', 1, 'Nguyễn Hồng Hải', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00013', 'DEFENDANT', 1, 'Nguyễn Thanh Dân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00014', 'DEFENDANT', 1, 'Nguyễn Văn Minh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00015', 'DEFENDANT', 1, 'Nguyễn Văn Luận', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00016', 'DEFENDANT', 1, 'Nguyễn Lương Đình Nghi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00017', 'DEFENDANT', 1, 'Đặng Thị Thúy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00018', 'DEFENDANT', 1, 'Nguyễn Văn Chính', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00019', 'DEFENDANT', 1, 'Lê Thanh Hiền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'DEFENDANT', 1, 'Trịnh Văn Dứt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00021', 'DEFENDANT', 1, 'Nguyễn Thị Nga', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00021', 'DEFENDANT', 2, 'Nguyễn Văn Khanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00022', 'DEFENDANT', 1, 'Nguyễn Văn Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00023', 'DEFENDANT', 1, 'Đinh Chí Dũng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00023', 'DEFENDANT', 2, 'Châu Thúy Đường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00024', 'DEFENDANT', 1, 'Huỳnh Kim Loan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00024', 'DEFENDANT', 2, 'Mai Văn Út', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00025', 'DEFENDANT', 1, 'Trần Thị Thanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00025', 'DEFENDANT', 2, 'Huỳnh Bảo Vy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00026', 'DEFENDANT', 1, 'Phạm Thị Phượng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023HN00001', 'DEFENDANT', 1, 'Thái Thị Phỉ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00001', 'DEFENDANT', 1, 'Hồ Thị Tùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00002', 'DEFENDANT', 1, 'Phạm Văn Đum', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00002', 'DEFENDANT', 2, 'Phạm Bé Công', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00002', 'DEFENDANT', 3, 'Phạm Thanh Đoàn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00002', 'DEFENDANT', 4, 'Lê Thị Mộng Hà', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00003', 'DEFENDANT', 1, 'Trường THPT Cao Lãnh 1', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00004', 'DEFENDANT', 1, 'Trần Văn Sung', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00005', 'DEFENDANT', 1, 'Võ Thị Cẩm Hường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00005', 'DEFENDANT', 2, 'Võ Văn Nghĩa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00006', 'DEFENDANT', 1, 'Lương Văn Phong', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00007', 'DEFENDANT', 1, 'Lê Thị Phương Loan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00008', 'DEFENDANT', 1, 'Trần Quang Thiện', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00008', 'DEFENDANT', 2, 'Lê Thị Thu Thảo', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00009', 'DEFENDANT', 1, 'Đình Thần An Bình', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00009', 'DEFENDANT', 2, 'Ngô Tấn Dũng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00010', 'DEFENDANT', 1, 'Nguyễn Văn Khóa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00010', 'DEFENDANT', 2, 'Nguyễn Bé Em', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00010', 'DEFENDANT', 3, 'Nguyễn Bé Xem', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00001', 'DEFENDANT', 1, 'Nguyễn Tấn Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00001', 'DEFENDANT', 2, 'Lê Văn Thắng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00011', 'DEFENDANT', 1, 'Nguyễn Thị Tuyết', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00013', 'DEFENDANT', 1, 'Huỳnh Văn Hiền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00014', 'DEFENDANT', 1, 'Tạ Đình Tiến', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00015', 'DEFENDANT', 1, 'Nguyễn Văn Thẳng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00016', 'DEFENDANT', 1, 'Nguyễn Văn Ánh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00017', 'DEFENDANT', 1, 'Đỗ Văn Sang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00018', 'DEFENDANT', 1, 'Phan Văn Vô', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00019', 'DEFENDANT', 1, 'Võ Thị Tuyết Hồng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00019', 'DEFENDANT', 2, 'Nguyễn Anh Toàn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00019', 'DEFENDANT', 3, 'Nguyễn Anh Quốc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00020', 'DEFENDANT', 1, 'Phạm Thị Minh Thương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00021', 'DEFENDANT', 1, 'Nguyễn Thị Cẩm Trinh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00022', 'DEFENDANT', 1, 'Trần Thị Bồ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00022', 'DEFENDANT', 2, 'Nguyễn Trần Hồng Uyển', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00023', 'DEFENDANT', 1, 'Trường THCS', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00023', 'DEFENDANT', 2, 'Bình Hàng Tây', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00024', 'DEFENDANT', 1, 'Phan Hồng Huy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00024', 'DEFENDANT', 2, 'Lê Thị Giao', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00025', 'DEFENDANT', 1, 'Nguyễn Văn Thành', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00026', 'DEFENDANT', 1, 'Nguyễn Văn Đoàn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00027', 'DEFENDANT', 1, 'Huỳnh Văn Cường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00028', 'DEFENDANT', 1, 'Nguyễn Văn Phú', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00029', 'DEFENDANT', 1, 'Nguyễn Văn Thuận', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00031', 'DEFENDANT', 1, 'Nguyễn Thị Hồng Kết', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00032', 'DEFENDANT', 1, 'Nguyễn Thị Kiều Oanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00033', 'DEFENDANT', 1, 'Nguyễn Quốc Vương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00033', 'DEFENDANT', 2, 'Nguyễn Dương Minh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00034', 'DEFENDANT', 1, 'Trần Văn Giùm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00035', 'DEFENDANT', 1, 'Hà Thị Thu Hồng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00036', 'DEFENDANT', 1, 'Lương Thanh Phong', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00037', 'DEFENDANT', 1, 'Nguyễn Văn Tuấn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00038', 'DEFENDANT', 1, 'Võ Thiị Tuyết Nga', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00039', 'DEFENDANT', 1, 'Lê Thị Vân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00040', 'DEFENDANT', 1, 'Trần Thị Đẹt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00041', 'DEFENDANT', 1, 'Bùi Thị Khen', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00042', 'DEFENDANT', 1, 'Lê Thị Diễm Trang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00043', 'DEFENDANT', 1, 'Nguyễn Văn Hùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00044', 'DEFENDANT', 1, 'Nguyễn Thị Giúp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00044', 'DEFENDANT', 2, 'Nguyễn Văn Chính', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00045', 'DEFENDANT', 1, 'Ngô Thị Sạch', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00046', 'DEFENDANT', 1, 'Trần Thị Ngoan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00047', 'DEFENDANT', 1, 'Nguyễn Thị Bé', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00048', 'DEFENDANT', 1, 'Đào Chí Tâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00049', 'DEFENDANT', 1, 'Nguyễn Thị Rạnh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00050', 'DEFENDANT', 1, 'Hồ Văn Mót', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00051', 'DEFENDANT', 1, 'Chế Văn Lũy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00052', 'DEFENDANT', 1, 'Trần Kha', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00053', 'DEFENDANT', 1, 'Nguyễn Ngọc Hớn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00054', 'DEFENDANT', 1, 'Nguyễn Văn Tám', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00055', 'DEFENDANT', 1, 'Ngô Bích Hương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00055', 'DEFENDANT', 2, 'Huỳnh Văn Thường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00056', 'DEFENDANT', 1, 'CTCP Phát Tiến 2', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00057', 'DEFENDANT', 1, 'CTCP Đầu tư phát triển Việt Hưng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00058', 'DEFENDANT', 1, 'Nguyễn Minh Lý', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00059', 'DEFENDANT', 1, 'Đặng Thị Thu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00059', 'DEFENDANT', 2, 'Nguyễn Văn Lâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00060', 'DEFENDANT', 1, 'Nguyễn Văn Tâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00061', 'DEFENDANT', 1, 'Lê Thị Thanh Tuyền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00062', 'DEFENDANT', 1, 'Nguyễn Thị Phượng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00063', 'DEFENDANT', 1, 'Nguyễn Giang Châu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00064', 'DEFENDANT', 1, 'Nguyễn Bá Dũng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00065', 'DEFENDANT', 1, 'Lê Văn Thu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00066', 'DEFENDANT', 1, 'Trương Ngọc Hiển', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00067', 'DEFENDANT', 1, 'Lương Thanh Hóa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00068', 'DEFENDANT', 1, 'Bùi Thị Hồng Thu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024HN00001', 'DEFENDANT', 1, 'Đỗ Văn Lụa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024HN00002', 'DEFENDANT', 1, 'Lê Thị Kim Phượng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024KT00001', 'DEFENDANT', 1, 'Công ty TNHH Thủy sản Hiệp Thành Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00002', 'DEFENDANT', 1, 'Nguyễn Hùng Phi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00003', 'DEFENDANT', 1, 'Lương Văn Phi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00004', 'DEFENDANT', 1, 'Ngô Văn Vinh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00004', 'DEFENDANT', 2, 'Nguyễn Việt Khang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00005', 'DEFENDANT', 1, 'Nguyễn Văn Phụng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00006', 'DEFENDANT', 1, 'Lê Văn Hiền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00007', 'DEFENDANT', 1, 'Nguyễn Thị Út', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00008', 'DEFENDANT', 1, 'Võ Thị Bé Tư', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00009', 'DEFENDANT', 1, 'Võ Thị Nhiều', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00010', 'DEFENDANT', 1, 'Bùi Văn Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00011', 'DEFENDANT', 1, 'Nguyễn Tấn Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00012', 'DEFENDANT', 1, 'Phan Văn Dũng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00013', 'DEFENDANT', 1, 'Huỳnh Ngọc Quý', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00014', 'DEFENDANT', 1, 'Huỳnh Bảo Anh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00015', 'DEFENDANT', 1, 'Nguyễn Văn Thật', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00016', 'DEFENDANT', 1, 'Nguyễn Hoàng Nhật', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00017', 'DEFENDANT', 1, 'Hoàng Thị Anh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00018', 'DEFENDANT', 1, 'Nguyễn Thanh Mỹ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00019', 'DEFENDANT', 1, 'Huỳnh Kim Huệ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00020', 'DEFENDANT', 1, 'Đỗ Văn Dũng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00022', 'DEFENDANT', 1, 'Đoàn Tấn Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00024', 'DEFENDANT', 1, 'Nguyễn Văn Thái', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00025', 'DEFENDANT', 1, 'Nguyễn Phương Hồng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00026', 'DEFENDANT', 1, 'Nguyễn Thị Tắc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00026', 'DEFENDANT', 2, 'Trịnh Văn Cột', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00027', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Điệp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00027', 'DEFENDANT', 2, 'Ngô Thanh Bình', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00028', 'DEFENDANT', 1, 'Huỳnh Hữu Phước', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00029', 'DEFENDANT', 1, 'Đinh Thị Lến', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00030', 'DEFENDANT', 1, 'Phạm Thị Chưởng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00031', 'DEFENDANT', 1, 'Mai Thị Thùy Linh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00032', 'DEFENDANT', 1, 'Hồ Thị Phượng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00033', 'DEFENDANT', 1, 'Lê Thị Út', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00034', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Huyền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00035', 'DEFENDANT', 1, 'Bùi Văn Cuội', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00036', 'DEFENDANT', 1, 'Đỗ Thị Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00037', 'DEFENDANT', 1, 'Dưu thị Kim Cương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00038', 'DEFENDANT', 1, 'Nguyễn Khoa Nam', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00039', 'DEFENDANT', 1, 'Trần Văn Be', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00040', 'DEFENDANT', 1, 'Nguyễn Thanh Bình', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00042', 'DEFENDANT', 1, 'Lục Thành Nguyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00043', 'DEFENDANT', 1, 'Dương Văn Đức', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00044', 'DEFENDANT', 1, 'Nguyễn Thị Ni', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00044', 'DEFENDANT', 2, 'Phạm Anh Tuấn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00045', 'DEFENDANT', 1, 'Nguyễn Văn Hoanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00046', 'DEFENDANT', 1, 'Nguyễn Văn Dỉ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00047', 'DEFENDANT', 1, 'Lê Văn Bá', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00048', 'DEFENDANT', 1, 'Huỳnh Văn Tặng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00049', 'DEFENDANT', 1, 'Trần Thị Thúy Lan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00050', 'DEFENDANT', 1, 'Nguyễn Văn Cường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00051', 'DEFENDANT', 1, 'Võ Tuấn Hải', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00052', 'DEFENDANT', 1, 'Bùi Quang Vũ Ngô Thị Thanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00053', 'DEFENDANT', 1, 'Ngô Hoàng Anh Khôi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00054', 'DEFENDANT', 1, 'Trần Hoàng Khải', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00055', 'DEFENDANT', 1, 'Nguyễn Hữu Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00055', 'DEFENDANT', 2, 'Bùi Thanh Hiền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00056', 'DEFENDANT', 1, 'Lê Thị Nết', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00057', 'DEFENDANT', 1, 'Nguyễn Thị Kiều Diễm', 1985, 'Ấp Hoà Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00057', 'DEFENDANT', 2, 'Nguyễn Thanh Tuấn', 1983, 'Ấp Hoà Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00058', 'DEFENDANT', 1, 'Thái Văn Mạnh', 1980, 'Tổ 26, ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00058', 'DEFENDANT', 2, 'Lê Thị Tuyết Mai', 1981, 'Tổ 26, ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00059', 'DEFENDANT', 1, 'Võ Văn Hà', 1982, 'Ấp Phú Thuận, xã Tân Phú Đông, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00059', 'DEFENDANT', 2, 'Nguyễn Thị Thu Sương', 1979, 'Ấp Phú Thuận, xã Tân Phú Đông, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00060', 'DEFENDANT', 1, 'Nguyễn Văn Đổi', 1970, 'Khóm Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00061', 'DEFENDANT', 1, 'Hồ Văn Dũng', 1952, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00062', 'DEFENDANT', 1, 'Công ty TNHH MTV Phát triển Chợ Thảo Huyên', NULL, 'Khóm Mỹ Tây, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00064', 'DEFENDANT', 1, 'Biện Kim Thanh', 2001, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00065', 'DEFENDANT', 1, 'Trần Văn Hùng', NULL, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00066', 'DEFENDANT', 1, 'Nguyễn Tấn Lương', NULL, 'Ấp Bình Phú Long, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00067', 'DEFENDANT', 1, 'Nguyễn Hoàng Giang', 1984, 'Ấp 6, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00068', 'DEFENDANT', 1, 'Nguyễn Văn Cường', NULL, 'Ấp Bình Hoà, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00069', 'DEFENDANT', 1, 'Võ Thị Út', 1920, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00069', 'DEFENDANT', 2, 'Nguyễn Thanh Tuyền', 1962, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00069', 'DEFENDANT', 3, 'Nguyễn Thanh Huỳnh', 1965, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00070', 'DEFENDANT', 1, 'Dương Xuân Thượng', NULL, 'Ấp 2, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00071', 'DEFENDANT', 1, 'Võ Văn Mừng', 1966, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00071', 'DEFENDANT', 2, 'Sơn Bích Thuỷ', 1964, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00072', 'DEFENDANT', 1, 'Nguyễn Nam Hùng', 1991, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00073', 'DEFENDANT', 1, 'Hồ Thanh Thiên', NULL, 'Ấp 4, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00074', 'DEFENDANT', 1, 'Dương Phước Đức', 1964, 'Khóm Mỹ Thới, xã  Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00074', 'DEFENDANT', 2, 'Huỳnh Thị Út', 1965, 'Khóm Mỹ Thới, xã  Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00075', 'DEFENDANT', 1, 'Võ Văn Phan', 1961, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00076', 'DEFENDANT', 1, 'Phan Văn Hùng Em', 1963, 'Ấp AB, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00077', 'DEFENDANT', 1, 'Nguyễn Hồng Phục', 1975, 'Ấp Mỹ Thạnh, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00078', 'DEFENDANT', 1, 'Nguyễn Thanh Nhã - Doanh nghiệp tư nhân Phúc Khang Thịnh', NULL, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00080', 'DEFENDANT', 1, 'Lê Văn Vũ', 1975, 'ấp Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00081', 'DEFENDANT', 1, 'Nguyễn Hữu Phương', 1977, 'Tổ 08, khóm Mỹ Thượng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00081', 'DEFENDANT', 2, 'Bùi Thị Thanh Hiền', 1980, 'Tổ 08, khóm Mỹ Thượng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00082', 'DEFENDANT', 1, 'Trần Lý Hùng', 1992, 'Tổ 9, ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00083', 'DEFENDANT', 1, 'Nguyễn Thị Cẩm Linh', 2003, 'Ấp Mỹ Thạnh, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00084', 'DEFENDANT', 1, 'Nguyễn Văn Tính', NULL, 'Ấp Tây Mỹ, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00084', 'DEFENDANT', 2, 'Nguyễn Thị Cẩm Giang', NULL, 'Ấp Tây Mỹ, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00085', 'DEFENDANT', 1, 'Nguyễn Hồng Phục', 1975, 'Ấp Mỹ Thạnh, xã Mỹ Thọ,ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00086', 'DEFENDANT', 1, 'Trần Văn Hóa', 1979, 'Ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00086', 'DEFENDANT', 2, 'Lương Thị Phương Thảo', 1979, 'Ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00087', 'DEFENDANT', 1, 'Võ Văn Mừng', 1937, 'ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00087', 'DEFENDANT', 2, 'Huỳnh Thị Nở', 1937, 'ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00088', 'DEFENDANT', 1, 'Huỳnh Văn Tuấn', 1972, 'ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00089', 'DEFENDANT', 1, 'Võ Quốc Trung', 1978, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00090', 'DEFENDANT', 1, 'Phan Bá Đức 1963', NULL, 'khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00090', 'DEFENDANT', 2, 'Phan Kim Huệ', 1962, 'khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00091', 'DEFENDANT', 1, 'Huỳnh Văn Dương', 1978, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00092', 'DEFENDANT', 1, 'Võ Văn Phụng', 1973, 'Ấp 5, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00093', 'DEFENDANT', 1, 'Công ty TNHH MTV Phạm Hoàng', NULL, 'Khóm An Lạc, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00094', 'DEFENDANT', 1, 'Lương Văn Sáu', 1963, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00095', 'DEFENDANT', 1, 'Trần Văn Dương', 1945, 'ấp Tân Trường, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00095', 'DEFENDANT', 2, 'Trần Quang Đại', 1982, 'ấp Tân Trường, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00095', 'DEFENDANT', 3, 'Trần Thị Bé Tám', 1983, 'ấp Tân Trường, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00096', 'DEFENDANT', 1, 'Trương Văn Sơn', 1982, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00096', 'DEFENDANT', 2, 'Nguyễn Thị Kim Anh', 1980, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00097', 'DEFENDANT', 1, 'Nguyễn Văn Tháo', 1960, 'ấp 6, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00097', 'DEFENDANT', 2, 'Phan Thị Tha', NULL, 'ấp 6, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00098', 'DEFENDANT', 1, 'Đào Thị Nga', 1980, 'ấp Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00099', 'DEFENDANT', 1, 'Phạm Duy', 1989, 'Ấp Tân Trường, xã Trà Côn, Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00100', 'DEFENDANT', 1, 'Dương Văn Bảy', 1958, 'Ấp Thanh Tiến, xã Nhị Mỹ, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00100', 'DEFENDANT', 2, 'Dương Kim Phấn', 1960, 'Ấp Thanh Tiến, xã Nhị Mỹ, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00101', 'DEFENDANT', 1, 'Hồ Phạm Hữu Bằng', NULL, 'Cụm Dân cư khóm Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00102', 'DEFENDANT', 1, 'Võ Thị Huỳnh Như', NULL, 'Tổ 15, ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00103', 'DEFENDANT', 1, 'Nguyễn Văn Thành', NULL, 'Tổ 11, ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00104', 'DEFENDANT', 1, 'Huỳnh Vũ Kha', NULL, 'Ấp Mỹ Thạnh, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00105', 'DEFENDANT', 1, 'Trương Thị Ngọc Mai', NULL, 'Ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00106', 'DEFENDANT', 1, 'Nguyễn Minh Trường', 1987, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00107', 'DEFENDANT', 1, 'Nguyễn Anh Kiệt', 1972, '10F8 khu 500 căn, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00108', 'DEFENDANT', 1, 'Lê Chánh Tính', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00109', 'DEFENDANT', 1, 'Trần Ngọc Thanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00110', 'DEFENDANT', 1, 'Nguyễn Phước Nguyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00112', 'DEFENDANT', 1, 'Đặng Văn Tốt', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00113', 'DEFENDANT', 1, 'Phạm Thị Bích Nơi', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00114', 'DEFENDANT', 1, 'Trần Văn Út Nhỏ', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00115', 'DEFENDANT', 1, 'Huỳnh Thanh Sang', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00116', 'DEFENDANT', 1, 'Nguyễn Văn Phú', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00117', 'DEFENDANT', 1, 'Nguyễn Văn Tâm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00119', 'DEFENDANT', 1, 'Nguyễn Hoàng Kha', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00119', 'DEFENDANT', 2, 'Nguyễn Đoàn Anh Thư', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00120', 'DEFENDANT', 1, 'Nguyễn Hồng Thái', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00121', 'DEFENDANT', 1, 'Nguyễn Văn Việt', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00122', 'DEFENDANT', 1, 'Đặng Hoàng Cường', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00123', 'DEFENDANT', 1, 'Nguyễn Xuân Khoa', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00124', 'DEFENDANT', 1, 'Nguyễn Minh Ảnh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00125', 'DEFENDANT', 1, 'Nguyễn Thanh Rồng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00126', 'DEFENDANT', 1, 'Trần Võ Trang Thanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00127', 'DEFENDANT', 1, 'Nguyễn Hữu Phương', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00128', 'DEFENDANT', 1, 'Nguyễn Văn Quẹo', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00128', 'DEFENDANT', 2, 'Hồ Thị Nghĩa', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00129', 'DEFENDANT', 1, 'Nguyễn Văn Tới', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00130', 'DEFENDANT', 1, 'Trần Thị Chúc', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00130', 'DEFENDANT', 2, 'Nguyễn Đức Hoà', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00131', 'DEFENDANT', 1, 'Nguyễn Hoài Hận', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00133', 'DEFENDANT', 1, 'Hồ Văn Hòa', 1972, 'Tổ 8, ấp 4, xã Mỹ Hiệp, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00133', 'DEFENDANT', 2, 'Phạm Thị Thùy Trang', 1973, 'Tổ 8, ấp 4, xã Mỹ Hiệp, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00134', 'DEFENDANT', 1, 'Hồ Văn Hòa', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00135', 'DEFENDANT', 1, 'Lê Trung Hải', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00135', 'DEFENDANT', 2, 'Nguyễn Thị Ánh Nguyệt', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00136', 'DEFENDANT', 1, 'Võ Thị Hồng Phấn', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00137', 'DEFENDANT', 1, 'Dương Quốc Bảo', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00138', 'DEFENDANT', 1, 'Nguyễn Thị Hồng Thắm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00138', 'DEFENDANT', 2, 'Lê Huỳnh Nhật Đạo', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00139', 'DEFENDANT', 1, 'Cao Kim Chi', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00140', 'DEFENDANT', 1, 'Hồ Phước Hải', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00141', 'DEFENDANT', 1, 'Lê Hồng Phúc', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00142', 'DEFENDANT', 1, 'Trần Văn Đức', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00143', 'DEFENDANT', 1, 'Dương Quốc Bảo', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00144', 'DEFENDANT', 1, 'Võ Thị Hồng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00145', 'DEFENDANT', 1, 'Huỳnh Như', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00146', 'DEFENDANT', 1, 'Lê Thị Oanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00147', 'DEFENDANT', 1, 'Võ Thị Thúy An', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00148', 'DEFENDANT', 1, 'Nguyễn Hồng Phục', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00149', 'DEFENDANT', 1, 'Lê Thị Trúc Mai', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00150', 'DEFENDANT', 1, 'Trần Thị Năm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00151', 'DEFENDANT', 1, 'Nguyễn Thị Bạch Tuyết', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00151', 'DEFENDANT', 2, 'Lê Tấn Trà', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00152', 'DEFENDANT', 1, 'Huỳnh Thanh Tùng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00152', 'DEFENDANT', 2, 'Lê Trung Lãm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00153', 'DEFENDANT', 1, 'Nguyễn Thị Phượng Liên', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00154', 'DEFENDANT', 1, 'Hứa Hoàng Minh Như', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00155', 'DEFENDANT', 1, 'Nguyễn Văn Vui', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00156', 'DEFENDANT', 1, 'Lâm Minh Hiền', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00156', 'DEFENDANT', 2, 'Nguyễn Thị Hồng Tâm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00157', 'DEFENDANT', 1, 'Đào Thị Hiểu', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00158', 'DEFENDANT', 1, 'Nguyễn Hồng Phước', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00159', 'DEFENDANT', 1, 'Trần Thị Khanh', NULL, 'Ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00160', 'DEFENDANT', 1, 'Võ Ngọc Nữ', NULL, 'Khóm Mỹ Phú, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00160', 'DEFENDANT', 2, 'Võ Ngọc Tiên', NULL, 'Khóm Mỹ Phú, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00161', 'DEFENDANT', 1, 'Đặng Hoàng Cường', NULL, 'Tổ 1, ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00162', 'DEFENDANT', 1, 'Phan Văn Tú', NULL, 'Tổ 5, ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00163', 'DEFENDANT', 1, 'Võ Chí Thanh', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00163', 'DEFENDANT', 2, 'Bùi Thị Hoàng', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00164', 'DEFENDANT', 1, 'Đào Kim Ngoan', NULL, 'Ấp 5, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00165', 'DEFENDANT', 1, 'Nguyễn Anh Huy', NULL, 'Số 10 Nguyễn Hữu Cầu, TP Quy Nhơn, tỉnh Bình Định');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00166', 'DEFENDANT', 1, 'Nguyễn Thị Thanh Phương', NULL, 'Số 56 Nguyễn Huệ, khóm Mỹ Phú, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00167', 'DEFENDANT', 1, 'Nguyễn Thị Bé Tiền', NULL, 'Số 56, xã Hoà An, TP CL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00168', 'DEFENDANT', 1, 'Nguyễn Hoàng Tuấn Vũ', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00168', 'DEFENDANT', 2, 'Lê Thị Cẩm', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00169', 'DEFENDANT', 1, 'Lê Thị Trúc Phương', NULL, 'Ấp 1, xã Phú Ninh, huyện Tam Nông, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00169', 'DEFENDANT', 2, 'Võ Thị Trúc Mai', NULL, 'Tổ 12, ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00170', 'DEFENDANT', 1, 'Nguyễn Đông Hồ', NULL, 'Tổ 2B, ấp An Lạc, xã An Bình, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00171', 'DEFENDANT', 1, 'Nguyễn Hoàng Tâm', NULL, 'Tổ 1, khóm Hoà Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'DEFENDANT', 1, 'Bùi Thanh Hà', NULL, 'Ấp 4, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'DEFENDANT', 2, 'Lương Hồng Nhung', NULL, 'Ấp 4, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'DEFENDANT', 3, 'Bùi Thanh Bình', NULL, 'Ấp 4, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'DEFENDANT', 4, 'Bùi Việt Thống', NULL, 'Ấp 4, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'DEFENDANT', 5, 'Bùi Hồng Gấm', NULL, 'Ấp 4, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00173', 'DEFENDANT', 1, 'Huỳnh Việt Trung', NULL, 'Số 93, phường 1, TPCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00174', 'DEFENDANT', 1, 'Nguyễn Thị Thanh Thuý', NULL, 'Tổ 9, ấp Hoà Dân, xã Nhị Mỹ, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00175', 'DEFENDANT', 1, 'Nguyễn Văn Thâu', NULL, 'Tổ 9, ấp An Lạc, xã An Bình, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00175', 'DEFENDANT', 2, 'Trương Thị Đậm', NULL, 'Tổ 9, ấp An Lạc, xã An Bình, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00176', 'DEFENDANT', 1, 'Nguyễn Thị Toan', NULL, 'tổ 54, khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00177', 'DEFENDANT', 1, 'Phạm Duy Linh', NULL, 'Tổ 41, ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00178', 'DEFENDANT', 1, 'Lê Minh Hùng', 1971, '24 Trần Văn Phụng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00178', 'DEFENDANT', 2, 'Tô Thị Thùy Linh', 1988, '24 Trần Văn Phụng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00179', 'DEFENDANT', 1, 'Mai Thanh Hà', NULL, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00180', 'DEFENDANT', 1, 'Trần Thị Hương', 1976, 'ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00181', 'DEFENDANT', 1, 'Nguyễn Chí Cường', 1991, 'Ấp 2, xã Mỹ Long, HCL, ĐT(nay là xã Mỹ Hiệp, ĐT)');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00182', 'DEFENDANT', 1, 'Nguyễn Văn Vũ Phong', 1981, 'Tổ 17, ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00183', 'DEFENDANT', 1, 'Nguyễn Doãn Phong', 1971, 'khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00184', 'DEFENDANT', 1, 'Trần Thị Phượng', 1971, 'Ấp 4, xã Tân Hội Trung, HCL, ĐT nay là xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00184', 'DEFENDANT', 2, 'Nguyễn Văn Còi', 1967, 'Ấp 4, xã Tân Hội Trung, HCL, ĐT nay là xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00185', 'DEFENDANT', 1, 'Phạm Minh Thiền', 1993, 'ấp Bình Phú Long,  xã Bình Hàng Tây, HCL, ĐT nay là xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00186', 'DEFENDANT', 1, 'Võ Minh Mẫn', 1980, 'Tổ 17, ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00186', 'DEFENDANT', 2, 'Nguyễn Thị Lệ Thi', 1983, 'Tổ 17, ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00187', 'DEFENDANT', 1, 'Nguyễn Minh Thiện', 1994, 'Ấp Bình Phú Lợi, xã Bình Thanh, HCL, ĐT nay là xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00188', 'DEFENDANT', 1, 'Trần Minh Thuận', 1968, 'khóm Mỹ Tây, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00188', 'DEFENDANT', 2, 'Dương Kim Thúy', 1969, 'khóm Mỹ Tây, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00189', 'DEFENDANT', 1, 'Nguyễn Thanh Bạch', 1973, 'phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00189', 'DEFENDANT', 2, 'Huỳnh Kim Thu', 1981, 'phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00190', 'DEFENDANT', 1, 'Dương Văn Bình', 1979, 'phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00191', 'DEFENDANT', 1, 'Đoàn Thị Ánh Nguyệt', NULL, 'ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00191', 'DEFENDANT', 2, 'Nguyễn Phước Duy', NULL, 'ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00192', 'DEFENDANT', 1, 'Cao Văn Thiện', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00193', 'DEFENDANT', 1, 'Nguyễn An Vị', 1989, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00193', 'DEFENDANT', 2, 'Lê Thị Bích Ngọc', 1992, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00194', 'DEFENDANT', 1, 'Huỳnh Ngọc Sang', 1991, 'Ấp Bình Tân, xã Bình Thạnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00195', 'DEFENDANT', 1, 'Nguyễn Văn Bảy', NULL, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00195', 'DEFENDANT', 2, 'Nguyễn Thị Nga', NULL, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00197', 'DEFENDANT', 1, 'Võ Văn Xuân', NULL, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00198', 'DEFENDANT', 1, 'Văn phòng Công chứng Huỳnh Việt Trung', NULL, 'Nguyễn Trãi, ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00199', 'DEFENDANT', 1, 'Thái Văn Phong', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00200', 'DEFENDANT', 1, 'Lê Thị Ngọc Hân', NULL, 'Ấp An Phú, xã Mỹ An Hưng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00201', 'DEFENDANT', 1, 'Phan Văn Bé', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00201', 'DEFENDANT', 2, 'Trần Thị Hồng Trắng', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00202', 'DEFENDANT', 1, 'Võ Thành Sang', NULL, 'Ấp 3, xã An Hoà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00202', 'DEFENDANT', 2, 'Hồng Thị Yến', NULL, 'Ấp 3, xã An Hoà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00203', 'DEFENDANT', 1, 'Phạm Thị So Em', NULL, 'Ấp Tân Đông B, xã Thanh Bình, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00204', 'DEFENDANT', 1, 'Ngô Thanh Tâm', NULL, 'Khóm 2, phường Phước Hậu, Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00205', 'DEFENDANT', 1, 'Nguyễn Ngọc Thanh', NULL, 'Ấp 6, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00206', 'DEFENDANT', 1, 'Đoàn Thị Minh Châu', NULL, 'Ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00207', 'DEFENDANT', 1, 'Nguyễn Văn Lực', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00207', 'DEFENDANT', 2, 'Lê Thị Dúng', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00208', 'DEFENDANT', 1, 'Phan Văn Thái', NULL, 'Ấp 1, xã Thanh Hưng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00209', 'DEFENDANT', 1, 'Nguyễn Văn Rồng', NULL, 'Ấp 7, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00210', 'DEFENDANT', 1, 'Trần Kim Phượng', NULL, 'Ấp 4B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00211', 'DEFENDANT', 1, 'Nguyễn Lê Hoàng Hưng', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00212', 'DEFENDANT', 1, 'Nguyễn Kim Thúy', NULL, 'Ấp 2B, xã Bình HàngTrung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00212', 'DEFENDANT', 2, 'Võ Văn Thảo', NULL, 'Ấp 2B, xã Bình HàngTrung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00213', 'DEFENDANT', 1, 'Nguyễn Hồ Như Hậu', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00213', 'DEFENDANT', 2, 'Hồ Thị Diệu Hiền', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00213', 'DEFENDANT', 3, 'Nguyễn Thành Ngoan', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00214', 'DEFENDANT', 1, 'Lý Ngọc Vàng', NULL, 'Ấp 5B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00215', 'DEFENDANT', 1, 'Võ Ngọc Hải', NULL, 'Ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00215', 'DEFENDANT', 2, 'Lê Thị Tuyết', NULL, 'Ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00216', 'DEFENDANT', 1, 'Nguyễn Văn Hiếu', NULL, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00216', 'DEFENDANT', 2, 'Nguyễn Văn Sang', NULL, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00217', 'DEFENDANT', 1, 'Lê Văn Út', NULL, 'Ấp Bình Mỹ A, xã Bình Thạnh HCL (nay là xã Mỹ Hiệp, ĐT)');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00218', 'DEFENDANT', 1, 'Trần Thanh Bảnh', NULL, 'Ấp 4B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00218', 'DEFENDANT', 2, 'Võ Thị Bích Thảo', NULL, 'Ấp 4B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00219', 'DEFENDANT', 1, 'Nguyễn Văn Sanh', NULL, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00219', 'DEFENDANT', 2, 'Nguyễn Thị Nô', NULL, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00220', 'DEFENDANT', 1, 'Trần Văn Út Em', NULL, 'Tổ 11, ấp 2, xã Phong Mỹ, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00221', 'DEFENDANT', 1, 'Nguyễn Văn Nghĩa', NULL, 'Khóm 1, phường Mỹ Trà, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00222', 'DEFENDANT', 1, 'Phan Trường Kha', NULL, 'Khóm An Nghiệp, phường Mỹ Trà, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00223', 'DEFENDANT', 1, 'Nguyễn Hùng Khanh', NULL, 'Ấp 4T, xã Bình Hàng Trung, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00224', 'DEFENDANT', 1, 'Nguyễn Hữu Tri', NULL, 'Ấp 3,xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00224', 'DEFENDANT', 2, 'Nguyễn Minh Tạo', NULL, 'Ấp 3,xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00225', 'DEFENDANT', 1, 'Nguyễn Văn Việt', NULL, 'Ấp 2B,xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00225', 'DEFENDANT', 2, 'Võ Thị Huệ', NULL, 'Ấp 2B,xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00226', 'DEFENDANT', 1, 'Nguyễn Thanh Hồng', NULL, 'Ấp 3, xã Phương Trà, HCL cũ nay là xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00227', 'DEFENDANT', 1, 'Võ Quốc Thống', NULL, 'Ấp 2T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00228', 'DEFENDANT', 1, 'Đỗ Thị Nhé', NULL, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00229', 'DEFENDANT', 1, 'Nguyễn Thái An', NULL, 'Khóm Nguyễn Cử, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00230', 'DEFENDANT', 1, 'Nguyễn Thành Phước', NULL, 'Ấp Tân Tịch, xã Tịnh Thới, tp Cao Lãnh, nay là phường Cao Lãnh ), ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00231', 'DEFENDANT', 1, 'Lâm Thị Hồng Vân', NULL, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00232', 'DEFENDANT', 1, 'Huỳnh Thị Lượm', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00232', 'DEFENDANT', 2, 'Nguyễn Quốc Phong', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00233', 'DEFENDANT', 1, 'Lê Thị Quyên', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00233', 'DEFENDANT', 2, 'Nguyễn Văn No', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00233', 'DEFENDANT', 3, 'Huỳnh Thị Bé Năm', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00234', 'DEFENDANT', 1, 'Võ Hồng Thanh', NULL, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00235', 'DEFENDANT', 1, 'Huỳnh Văn Bé', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00236', 'DEFENDANT', 1, 'Hồ Chí Thiện', NULL, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00237', 'DEFENDANT', 1, 'Lê Thị Kim Dung', NULL, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00238', 'DEFENDANT', 1, 'Nguyễn Minh Hải', NULL, '164 A Lê Duẫn, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00239', 'DEFENDANT', 1, 'Trần Thị Quyến', NULL, 'Ấp Mỹ Long 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00239', 'DEFENDANT', 2, 'Lê Quốc Thái', NULL, 'Ấp Mỹ Long 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00239', 'DEFENDANT', 3, 'Lê Quốc Vương', NULL, 'Ấp Mỹ Long 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00240', 'DEFENDANT', 1, 'Lê Thị Trúc Mai', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00241', 'DEFENDANT', 1, 'Trịnh Thị Mộng Lành - chủ hộ kinh doanh vật liệu xây dựng Như Tuyền', NULL, '469 Điện Biên Phủ, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00242', 'DEFENDANT', 1, 'Lương Lý Huỳnh', NULL, 'Ấp 3, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00243', 'DEFENDANT', 1, 'Nguyễn Văn Ly', NULL, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00245', 'DEFENDANT', 1, 'Huỳnh Võ Điền', NULL, 'Khóm Mỹ Phú, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00246', 'DEFENDANT', 1, 'Trang Sĩ Trường Hận', NULL, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00247', 'DEFENDANT', 1, 'Châu Trung Nguyên', NULL, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00249', 'DEFENDANT', 1, 'Võ Duy La', NULL, 'Ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00250', 'DEFENDANT', 1, 'Nguyễn Văn Tiến', NULL, 'Khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00252', 'DEFENDANT', 1, 'Lê Công Hậu', NULL, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00253', 'DEFENDANT', 1, 'Lê Văn Bảo', NULL, 'Khóm An Nghiệp, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00254', 'DEFENDANT', 1, 'Nguyễn Văn Chờ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00254', 'DEFENDANT', 2, 'Nguyễn Thị Mỹ Thuận', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00255', 'DEFENDANT', 1, 'Nguyễn Thanh Hiếu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00255', 'DEFENDANT', 2, 'Nguyễn Thị Lụa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00256', 'DEFENDANT', 1, 'Đào Văn Huê', NULL, 'Ấp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00257', 'DEFENDANT', 1, 'Đàm Thị Thình', NULL, 'Khóm Hòa Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00258', 'DEFENDANT', 1, 'Nguyễn Thị Thúy Loan', NULL, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00259', 'DEFENDANT', 1, 'Huỳnh Đức Thắng', NULL, '340 Lê Đại Hành, phường Mỹ Phú, TP Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00260', 'DEFENDANT', 1, 'Thái Tường Nguyên', NULL, 'Ấp 4, xã Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00261', 'DEFENDANT', 1, 'Nguyễn Hoàng Cường', NULL, 'Ấp Mỹ Long 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00262', 'DEFENDANT', 1, 'Nguyễn Tố Trinh', NULL, 'Khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00263', 'DEFENDANT', 1, 'Nguyễn Quốc Huy', NULL, 'Ấp 3B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00264', 'DEFENDANT', 1, 'Đào Thị Như Ngọc', NULL, 'Tổ 16, ấp 3, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00265', 'DEFENDANT', 1, 'Nguyễn Thị Kiều Diễm', NULL, 'Ấp Hoà Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00266', 'DEFENDANT', 1, 'Trần Lê Hoan', NULL, 'Ấp Mỹ Long 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00267', 'DEFENDANT', 1, 'Trần Ngọc Phượng', NULL, 'Khóm An Lac, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00268', 'DEFENDANT', 1, 'Thái Duy Nam', NULL, 'Ấp 5P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00269', 'DEFENDANT', 1, 'Hà Thị Hương', NULL, 'Tổ 20, khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00270', 'DEFENDANT', 1, 'Đặng Thị Bé Thảo', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00271', 'DEFENDANT', 1, 'Phạm Thị Lan', NULL, 'Tổ 4, ấp Bình Hoà, xã Mỹ Hội, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00272', 'DEFENDANT', 1, 'Đặng Việt Long', NULL, 'Ấp 5P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00273', 'DEFENDANT', 1, 'Huỳnh Thị Út', NULL, 'Ấp AB, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00274', 'DEFENDANT', 1, 'Võ Phượng Hằng', NULL, 'Tổ 6, ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00275', 'DEFENDANT', 1, 'Dương Văn Thành', NULL, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00276', 'DEFENDANT', 1, 'Nguyễn Thị Thu Xương', NULL, 'Tổ 17, ấp Mỹ Long 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00277', 'DEFENDANT', 1, 'Nguyễn Vũ Quốc Trung', NULL, 'Tổ 10, khóm Mỹ Thượng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00278', 'DEFENDANT', 1, 'Võ Thị Trúc Mai', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00279', 'DEFENDANT', 1, 'Trần Phú Hào', NULL, 'Số 09, tổ 61, khóm 5, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00279', 'DEFENDANT', 2, 'Nguyễn Bích Thuỷ', NULL, 'Số 09, tổ 61, khóm 5, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00280', 'DEFENDANT', 1, 'Nguyễn Văn Hậu', NULL, 'Khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00281', 'DEFENDANT', 1, 'Thái Thị Hồng Loan', NULL, 'Số 38 Nguyễn Văn Trỗi, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00282', 'DEFENDANT', 1, 'Nguyễn Văn Bền', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00283', 'DEFENDANT', 1, 'Nhan Khôn Mỹ', NULL, 'Số 213C Hiền Vương, phường Phú Thạnh, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00284', 'DEFENDANT', 1, 'Công ty TNHH MTV Phát triển Chợ Thảo Huyên', NULL, 'Khóm Mỹ Tây, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 1, 'Phan Kim Tư', NULL, 'Tổ 11, ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 2, 'Nguyễn Thị Kim Vân', NULL, 'Tổ 11, ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 3, 'Nguyễn Kim Hồng', NULL, 'Tổ 11, ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 4, 'Nguyễn Hữu Nghĩa', NULL, 'Ấp Trung, xã Tân Thạnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 5, 'Nguyễn Hưng Việt', NULL, 'Số 478 Ấp Mỹ Đông Nhì, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'DEFENDANT', 6, 'Nguyễn Thị Mộng Hồ', NULL, 'Ấp Long Thạnh, xã Long Phú Thuận, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00286', 'DEFENDANT', 1, 'Nguyễn Thị Kim Cương', NULL, 'Ấp 3B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00287', 'DEFENDANT', 1, 'Trần Hữu Trí', NULL, 'Tổ 27, ấp 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00288', 'DEFENDANT', 1, 'Hồ Văn Toàn Em', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00288', 'DEFENDANT', 2, 'Khai Lệ Thanh', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00289', 'DEFENDANT', 1, 'Nguyễn Văn Quẹo', NULL, 'Âp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00289', 'DEFENDANT', 2, 'Hồ Thị Nghĩa', NULL, 'Âp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00290', 'DEFENDANT', 1, 'Nguyễn Thị Cẩm Hiếu', NULL, 'Tổ 19, ấp 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00291', 'DEFENDANT', 1, 'Nguyễn Thanh Vân', NULL, '22 Nguyễn Doãn Phong, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00291', 'DEFENDANT', 2, 'Trần Thị Kim Soan', NULL, '22 Nguyễn Doãn Phong, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00291', 'DEFENDANT', 3, 'Nguyễn Thị Ngọc Trâm', NULL, '22 Nguyễn Doãn Phong, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00001', 'DEFENDANT', 1, 'Bùi Thị Thanh Hiền', NULL, '969 Nguyễn Huệ, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00001', 'DEFENDANT', 2, 'Nguyễn Hữu Phương', NULL, '969 Nguyễn Huệ, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00003', 'DEFENDANT', 1, 'Phạm Văn Minh', NULL, 'Âp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00003', 'DEFENDANT', 2, 'Lê Hằng Ni', NULL, 'Âp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00004', 'DEFENDANT', 1, 'Nguyễn Thanh Hồng', NULL, 'Tổ 16, ấp Mỹ Đông Nhì, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00005', 'DEFENDANT', 1, 'Đỗ Thị Thu Hai', NULL, 'Ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00005', 'DEFENDANT', 2, 'Bùi Văn Hoà', NULL, 'Ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00006', 'DEFENDANT', 1, 'Dương Thị Trang', NULL, 'Ấp 2T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00007', 'DEFENDANT', 1, 'Bùi Quốc Việt', NULL, 'Ấp 3B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00008', 'DEFENDANT', 1, 'Trần Văn Mẩn', NULL, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00009', 'DEFENDANT', 1, 'Lê Thị Hà', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00009', 'DEFENDANT', 2, 'Nguyễn Minh Phụng', NULL, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00010', 'DEFENDANT', 1, 'Lê Thị Tuyết Mai', NULL, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00011', 'DEFENDANT', 1, 'Nguyễn Văn Cao', NULL, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00001', 'DEFENDANT', 1, 'Thuế tỉnh Đồng Tháp', NULL, 'Lý Thường Kiệt, phường Đạo Thạnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00001', 'DEFENDANT', 2, 'Trưởng thuế tỉnh Đồng Tháp', NULL, 'Lý Thường Kiệt, phường Đạo Thạnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00001', 'DEFENDANT', 3, 'Thuế cơ sơ 8 tỉnh Đồng Tháp', NULL, '30/4, khóm 3, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00001', 'DEFENDANT', 4, 'Trưởng thuế Cơ sở 8 tỉnh Đồng Tháp', NULL, '30/4, khóm 3, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00002', 'DEFENDANT', 1, 'Chi cục thuế KV XIX nay là Thuế TP Cần Thơ', NULL, 'Nguyễn Văn Cừ, phường Tân An, TP Cần Thơ');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00001', 'DEFENDANT', 1, 'Nguyễn Việt Sang', 1976, 'Số 19, đường Nguyễn Văn Biểu, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00002', 'DEFENDANT', 1, 'Nguyễn Thị Diễm Thúy', 1992, 'Tổ 26, ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00003', 'DEFENDANT', 1, 'Trần Thị Thúy Hằng', 1972, 'Khóm Hòa Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00004', 'DEFENDANT', 1, 'Lê Hoàng Anh', 1993, 'Tổ 11, ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00005', 'DEFENDANT', 1, 'Nguyễn Văn Út Lớn', 1992, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00006', 'DEFENDANT', 1, 'Trương Nhựt Thắng', 1998, 'ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00007', 'DEFENDANT', 1, 'Nguyễn Minh Tâm', 1974, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00008', 'DEFENDANT', 1, 'Nguyễn Thị Dung', 1973, 'Khóm Hòa Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00009', 'DEFENDANT', 1, 'Nguyễn Thị Liên', 1975, 'Tổ 12, khóm Bình Nhứt, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00010', 'DEFENDANT', 1, 'Hồ Chí Tâm', 2002, 'Khóm Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00011', 'DEFENDANT', 1, 'Nguyễn Văn Thanh', 1986, 'Tổ 17, ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00012', 'DEFENDANT', 1, 'Hồ Tuấn Anh', 1989, 'Tổ 3, ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00013', 'DEFENDANT', 1, 'Nguyễn Lê Ngọc Trúc', NULL, 'Ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00014', 'DEFENDANT', 1, 'Trần Văn Hậu', 1993, 'Tổ 34, ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00015', 'DEFENDANT', 1, 'Lê Minh Phú', 1988, 'Khóm An Nghiệp, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00016', 'DEFENDANT', 1, 'Phạm Thành Đạt', 1994, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00017', 'DEFENDANT', 1, 'Phan Xuân Ẩn', 2000, 'Ấp 2, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00018', 'DEFENDANT', 1, 'Nguyễn Văn Quí', 2000, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00019', 'DEFENDANT', 1, 'Trần Phước Danh', 1998, 'Tổ 21, ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00021', 'DEFENDANT', 1, 'Trần Thành Tâm', 1986, 'Ấp Tân Trường, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00022', 'DEFENDANT', 1, 'Nguyễn Văn Hậu', 1995, 'Tổ 7, ấp 2, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00024', 'DEFENDANT', 1, 'Phạm Thị Hiểu', 1976, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00025', 'DEFENDANT', 1, 'Huỳnh Thanh An', 1989, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00026', 'DEFENDANT', 1, 'Trần Văn Hiếu', 1985, 'khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00027', 'DEFENDANT', 1, 'Đoàn Thị Bích Trâm', 1992, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00028', 'DEFENDANT', 1, 'Nguyễn Thanh Nhàn', 1993, 'ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00029', 'DEFENDANT', 1, 'Nguyễn Kim Cương', 1993, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00030', 'DEFENDANT', 1, 'Đặng Hoàng Ẩn', 1996, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00032', 'DEFENDANT', 1, 'Nguyễn Trường Giang', 1987, 'Ấp Bình Hòa, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00033', 'DEFENDANT', 1, 'Lê Tấn Mộng', 1976, 'Khóm Nguyễn Cử, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00034', 'DEFENDANT', 1, 'Huỳnh Thị Trúc Hường', 1976, 'Ấp 4, xã Bình Hàng Trung');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00035', 'DEFENDANT', 1, 'Lê Hoàng Quí', 1995, 'Ấp Bình Hòa, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00036', 'DEFENDANT', 1, 'Trần Hoàng Phong Vũ', 1978, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00037', 'DEFENDANT', 1, 'Nguyễn Minh Luân', 1986, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00038', 'DEFENDANT', 1, 'Hồ Chí Thiện', 1986, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00039', 'DEFENDANT', 1, 'Lê Thị Mỹ Kiều', 1981, 'Khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00040', 'DEFENDANT', 1, 'Đỗ Minh Tuấn', 1990, 'ấp Mỹ Hưng Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00041', 'DEFENDANT', 1, 'Huỳnh Minh Phụng', 1989, 'khóm Nguyễn Cử, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00042', 'DEFENDANT', 1, 'Nguyễn Minh Nhí', 1990, 'phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00043', 'DEFENDANT', 1, 'Trần Thị Yến Xuân', 1995, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00044', 'DEFENDANT', 1, 'Nguyễn Văn Lừa', 1976, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00045', 'DEFENDANT', 1, 'Trần Thanh Hùng', 1993, 'Tổ 5, ấp Bình Tân, Xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00046', 'DEFENDANT', 1, 'Trần Thanh Phong', 1987, 'Ấp 2, xã Gáo Giồng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00047', 'DEFENDANT', 1, 'Nguyễn Thị Thùy Dương', 1996, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00048', 'DEFENDANT', 1, 'Trần Văn Hòa', 1977, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00049', 'DEFENDANT', 1, 'Nguyễn Hoàng Phi Hải', 1982, 'Ấp 6, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00050', 'DEFENDANT', 1, 'Võ Minh Hùng', 1969, 'ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00051', 'DEFENDANT', 1, 'Đặng Hữu Nhân', 1994, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00052', 'DEFENDANT', 1, 'Nguyễn Trí Quang', 1977, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00053', 'DEFENDANT', 1, 'Đặng Ngọc Triều', 1977, 'Ấp 7, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00054', 'DEFENDANT', 1, 'Lê Thị Phương Thảo', 1992, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00055', 'DEFENDANT', 1, 'Nguyễn Thanh Phong', 1991, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00056', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Minh', 1990, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00057', 'DEFENDANT', 1, 'Nguyễn Mỹ Trinh', 1997, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00058', 'DEFENDANT', 1, 'Võ Văn Phụng', 1991, 'ấp 5, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00059', 'DEFENDANT', 1, 'Đặng Thu Thủy', 1981, 'ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00060', 'DEFENDANT', 1, 'Nguyễn Văn Cây', 1975, 'ấp Bình Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00061', 'DEFENDANT', 1, 'Đặng Thị Hoàng Dung', 1996, 'ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00062', 'DEFENDANT', 1, 'Võ Thị Thu Liễu', 1978, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00063', 'DEFENDANT', 1, 'Mo Yuan Chu', 1985, '(Trung Quốc) Đài Loan');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00064', 'DEFENDANT', 1, 'Ngô Lê Vĩnh Phú', 1992, 'ấp An Ninh, xã Mỹ An Hưng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00065', 'DEFENDANT', 1, 'Trần Đăng Phục', 1970, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00066', 'DEFENDANT', 1, 'Lê Hồng Biên', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00067', 'DEFENDANT', 1, 'Trần Thảo Thuận', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00068', 'DEFENDANT', 1, 'Nguyễn Văn Thanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00069', 'DEFENDANT', 1, 'Nguyễn Chí Tâm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00070', 'DEFENDANT', 1, 'Võ Ngọc Hường', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00071', 'DEFENDANT', 1, 'Lê Dương Linh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00072', 'DEFENDANT', 1, 'Huỳnh Văn Sỉ', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00073', 'DEFENDANT', 1, 'Nguyễn Thị Tường Vy', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00074', 'DEFENDANT', 1, 'Nguyễn Trọng Tính', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00075', 'DEFENDANT', 1, 'Cao Văn Bình', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00076', 'DEFENDANT', 1, 'Ngô Văn Bùi', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00077', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Thẳm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00078', 'DEFENDANT', 1, 'Phan Văn Thanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00079', 'DEFENDANT', 1, 'Võ Hữu Thanh', NULL, 'Ấp Mỹ Hưng Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00080', 'DEFENDANT', 1, 'Lê Minh Kính', 1953, 'Ấp Mỹ Đông Nhì, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00081', 'DEFENDANT', 1, 'Thiệu Văn Đào', 1967, 'Tổ 17, ấp 2, xã Mỹ Long, huyện Cao Lãnh, ĐT( nay là xã Mỹ Hiệp, ĐT)');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00083', 'DEFENDANT', 1, 'Nguyễn Quốc Trung', 1980, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00084', 'DEFENDANT', 1, 'Trần Văn Lực', 1976, 'ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00085', 'DEFENDANT', 1, 'Trần Thanh Nhơn', 2001, 'ấp 1T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00086', 'DEFENDANT', 1, 'Trần Văn Đen', 1992, 'Tổ 16, ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00087', 'DEFENDANT', 1, 'Nguyễn Văn Thảo', 1991, 'Tổ 3, ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00088', 'DEFENDANT', 1, 'Lê Thị Thu Thảo', 1984, 'Ấp 3, xã Mỹ Long,HCL, ĐT nay là xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00089', 'DEFENDANT', 1, 'Huỳnh Văn Thành', 1991, 'Ấp 6, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00090', 'DEFENDANT', 1, 'Nguyễn Ngọc Nhi', NULL, 'Ấp 9, xã Phong Mỹ,ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00091', 'DEFENDANT', 1, 'Yang Chen Fu', NULL, 'Khu Tam Dân, tp Cao Hùng, Đài Loan');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00092', 'DEFENDANT', 1, 'Ly Sui Vong', NULL, 'Itali');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00093', 'DEFENDANT', 1, 'Lê Thị Ánh Tuyết', NULL, 'Ấp 3, xã Phong Mỹ, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00094', 'DEFENDANT', 1, 'Trương Minh Vương', 1992, 'Ấp 4, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00095', 'DEFENDANT', 1, 'Bùi Tấn Nghĩa', 1990, 'Ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00096', 'DEFENDANT', 1, 'Trần Văn Tuấn', 1989, 'Khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00097', 'DEFENDANT', 1, 'Lê Văn Thậm', 1977, 'Ấp 3P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00098', 'DEFENDANT', 1, 'Trần Minh Khoa', NULL, 'khóm 2, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00099', 'DEFENDANT', 1, 'Phạm Thị Hồng Huệ', NULL, 'Ấp 2T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00100', 'DEFENDANT', 1, 'Nguyễn Văn Vân', NULL, 'khóm Bình Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00101', 'DEFENDANT', 1, 'Nguyễn Lưu Viên', NULL, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00102', 'DEFENDANT', 1, 'Võ Phước An', NULL, 'Ấp 5B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00103', 'DEFENDANT', 1, 'Nguyễn Hồ Nhân', NULL, 'Ấp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00104', 'DEFENDANT', 1, 'Trần Thị Thanh Hương', NULL, 'Ấp Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00109', 'DEFENDANT', 1, 'Cao Thị Ngọc Đến', NULL, 'Ấp 5P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00111', 'DEFENDANT', 1, 'Lê Văn Tuấn', NULL, 'Ấp Mỹ Long 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00113', 'DEFENDANT', 1, 'Nguyễn Thanh Vũ', NULL, 'Ấp 2, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00114', 'DEFENDANT', 1, 'Lê Trường Xuân', NULL, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00116', 'DEFENDANT', 1, 'Lê Nguyễn Nghĩa Thành', NULL, 'Cơ sở điều trị nghiện tỉnh ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00117', 'DEFENDANT', 1, 'Nguyễn Lâm Trường', NULL, 'Khóm An Bình, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00118', 'DEFENDANT', 1, 'Lê Hoàng Kiệt', NULL, 'Khóm Bình Nhứt, phường Mỹ Trà, ĐT Hiện đang chấp hành án tại Trạm giam Mỹ Phước - Xã Tân Phước 1');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00119', 'DEFENDANT', 1, 'Bùi Văn Trượng', NULL, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00120', 'DEFENDANT', 1, 'Nguyễn Thị Ngọc Điệp', NULL, 'Tố 8, ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00121', 'DEFENDANT', 1, 'Trần Thị Bích Phượng', NULL, 'Khóm Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00122', 'DEFENDANT', 1, 'Trần Thị Kim Anh', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00123', 'DEFENDANT', 1, 'Lê Tấn Đạt', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00124', 'DEFENDANT', 1, 'Nguyễn Hoàng Nam', NULL, 'Tổ 6, ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00125', 'DEFENDANT', 1, 'Phan Thanh Hiền', NULL, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026HN00001', 'DEFENDANT', 1, 'Trương Minh Tâm', NULL, 'Tổ 14, ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00001', 'DEFENDANT', 1, 'Công ty TNHH MTV Mai Anh ĐT', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00002', 'DEFENDANT', 1, 'Công ty thương mai', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00002', 'DEFENDANT', 2, 'Dầu Khí Đồng Tháp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00003', 'DEFENDANT', 1, 'Nguyễn Thành Nguyên - Chủ HKD Nguyễn Thành Nguyên', NULL, 'Ấp An Định, xã An Bình, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00004', 'DEFENDANT', 1, 'Công ty TNHH xây dựng Đồng Tiến', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00005', 'DEFENDANT', 1, 'Nguyễn Thái Trung - chủ hộ kinh doanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00005', 'DEFENDANT', 2, 'Nguyễn Thị Cẩm Hiếu', NULL, 'Đồng Tháp');


/* Nguyên dơn, bi cao */

INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2022DS00001', 'PLAINTIFF', 1, 'Nguyễn Công Thành', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00001', 'PLAINTIFF', 1, 'Nguyễn Hoàng Minh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00002', 'PLAINTIFF', 1, 'Dư Lệ Trân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00003', 'PLAINTIFF', 1, 'Lê Thị Cẩm Hường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00004', 'PLAINTIFF', 1, 'Lê Thị Ở', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00005', 'PLAINTIFF', 1, 'Huỳnh Văn Thương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00006', 'PLAINTIFF', 1, 'Nguyễn Văn Bửu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00007', 'PLAINTIFF', 1, 'Lê Quang Việt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00008', 'PLAINTIFF', 1, 'Lê Thị Mười Em', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00009', 'PLAINTIFF', 1, 'Trương Văn Đọt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00009', 'PLAINTIFF', 2, 'Trương Thị Hằng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00010', 'PLAINTIFF', 1, 'Trần Văn Hận Em', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00011', 'PLAINTIFF', 1, 'Đặng Thanh Tâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00012', 'PLAINTIFF', 1, 'Thái Thị Thắm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00013', 'PLAINTIFF', 1, 'Nguyễn Thị Nguyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00014', 'PLAINTIFF', 1, 'Nguyễn Văn Gòn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00015', 'PLAINTIFF', 1, 'Nguyễn Thị Loan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00016', 'PLAINTIFF', 1, 'Nguyễn Thị Huỳnh Như', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00017', 'PLAINTIFF', 1, 'Nguyễn Văn Dùng Anh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00017', 'PLAINTIFF', 2, 'Nguyễn Văn Dùng Em', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00017', 'PLAINTIFF', 3, 'Nguyễn Thị Loan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00018', 'PLAINTIFF', 1, 'Võ Thị Thương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00019', 'PLAINTIFF', 1, 'Lê Hữu Khanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 1, 'Trịnh Văn Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 2, 'Trịnh Thị Sáng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 3, 'Trịnh Văn Hoàng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 4, 'Trịnh Thị Xương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 5, 'Trịnh Thị Huệ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00020', 'PLAINTIFF', 6, 'Trịnh Thị Mười', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00021', 'PLAINTIFF', 1, 'Lê Thị Hồng Liên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00021', 'PLAINTIFF', 2, 'Trần Thị Thanh Thoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00022', 'PLAINTIFF', 1, 'Nguyễn Thị Diệu Hoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00023', 'PLAINTIFF', 1, 'UBND TT Mỹ Thọ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00024', 'PLAINTIFF', 1, 'Nguyễn Thanh Hùng Phan Thị Thanh Hoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00025', 'PLAINTIFF', 1, 'Trần Văn Tuấn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023DS00026', 'PLAINTIFF', 1, 'Võ Minh Tùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2023HN00001', 'PLAINTIFF', 1, 'Nguyễn Văn Của', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00001', 'PLAINTIFF', 1, 'Lâm Thị Hoàng Xuyến', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00002', 'PLAINTIFF', 1, 'Lê Văn Dư', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00003', 'PLAINTIFF', 1, 'Ngô Thị Mỹ Đức', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00003', 'PLAINTIFF', 2, 'Ngô Văn Hai', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00004', 'PLAINTIFF', 1, 'Nguyễn Ngọc Gấm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00005', 'PLAINTIFF', 1, 'Lê Thị Trúc Ly', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00006', 'PLAINTIFF', 1, 'Nguyễn Thị Thiêu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00007', 'PLAINTIFF', 1, 'Trần Thị Dư', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00008', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quốc tế VN', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00009', 'PLAINTIFF', 1, 'Nguyễn Chi Thông', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00010', 'PLAINTIFF', 1, 'Võ Thanh Việt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00001', 'PLAINTIFF', 1, 'Trương Văn Kỳ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00011', 'PLAINTIFF', 1, 'Lê Thanh Hùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00012', 'PLAINTIFF', 1, 'Huỳnh Văn Việt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00013', 'PLAINTIFF', 1, 'Huỳnh Văn Bé', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00014', 'PLAINTIFF', 1, 'Nguyễn Thị Minh Châu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00015', 'PLAINTIFF', 1, 'Đặng Văn Long', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00016', 'PLAINTIFF', 1, 'Nguyễn Văn Buôn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00017', 'PLAINTIFF', 1, 'Đỗ Văn Thanh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00018', 'PLAINTIFF', 1, 'Đặng Văn Cường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00019', 'PLAINTIFF', 1, 'Hồ Thị Liệt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00020', 'PLAINTIFF', 1, 'Nguyễn Minh Trung', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00021', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quân đội', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00022', 'PLAINTIFF', 1, 'Nguyễn Kim Định', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00022', 'PLAINTIFF', 2, 'Nguyễn Thúy Nguyệt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00023', 'PLAINTIFF', 1, 'Phan Hồng Nga', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00024', 'PLAINTIFF', 1, 'Huỳnh Văn Biện', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00025', 'PLAINTIFF', 1, 'Nguyễn Thị Đẹp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00026', 'PLAINTIFF', 1, 'Phạm Thành Phần', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00027', 'PLAINTIFF', 1, 'Huỳnh Thị Huệ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00027', 'PLAINTIFF', 2, 'Huỳnh Thị Điệp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00028', 'PLAINTIFF', 1, 'Phan Thị Thúy Hằng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00029', 'PLAINTIFF', 1, 'Nguyễn Văn Hận', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00030', 'PLAINTIFF', 1, 'Nguyễn Thị Đẹp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00031', 'PLAINTIFF', 1, 'Nguyễn Thị Hồng Hạnh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00032', 'PLAINTIFF', 1, 'Nguyễn Văn Thoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00033', 'PLAINTIFF', 1, 'Nguyễn Thị Liễu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00034', 'PLAINTIFF', 1, 'Trần Thị Bé Ba', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00034', 'PLAINTIFF', 2, 'Trần Thị Bé Tư', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00035', 'PLAINTIFF', 1, 'Hà Thanh Cường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00036', 'PLAINTIFF', 1, 'Nguyễn Văn Tuấn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00037', 'PLAINTIFF', 1, 'Nguyễn Kim Yến', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00038', 'PLAINTIFF', 1, 'Vũ Đình Hòa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00039', 'PLAINTIFF', 1, 'Lê Thị Thu Vân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00040', 'PLAINTIFF', 1, 'Phan Thị Phước', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00041', 'PLAINTIFF', 1, 'Lê Thị Kén', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00042', 'PLAINTIFF', 1, 'Mai Văn Phùng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00043', 'PLAINTIFF', 1, 'Trần Kim Huệ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00044', 'PLAINTIFF', 1, 'Trần Thiện Chí', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00045', 'PLAINTIFF', 1, 'Lê Văn Nguyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00046', 'PLAINTIFF', 1, 'Nguyễn Thị Minh Hải', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00047', 'PLAINTIFF', 1, 'Cao Minh Hoàng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00048', 'PLAINTIFF', 1, 'Đào Văn Thét', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00049', 'PLAINTIFF', 1, 'Nguyễn Văn Tấu', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00050', 'PLAINTIFF', 1, 'Hồ Văn Thẳng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00051', 'PLAINTIFF', 1, 'Trần Thị Tư', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00052', 'PLAINTIFF', 1, 'Ngân hàng TMCP Phát triển TP.HCM', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00053', 'PLAINTIFF', 1, 'Phan Thanh Việt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00054', 'PLAINTIFF', 1, 'Võ Minh Mẫn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00055', 'PLAINTIFF', 1, 'Nguyễn Thị Xuân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00056', 'PLAINTIFF', 1, 'Công an tỉnh Đồng Tháp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00057', 'PLAINTIFF', 1, 'Công an tỉnh Đồng Tháp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00058', 'PLAINTIFF', 1, 'Lưu Ánh Trang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00059', 'PLAINTIFF', 1, 'Trần Thị Thật', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00060', 'PLAINTIFF', 1, 'Trần Văn Phê', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00061', 'PLAINTIFF', 1, 'Nguyễn Văn Tèo', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00062', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00063', 'PLAINTIFF', 1, 'Nguyễn Thị Lệ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00064', 'PLAINTIFF', 1, 'Nguyễn Kim Phụng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00065', 'PLAINTIFF', 1, 'Lê Văn Nghĩa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00066', 'PLAINTIFF', 1, 'Lương Quang Thoại', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00067', 'PLAINTIFF', 1, 'Nguyễn Thị Bé', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024DS00068', 'PLAINTIFF', 1, 'Bùi Tuyết Vân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024HN00001', 'PLAINTIFF', 1, 'Nguyễn Thị Kim Hoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024HN00002', 'PLAINTIFF', 1, 'Trần Văn Khỏe', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2024KT00001', 'PLAINTIFF', 1, 'Công ty TNHH Kawaii NL', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00002', 'PLAINTIFF', 1, 'Trần Anh Kiệt', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00003', 'PLAINTIFF', 1, 'Công an tỉnh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00003', 'PLAINTIFF', 2, 'Đồng Tháp', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00004', 'PLAINTIFF', 1, 'Trần Thị Xương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00004', 'PLAINTIFF', 2, 'Ngân hàng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00004', 'PLAINTIFF', 3, 'Phương Đông', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00005', 'PLAINTIFF', 1, 'Lê Văn Diện', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00006', 'PLAINTIFF', 1, 'Lâm Thị Đáng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00007', 'PLAINTIFF', 1, 'Đỗ Thị Mỹ Trinh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00008', 'PLAINTIFF', 1, 'Ngô Thanh Thúy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00009', 'PLAINTIFF', 1, 'Võ Văn Sang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00010', 'PLAINTIFF', 1, 'Nguyễn Thắng Thành', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00011', 'PLAINTIFF', 1, 'Tạ Gia Đức', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00012', 'PLAINTIFF', 1, 'Trần Văn Út Anh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00013', 'PLAINTIFF', 1, 'Đoàn Văn Phát', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00014', 'PLAINTIFF', 1, 'Lê Thị Hoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00015', 'PLAINTIFF', 1, 'Trần Chí Tâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00016', 'PLAINTIFF', 1, 'Nguyễn Hoàng Khải', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00017', 'PLAINTIFF', 1, 'Trần Thanh Sơn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00018', 'PLAINTIFF', 1, 'Võ Văn Út', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00019', 'PLAINTIFF', 1, 'Trần Thị Kim Cúc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00020', 'PLAINTIFF', 1, 'Phạm Duy Linh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00021', 'PLAINTIFF', 1, 'Nguyễn Thị Phương', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00022', 'PLAINTIFF', 1, 'Trần Xuân Tưởng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00023', 'PLAINTIFF', 1, 'Nguyễn Thị Huỳnh Giao', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00024', 'PLAINTIFF', 1, 'Trần Văn Tòng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00025', 'PLAINTIFF', 1, 'Nguyễn Thị Kim Loan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00026', 'PLAINTIFF', 1, 'Nguyễn Văn Vị', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00027', 'PLAINTIFF', 1, 'Ngân hàng Nông nghiệp và Phát triển nông thôn Việt Nam', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00028', 'PLAINTIFF', 1, 'Nguyễn Thị Thanh Tuyền', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00029', 'PLAINTIFF', 1, 'Đinh Văn Nhiễn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00030', 'PLAINTIFF', 1, 'Dương Văn Vĩ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00031', 'PLAINTIFF', 1, 'Nguyễn Thúy Vy', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00032', 'PLAINTIFF', 1, 'Lê Thị Tuyết Lan', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00033', 'PLAINTIFF', 1, 'Võ Văn Ngơi', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00034', 'PLAINTIFF', 1, 'Nguyễn Văn Mỹ', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00035', 'PLAINTIFF', 1, 'Dương Văn Ái', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00036', 'PLAINTIFF', 1, 'Phạm Văn Phấn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00037', 'PLAINTIFF', 1, 'Võ Phú Lộc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00038', 'PLAINTIFF', 1, 'Phan Thị Hoa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00038', 'PLAINTIFF', 2, 'Nguyễn Hoàng Tâm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00039', 'PLAINTIFF', 1, 'Trần Văn Hoàng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00040', 'PLAINTIFF', 1, 'Huỳnh Thanh Tiến', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00041', 'PLAINTIFF', 1, 'Lê Tuấn Anh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00042', 'PLAINTIFF', 1, 'Lê Tấn Lộc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00043', 'PLAINTIFF', 1, 'Huỳnh Thị Kim Duyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00044', 'PLAINTIFF', 1, 'Nguyễn Thị Thùy Trang', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00045', 'PLAINTIFF', 1, 'Võ Kim Đồng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00046', 'PLAINTIFF', 1, 'Nguyễn Thị Thao –', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00047', 'PLAINTIFF', 1, 'Phạm Ngọc Tường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00048', 'PLAINTIFF', 1, 'Huỳnh Thị Út', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00049', 'PLAINTIFF', 1, 'Lê Phú Quí', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00050', 'PLAINTIFF', 1, 'Ngân hàng Lộc Phát Việt Nam', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00051', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quốc Tế Việt Nam', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00052', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quốc Tế Việt Nam', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00053', 'PLAINTIFF', 1, 'Phạm Hữu Nghĩa', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00054', 'PLAINTIFF', 1, 'Cty Cp MBN Jupiter Và', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00054', 'PLAINTIFF', 2, 'Ngân Hàng VN Thịnh Vượng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00055', 'PLAINTIFF', 1, 'Nguyễn Đức Luân', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00056', 'PLAINTIFF', 1, 'Lê Văn Bé Ba', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00057', 'PLAINTIFF', 1, 'Ngân hàng TMCP Thịnh Vượng và Phát triển', NULL, 'Toà 4, 5, 6 Toà nhà Thành Công, Ô đất P-D17 Khu đô thị Cầu Giấy, phường Cầu Giấy, thành phố Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00058', 'PLAINTIFF', 1, 'Ngân hàng TMCP Thịnh Vượng và Phát triển', NULL, 'Toà 4, 5, 6 Toà nhà Thành Công, Ô đất P-D17 Khu đô thị Cầu Giấy, phường Cầu Giấy, thành phố Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00059', 'PLAINTIFF', 1, 'Ngô Phước Hiệp', 1966, 'Ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00059', 'PLAINTIFF', 2, 'Trương Thị Luyến', 1965, 'Ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00060', 'PLAINTIFF', 1, 'Nguyễn Văn Gon', 1970, 'Khóm Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00061', 'PLAINTIFF', 1, 'Nguyễn Văn Toàn', 1966, 'Khóm Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00062', 'PLAINTIFF', 1, 'Trần Võ An Hạ', 1984, 'xã Mỹ An Hưng B, huyện Lấp Vò, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00062', 'PLAINTIFF', 2, 'Nguyễn Văn Hoài Hận', 1988, 'xã Mỹ An Hưng B, huyện Lấp Vò, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00063', 'PLAINTIFF', 1, 'Trương Thị Kim Tươi', 1978, 'Ấp Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00064', 'PLAINTIFF', 1, 'Thái Minh Hùng', 1988, 'Ấp Long Mỹ, xã Mỹ Lệ, Tây Ninh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00065', 'PLAINTIFF', 1, 'Huỳnh Văn Huyền', 1970, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00066', 'PLAINTIFF', 1, 'Nguyễn Văn Mật', 1968, 'Ấp Bình Phú Long, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00067', 'PLAINTIFF', 1, 'Nguyễn Thị Bé Ba', 1982, 'Ấp 6, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00068', 'PLAINTIFF', 1, 'Nguyễn Thị Hoài', 1955, 'Ấp Bình Hoà, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00069', 'PLAINTIFF', 1, 'Võ Chí Thanh', 1969, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00069', 'PLAINTIFF', 2, 'Bùi Thị Hoàng', 1969, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00070', 'PLAINTIFF', 1, 'Dương Văn Quí', 1957, 'Ấp 2, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00071', 'PLAINTIFF', 1, 'Lê Văn Hồng', 1963, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00072', 'PLAINTIFF', 1, 'Lê Văn Lơ', 1958, 'Phường 11, Quận 6, thành phố Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00073', 'PLAINTIFF', 1, 'Hồ Văn Đôi', 1964, 'Ấp 4, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00074', 'PLAINTIFF', 1, 'Dương Hồng Lệ', 1961, 'Khóm Mỹ Thiện, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00075', 'PLAINTIFF', 1, 'Võ Thị Gẩm', 1949, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00076', 'PLAINTIFF', 1, 'Phan Văn Ghi', 1937, 'Ấp AB, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00077', 'PLAINTIFF', 1, 'Đặng Văn Nổi', 1962, 'Ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00078', 'PLAINTIFF', 1, 'Lê Văn Bòn', 1962, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00079', 'PLAINTIFF', 1, 'Trương Thị Huyền Duyên', 1969, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00080', 'PLAINTIFF', 1, 'Lê Thị Tiến', 1967, 'Ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00081', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00082', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00083', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00084', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00085', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00086', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00087', 'PLAINTIFF', 1, 'Nguyễn Thị Bích Thủy', 1968, 'Tổ 30, ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00088', 'PLAINTIFF', 1, 'Nguyễn Văn Thọ', NULL, 'Số nhà 233, ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00089', 'PLAINTIFF', 1, 'Nguyễn Văn Bé Bảy', 1970, 'Ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00090', 'PLAINTIFF', 1, 'Phan Bá Thông', 1958, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00091', 'PLAINTIFF', 1, 'Võ Văn Phước', 1965, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00092', 'PLAINTIFF', 1, 'Đỗ Thị Chối', 1966, 'Tổ 9, ấp 5, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00093', 'PLAINTIFF', 1, 'Phan Thị Thu Thủy', 1978, 'ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00093', 'PLAINTIFF', 2, 'Ngô Thị Thu Ngân', 2003, 'ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00093', 'PLAINTIFF', 3, 'Ngô Thanh Nhân', 2010, 'ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00094', 'PLAINTIFF', 1, 'Lương Văn Bảy', 1965, '126 Lê Văn Sô, Khu vực 2, phường Bình Thủy, tp Cần Thơ');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00095', 'PLAINTIFF', 1, 'Lê Văn Việt', 1964, 'ấp Bình Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00096', 'PLAINTIFF', 1, 'Trương Văn Chía', 1956, 'ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00096', 'PLAINTIFF', 2, 'Nguyễn Thị Phượng', 1963, 'ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00097', 'PLAINTIFF', 1, 'Lê Văn Đèo', 1968, 'ấp 3, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00098', 'PLAINTIFF', 1, 'Huỳnh Văn Minh', 1958, 'ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00099', 'PLAINTIFF', 1, 'Nguyễn Quang Nhân', 1983, 'Ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00100', 'PLAINTIFF', 1, 'Nguyễn Xuân Cửu Long', 1980, 'Khóm 4, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00101', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00102', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00103', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00104', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00105', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00106', 'PLAINTIFF', 1, 'Huỳnh Thị Tuyết Linh', 1972, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00107', 'PLAINTIFF', 1, 'Phan Tiến Dũng', 1961, 'Số 26/4 Quang Trung, phường Tây Thông Hội, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00108', 'PLAINTIFF', 1, 'Nguyễn Phước Thiện', 1978, 'Tổ 2, ấp 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00109', 'PLAINTIFF', 1, 'Công ty cổ phần Ewos Việt Nam', NULL, 'Cụm công nghiệp Long Định – Long Cang, xã Cần Đước, tỉnh Tây Ninh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00110', 'PLAINTIFF', 1, 'Dương Văn Mến', 1967, 'Ấp Mỹ Tây 3, xã Mỹ Quí, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00111', 'PLAINTIFF', 1, 'Trần Thị Hạnh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00112', 'PLAINTIFF', 1, 'Công ty TNHH Olam Globai Agri Việt Nam', NULL, 'Long An');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00113', 'PLAINTIFF', 1, 'Công ty TNHH Olam Globai Agri Việt Nam', NULL, 'Long An');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00114', 'PLAINTIFF', 1, 'Trương Thị Thủy', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00115', 'PLAINTIFF', 1, 'Phan Thị Vân', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00116', 'PLAINTIFF', 1, 'Nguyễn Văn Lý', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00117', 'PLAINTIFF', 1, 'Nguyễn Thanh Lộc', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00118', 'PLAINTIFF', 1, 'Phan Văn Phước', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00119', 'PLAINTIFF', 1, 'Đoàn Thị Kiều', NULL, 'Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00120', 'PLAINTIFF', 1, 'Nguyễn Văn Ngân', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00121', 'PLAINTIFF', 1, 'Bùi Hữu Soi - Chủ HKD Tâm Đức', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00122', 'PLAINTIFF', 1, 'Trần Văn Toàn', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00123', 'PLAINTIFF', 1, 'Nguyễn Hữu Thành', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00124', 'PLAINTIFF', 1, 'Nguyễn Thị Cẩm Hằng', NULL, 'Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00125', 'PLAINTIFF', 1, 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00126', 'PLAINTIFF', 1, 'Công ty cho thuê tài chính TNHH Quốc tế Chailease', NULL, 'Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00127', 'PLAINTIFF', 1, 'Ngân hàng TMCP Đầu tư và Phát triển', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00127', 'PLAINTIFF', 2, 'Việt Nam', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00128', 'PLAINTIFF', 1, 'Ngân hàng TMCP Nam Á', NULL, 'thành phố Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00129', 'PLAINTIFF', 1, 'Công ty TNHH Đầu tư kinh doanh HCD', NULL, 'Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00130', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quốc tế Việt Nam (VIB)', NULL, 'thành phố Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00131', 'PLAINTIFF', 1, 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV)', NULL, 'Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00132', 'PLAINTIFF', 1, 'Võ Văn Khoẻ', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00133', 'PLAINTIFF', 1, 'Nguyễn Thị Mới', 1975, 'ấp Mỹ Tây, xã Mỹ Thọ, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00134', 'PLAINTIFF', 1, 'Nguyễn Thị Mới', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00135', 'PLAINTIFF', 1, 'Nguyễn Nhật Trường', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00135', 'PLAINTIFF', 2, 'Võ Thị Thơm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00136', 'PLAINTIFF', 1, 'Võ Thị Hồng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00137', 'PLAINTIFF', 1, 'Trần Ngọc Bích', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00138', 'PLAINTIFF', 1, 'Nguyễn Minh Tùng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00139', 'PLAINTIFF', 1, 'Phạm Thanh Sơn', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00140', 'PLAINTIFF', 1, 'Phạm Thanh Sơn', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00141', 'PLAINTIFF', 1, 'Hồ Tuấn Bình', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00142', 'PLAINTIFF', 1, 'Nguyễn Thị Kim Chi', NULL, 'thành phố Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00143', 'PLAINTIFF', 1, 'Nguyễn Trường Sơn', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00144', 'PLAINTIFF', 1, 'Nguyễn Thị Đời', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00145', 'PLAINTIFF', 1, 'Công ty CP Sawad Tiền Có Ngay', NULL, 'Nghệ An');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00146', 'PLAINTIFF', 1, 'Công ty CP Sawad Tiền Có Ngay', NULL, 'Nghệ An');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00147', 'PLAINTIFF', 1, 'Công ty CP Sawad Tiền Có Ngay', NULL, 'Nghệ An');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00148', 'PLAINTIFF', 1, 'Nguyễn Văn Mắm', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00149', 'PLAINTIFF', 1, 'Nguyễn Thị Ngọc Thúy', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00150', 'PLAINTIFF', 1, 'Lương Thị Anh Đào', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00151', 'PLAINTIFF', 1, 'Nguyễn Văn Bảy', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00152', 'PLAINTIFF', 1, 'Nguyễn Văn Lợi', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00153', 'PLAINTIFF', 1, 'Lê Thị Lành', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00154', 'PLAINTIFF', 1, 'Ngân hàng TMCP Kiên Long', NULL, 'An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00155', 'PLAINTIFF', 1, 'Phan Mỹ Châu', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00156', 'PLAINTIFF', 1, 'Trần Thị Minh Kiều', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00157', 'PLAINTIFF', 1, 'Nguyễn Hữu Thanh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00158', 'PLAINTIFF', 1, 'Nguyễn Thị Lắm', NULL, 'Tiền Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00159', 'PLAINTIFF', 1, 'Trần Văn Sinh', NULL, 'Ấp Bình Mỹ A, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00160', 'PLAINTIFF', 1, 'Trịnh Văn Theo', NULL, 'Tổ 9, ấp An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00161', 'PLAINTIFF', 1, 'Nguyễn Thị Nguồn', NULL, 'Số 195 Trần Hưng Đạo, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00162', 'PLAINTIFF', 1, 'Phan Thị Ngọc Dung', NULL, 'Tổ 9B, ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00163', 'PLAINTIFF', 1, 'Nguyễn Thanh Tuyền', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00164', 'PLAINTIFF', 1, 'Phạm Thị Thuý Loan', NULL, 'Ấp 6 Kinh Hội, xã Trường Xuân, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00165', 'PLAINTIFF', 1, 'Bùi Thị Kim Huyên', NULL, 'Tổ 22, ấp Đông Bình, xã Hoà An, TPCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00166', 'PLAINTIFF', 1, 'Trần Quốc Cường', NULL, 'Số 75 Bến Đình 3, phường Vũng Tàu, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00167', 'PLAINTIFF', 1, 'Trần Thị Mười Hai', NULL, 'Số 1330 khóm 1, phường 11, TP CL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00168', 'PLAINTIFF', 1, 'Lê Văn Sơn', NULL, 'Tổ 7, khóm Thuận An, phường Cao Lãnh. ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00169', 'PLAINTIFF', 1, 'Công ty cổ phần MBN Jupiter', NULL, 'Số 219 Phố Trung Kính, phường Yên Hoà, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00169', 'PLAINTIFF', 2, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00170', 'PLAINTIFF', 1, 'Ngân hàng TMCP Phương Đông', NULL, 'Số 15 Trần Bạch Đằng, phường An Khánh, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00171', 'PLAINTIFF', 1, 'Ngân hàng TMCP Sài Gòn Thương Tín', NULL, '266- 268 Nam Kì Khởi Nghĩa, phường Xuân Hòa, Tp Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00172', 'PLAINTIFF', 1, 'Nguyễn Thị Liên', NULL, '22043 HAMBURG JENFELDER ALLEE (Nước Đức)');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00173', 'PLAINTIFF', 1, 'Trương Quang Thái', NULL, 'Ấp 2, xã Mỹ Long, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00174', 'PLAINTIFF', 1, 'Đinh Thị Phùng', NULL, 'Tổ 9, ấp Hoà Dân, xã Nhị Mỹ, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00175', 'PLAINTIFF', 1, 'Lê Hoàng Giang', NULL, 'Tổ 43, khóm Mỹ Tây, phường Mỹ Phú, TPCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00176', 'PLAINTIFF', 1, 'Châu Minh Thành', NULL, 'Khóm 9, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00177', 'PLAINTIFF', 1, 'Đỗ Văn Dũng', NULL, 'Tổ 9, ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00178', 'PLAINTIFF', 1, 'Phạm Văn Hiền', 1963, 'Ấp 2B, xã Bình Hàng');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00178', 'PLAINTIFF', 2, 'Bùi Thì Kiều Nương', 1967, 'Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00179', 'PLAINTIFF', 1, 'Võ Thị Mỹ Lệ', 1953, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00180', 'PLAINTIFF', 1, 'Lê Thị Chiên', 1967, 'Tổ 22, ấp Mỹ Thới, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00181', 'PLAINTIFF', 1, 'Trần Dũng Tiến', 1969, 'Tổ 15, ấp 1, xã Mỹ Long, HCL, ĐT( nay là xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00182', 'PLAINTIFF', 1, 'Nguyễn Hữu Nghĩa', 1987, 'Số 95/43 Lê Văn Lương, p Tân Hưng, quận 7, Tp HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00183', 'PLAINTIFF', 1, 'Lê Thị Thúy Hằng', 1982, 'Ấp An Thiện, xã Hội Cư, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00184', 'PLAINTIFF', 1, 'Ngân hàng TMCP Hàng Hải Việt Nam', NULL, '54A Nguyễn Chí Thanh, phường Láng Hạ, tp HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00185', 'PLAINTIFF', 1, 'Ngân hàng TMCP Kiên Long', NULL, '40 - 42-44 Phạm Hồng Thái, phường Rạch Giá, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00186', 'PLAINTIFF', 1, 'Ngân hàng TMCP Thịnh Vượng và Phát Triển', NULL, 'khu đô thị Cầu Giấy, phường Cầu Giấy, tp HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00187', 'PLAINTIFF', 1, 'Nguyễn Hữu Tâm', 1989, 'Ấp Hòa Ninh, xã Long Thắng, h.Lai Vung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00188', 'PLAINTIFF', 1, 'Nguyễn Thanh Hoàng', 1971, 'Tổ 2, ấp 2, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00189', 'PLAINTIFF', 1, 'Dương Thị Lụa', 1990, 'Tổ 2, ấp 7, xã Phương Thịnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00190', 'PLAINTIFF', 1, 'Hồ Thiện Hưng', 1981, 'Ấp 2, xã Gáo Giồng, HCL, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00191', 'PLAINTIFF', 1, 'Đoàn Văn Ảnh', 1978, 'ấp 3, xã Bình Thành, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00192', 'PLAINTIFF', 1, 'Nguyễn Vĩnh Trung', 1970, 'khóm 1, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00193', 'PLAINTIFF', 1, 'Ngân hàng TMCP Phương Đông (OCB)', NULL, '15 Trần Bạch Đằng, phường An Khánh, Tp HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00194', 'PLAINTIFF', 1, 'Ngân hàng TMCP Phương Đông (OCB)', NULL, '15 Trần Bạch Đằng, phường An Khánh, Tp HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00195', 'PLAINTIFF', 1, 'Nguyễn Văn Chiên', NULL, 'Khóm Bến Bắc, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00195', 'PLAINTIFF', 2, 'Nguyễn Thị Đẹp', NULL, 'Khóm Bến Bắc, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00196', 'PLAINTIFF', 1, 'Nguyễn Công Danh', NULL, 'Khóm Hoà Dân, phhường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00197', 'PLAINTIFF', 1, 'Bùi Tuấn Kiệt', NULL, 'Nguyễn Đình Chiểu, phường Bàn Cờ, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00198', 'PLAINTIFF', 1, 'Võ An Sang', NULL, 'Khóm An Hoà B, xã Ba Chúc, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00199', 'PLAINTIFF', 1, 'Nguyễn Hoài Hận Em', NULL, 'Ấp 10, xã Thanh Hưng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00200', 'PLAINTIFF', 1, 'Nguyễn Thị Vân', NULL, 'Ấp Mỹ Phú Cù Lao, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00201', 'PLAINTIFF', 1, 'Nguyễn Cảnh Lương', NULL, 'Khóm 3, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00202', 'PLAINTIFF', 1, 'Đoàn Thị Minh Châu', NULL, 'Ấp Mỹ Hưng Hoà, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00203', 'PLAINTIFF', 1, 'Lê Kim Dũng', NULL, 'Ấp Tân Đông B, xã Thanh Bình, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00204', 'PLAINTIFF', 1, 'Trần Tuấn Hân', NULL, 'Tổ 4, ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00204', 'PLAINTIFF', 2, 'Trần Tuấn Hạnh', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00205', 'PLAINTIFF', 1, 'Nguyễn Thị Quyên', NULL, 'Tổ 7, ấp 5P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00206', 'PLAINTIFF', 1, 'Vũ Thị Kim Nguyên', NULL, 'Ấp Đông Thành, xã Thạnh Đông, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00207', 'PLAINTIFF', 1, 'Nguyễn Thị Út', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00207', 'PLAINTIFF', 2, 'Nguyễn Minh Kỳ', NULL, 'Khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00208', 'PLAINTIFF', 1, 'Võ Văn Bân', NULL, 'Ấp 6T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00209', 'PLAINTIFF', 1, 'Nguyễn Thị Huế Trân', NULL, 'Ấp 7, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00210', 'PLAINTIFF', 1, 'Lê Thành Tài', NULL, 'Khóm Tân Bình, phường Sa Đéc, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00211', 'PLAINTIFF', 1, 'Đinh Thành Đở', 1978, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00211', 'PLAINTIFF', 2, 'Trần Văn Lập', 1962, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00211', 'PLAINTIFF', 3, 'Trần Kim Hết', 1972, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00211', 'PLAINTIFF', 4, 'Nguyễn Trọng Tùng', 1964, 'Ấp Mỹ Xương, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00212', 'PLAINTIFF', 1, 'Ngân hàng Nông nghiệp và Phát triển nông thôn Việt Nam', NULL, 'Số 2 Láng Hạ , phường Giảng Võ, Tp Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00213', 'PLAINTIFF', 1, 'Ngân hàng Nông nghiệp và Phát triển nông thôn Việt Nam', NULL, 'Số 2 Láng Hạ , phường Giảng Võ, Tp Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00214', 'PLAINTIFF', 1, 'Ngân hàng Nông nghiệp và Phát triển nông thôn Việt Nam', NULL, 'Số 2 Láng Hạ , phường Giảng Võ, Tp Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00215', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường - Chủ hộ kinh doanh Hoàng Quyên', NULL, 'Khóm 4, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00216', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường - Chủ hộ kinh doanh Hoàng Quyên', NULL, 'Khóm 4, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00217', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường - Chủ hộ kinh doanh Hoàng Quyên', NULL, 'Khóm 4, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00218', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường - Chủ hộ kinh doanh Hoàng Quyên', NULL, 'Khóm 4, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00219', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường - Chủ hộ kinh doanh Hoàng Quyên', NULL, 'Khóm 4, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00220', 'PLAINTIFF', 1, 'Trần Thị Ni', NULL, 'Tổ 11, ấp 2, xã Phong Mỹ, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00221', 'PLAINTIFF', 1, 'Trần Thị Tình', NULL, 'Khóm 3, phường Mỹ Trà, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00222', 'PLAINTIFF', 1, 'Ngân hàng CP Lộc Phát Việt Nam', NULL, 'Trần Quang Khải, phường Hoàn Kiếm, TP HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00223', 'PLAINTIFF', 1, 'Ngân hàng CP Lộc Phát Việt Nam', NULL, 'Trần Quang Khải, phường Hoàn Kiếm, TP HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00224', 'PLAINTIFF', 1, 'Nguyễn Văn Khanh', NULL, 'Ấp 5B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00225', 'PLAINTIFF', 1, 'Nguyễn Văn Khanh', NULL, 'Ấp 5B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00226', 'PLAINTIFF', 1, 'Thái Văn Trang', NULL, 'Ấp 5, xã Phương Trà, HCL cũ nay là xã Ba Sao,xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00227', 'PLAINTIFF', 1, 'Bùi Văn Thành', NULL, 'Ấp 2, xã Mỹ Quí, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00228', 'PLAINTIFF', 1, 'Nguyễn Thị Kin Yến', NULL, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00229', 'PLAINTIFF', 1, 'Nguyễn Thị Cẩm Tú', NULL, 'Ấp 2, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00230', 'PLAINTIFF', 1, 'Nguyễn Văn Ngọt', NULL, 'Ấp AB, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00231', 'PLAINTIFF', 1, 'Nguyễn Hoàng Hải', NULL, 'Ấp Tân Trong, xã Mỹ An Hưng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00232', 'PLAINTIFF', 1, 'Lê Thị Huỳnh Trang', NULL, 'Ấp Bình Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00233', 'PLAINTIFF', 1, 'Lê Thị Huỳnh Trang', NULL, 'Ấp Bình Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00234', 'PLAINTIFF', 1, 'Trần Thị Bé Tư', NULL, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00235', 'PLAINTIFF', 1, 'Phạm Minh Cường', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00236', 'PLAINTIFF', 1, 'Trần Thị Thu Tuyến', NULL, 'Khóm Thuận Phú, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00237', 'PLAINTIFF', 1, 'Nguyễn Thị Hương', NULL, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00238', 'PLAINTIFF', 1, 'Phan Văn Huy', NULL, 'Ấp Tân An Chợ, xã Tân An, Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00239', 'PLAINTIFF', 1, 'Trần Thị Thúy', NULL, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00239', 'PLAINTIFF', 2, 'Nguyễn Văn Đường', NULL, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00240', 'PLAINTIFF', 1, 'Lê Thị Vàng', NULL, 'Ấp Mỹ An 2, xã Tháp Mười, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00241', 'PLAINTIFF', 1, 'Nguyễn Văn Chuyền', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00242', 'PLAINTIFF', 1, 'Phạm Thanh Vũ', NULL, 'Khóm Mỹ Hưng, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00243', 'PLAINTIFF', 1, 'Lê Văn Tô', NULL, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00244', 'PLAINTIFF', 1, 'Mai Thị Thắm', NULL, 'Ấp Bình Hưng, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00245', 'PLAINTIFF', 1, 'Ngân hàng TMCP Lộc Phát', NULL, 'Trần Quang Khải, phường Hoàn Kiếm, Tp HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00245', 'PLAINTIFF', 2, 'Việt Nam', NULL, 'Trần Quang Khải, phường Hoàn Kiếm, Tp HN');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00246', 'PLAINTIFF', 1, 'Hồ Thị Thúy', NULL, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00247', 'PLAINTIFF', 1, 'Châu Văn Dũng', NULL, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00247', 'PLAINTIFF', 2, 'Châu Kim Loan', NULL, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00248', 'PLAINTIFF', 1, 'Bùi Thị Thảo', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00249', 'PLAINTIFF', 1, 'Phạm Thanh Rồng', NULL, 'Ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00250', 'PLAINTIFF', 1, 'Trương Văn Nhàn', NULL, 'Khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00251', 'PLAINTIFF', 1, 'Nguyễn Thị Tiến', NULL, 'Ấp Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00252', 'PLAINTIFF', 1, 'Nguyễn Thị Thu Hương', NULL, 'Khóm 4, phường Hồng Ngự, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00253', 'PLAINTIFF', 1, 'Nguyễn Anh Dũng', NULL, 'Khóm Tịnh Hưng, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00254', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00254', 'PLAINTIFF', 2, 'Chủ hộ kinh doanh Hoàng Quyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00255', 'PLAINTIFF', 1, 'Đỗ Thị Mộng Thường', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00255', 'PLAINTIFF', 2, 'Chủ hộ kinh doanh Hoàng Quyên', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00256', 'PLAINTIFF', 1, 'Đoàn Thị Mỹ Trinh', NULL, 'Tổ 27, khóm Mỹ Thuận, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00257', 'PLAINTIFF', 1, 'Phạm Văn Sen', NULL, 'Khóm Hòa Dân, phường Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00257', 'PLAINTIFF', 2, 'Đàm Đức Minh', NULL, 'Khóm Hòa Dân, phường Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00257', 'PLAINTIFF', 3, 'Đàm Đức Hồng', NULL, 'Khóm Hòa Dân, phường Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00257', 'PLAINTIFF', 4, 'Phạm Thị Hoa', NULL, 'Khóm Hòa Dân, phường Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00258', 'PLAINTIFF', 1, 'Huỳnh Ngọc Hải', NULL, 'Ấp Tân Lập, xã Tân Thành, huyện Bình Tân, Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00259', 'PLAINTIFF', 1, 'Lê Minh Hùng', NULL, 'Tổ 8, ấp 3, xã Mỹ Trà, TP Cao Lãnh cũ nay là phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00260', 'PLAINTIFF', 1, 'Huỳnh Trí Thông', NULL, 'Ấp 4, xã Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00260', 'PLAINTIFF', 2, 'Nguyễn Thị Kiều', NULL, 'Ấp 4, xã Phương Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00261', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00262', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00263', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00264', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00265', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00266', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00267', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00268', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00269', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00270', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00271', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00272', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00273', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00274', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00275', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00276', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00277', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00277', 'PLAINTIFF', 2, 'Công ty cổ phần MBN JUPITER', NULL, 'Số 219, Trung Kính, phường Yên Hoà, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00278', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00279', 'PLAINTIFF', 1, 'Ngân hàng TMCP Kiên Long', NULL, 'Số 40-42-44 Phạm Hồng Thái, phường Vĩnh Thanh Vân, phường Rạch Giá, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00280', 'PLAINTIFF', 1, 'Nguyễn Thị Hiền', NULL, 'Tổ 10, ấp 4P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00280', 'PLAINTIFF', 2, 'Nguyễn Ngọc Hải', NULL, 'Tổ 10, ấp 4P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00280', 'PLAINTIFF', 3, 'Nguyễn Văn Hải', NULL, 'Tổ 54 Khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00280', 'PLAINTIFF', 4, 'Nguyễn Ngọc Trinh', NULL, 'Tổ 54 Khóm Mỹ Thuận, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00281', 'PLAINTIFF', 1, 'Nguyễn Thị Nhự', NULL, 'Khóm Mỹ Thượng, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00282', 'PLAINTIFF', 1, 'Võ Văn Hải', NULL, 'Ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00283', 'PLAINTIFF', 1, 'Phạm Minh Tuấn', NULL, 'Tổ 4, ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00284', 'PLAINTIFF', 1, 'Nguyễn Thị Mộng Tiền', NULL, 'Ấp Nam, xã Thanh Bình, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'PLAINTIFF', 1, 'Lê Hướng Dương', NULL, 'Số 111/28/65 đường Phạm Văn Chiêu, phường An Hội Tây, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'PLAINTIFF', 2, 'Lê Xuân Tin', NULL, 'Số 111/28/65 đường Phạm Văn Chiêu, phường An Hội Tây, TP HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00285', 'PLAINTIFF', 3, 'Lê Phú Thanh', NULL, 'Ấp Trung, xã Tân Thạnh, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00286', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00287', 'PLAINTIFF', 1, 'Ngân hàng TMCP Quốc tế Việt Nam (VIB);', NULL, '111A Pasteur, phường Sài Gòn, thành phố Hồ Chí Minh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00288', 'PLAINTIFF', 1, 'Ngân hàng TMCP Lộc Phát Việt Nam', NULL, 'Số 210 đường Trần Quang Khải, phường Hoàn Kiếm, thành phố Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00289', 'PLAINTIFF', 1, 'Ngân hàng TMCP Lộc Phát Việt Nam', NULL, 'Số 210 đường Trần Quang Khải, phường Hoàn Kiếm, thành phố Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00290', 'PLAINTIFF', 1, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', NULL, 'Số 89 Láng Hạ, phường Đống Đa, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025DS00291', 'PLAINTIFF', 1, 'Mai Thị Thanh Thủy', NULL, '02B5 Mạc Đĩnh Chi, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00001', 'PLAINTIFF', 1, 'Trần Thị Hồng Nhung', NULL, 'Số 4, Phan Thị Thoại, khóm Mỹ Hưng phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00002', 'PLAINTIFF', 1, 'Nguyễn Thanh Dân', NULL, 'Tổ 16, khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00003', 'PLAINTIFF', 1, 'Nguyễn Văn On', NULL, 'Ấp Long Châu, xã Long Khánh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00004', 'PLAINTIFF', 1, 'Lê Văn Tấn', NULL, 'Số 350, tổ 14, khóm Nguyễn Cử, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00005', 'PLAINTIFF', 1, 'Đăng Thanh Tâm', NULL, 'Ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00005', 'PLAINTIFF', 2, 'Pham Thị Huỳnh Ngân', NULL, 'Ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00006', 'PLAINTIFF', 1, 'Ngân hàng TMCP Kiên Long', NULL, 'Số 40-42-44 Phạm Hồng Thái, phường Vĩnh Thanh Vân, phường Rạch Giá, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00007', 'PLAINTIFF', 1, 'Ngân hàng TMCP Kiên Long', NULL, 'Số 40-42-44 Phạm Hồng Thái, phường Vĩnh Thanh Vân, phường Rạch Giá, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00008', 'PLAINTIFF', 1, 'Ngân hàng TMCP Hàng Hải Việt Nam', NULL, '54A Nguyễn Chí Thanh, phường Láng, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00009', 'PLAINTIFF', 1, 'Ngân hàng TMCP Hàng Hải Việt Nam', NULL, '54A Nguyễn Chí Thanh, phường Láng, TP Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00010', 'PLAINTIFF', 1, 'Võ Thị Thư Tư', NULL, 'Tổ 33, Khóm Mỹ Trung, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026DS00011', 'PLAINTIFF', 1, 'Thái Viết Trường Sơn', NULL, 'Số 3, Tôn Đức Thắng, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00001', 'PLAINTIFF', 1, 'Trần Văn Hồng', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HC00002', 'PLAINTIFF', 1, 'Trần Văn Hồng', NULL, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00001', 'PLAINTIFF', 1, 'Trần Thị Mỷ Dung', 1976, 'Tổ 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00002', 'PLAINTIFF', 1, 'Trương Ngọc Nguyễn', 1990, 'Ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00003', 'PLAINTIFF', 1, 'Trần Văn Thành', 1971, 'Khóm Hòa Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00004', 'PLAINTIFF', 1, 'Phan Thành Tài', 1994, 'Khóm Nghiệp, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00005', 'PLAINTIFF', 1, 'Phạm Phương Thảo', 1991, 'Tổ 10, ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00006', 'PLAINTIFF', 1, 'Võ Thị Kiều My', 2003, 'Khóm 10, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00007', 'PLAINTIFF', 1, 'Thạch Thị Hoa', 1979, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00008', 'PLAINTIFF', 1, 'Nguyễn Văn Bé Tám', 1970, 'Tổ 13, ấp Tịch Châu, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00009', 'PLAINTIFF', 1, 'Nguyễn Văn Tùng', 1977, 'Khóm  Bình Nhứt, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00010', 'PLAINTIFF', 1, 'Nguyễn Võ Kim Ngân', 2003, 'khóm 14, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00011', 'PLAINTIFF', 1, 'Phạm Thị Mỹ Dung', 1984, 'Tổ 17, ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00012', 'PLAINTIFF', 1, 'Nguyễn Thị Kim Bằng', 1989, 'Tổ 3, ấp 1, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00013', 'PLAINTIFF', 1, 'Nguyễn Văn Mỹ', 1990, 'Ấp 1, xã Phương Thịnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00014', 'PLAINTIFF', 1, 'Trương Thị Thúy Nga', 1995, 'Tổ 34, ấp Bình Linh, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00015', 'PLAINTIFF', 1, 'Lê Thị Thanh Thúy', 1986, 'Ấp Mỹ Thạnh, xã Thanh Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00016', 'PLAINTIFF', 1, 'Lê Thị Mỹ Hân', 2001, 'Ấp 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00017', 'PLAINTIFF', 1, 'Đặng Thị Kim Quỳnh', 2004, 'Tổ 7, khóm An Nghiệp, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00018', 'PLAINTIFF', 1, 'Hồ Thị Huỳnh', 2002, 'ấp Mỹ Phú Đất Liền, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00019', 'PLAINTIFF', 1, 'Ngô Thu Thảo', 1999, 'Tổ 21, ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00020', 'PLAINTIFF', 1, 'Dương Thị Hồng Nho', 2000, '208 Huỳnh Tấn Phát, phường Rạch Giá, An Giang.');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00021', 'PLAINTIFF', 1, 'Trần Thị Hoàng Dung', 1991, 'Ấp Mỹ Hưng Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00022', 'PLAINTIFF', 1, 'Nguyễn Thị Tiền', 1999, 'Tổ 7, ấp 2, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00023', 'PLAINTIFF', 1, 'Võ Minh Tảo', 1999, 'Tổ 2, khóm 3, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00024', 'PLAINTIFF', 1, 'Phan Thành Mai', 1977, 'ấp Bình Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00025', 'PLAINTIFF', 1, 'Huỳnh Thị Cẩm Tiên', 1999, 'Tổ 34, khóm 4, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00026', 'PLAINTIFF', 1, 'Huỳnh Thị Hương Thúy', 1984, 'Tổ 8, khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00027', 'PLAINTIFF', 1, 'Nguyễn Văn Hiếu', 1985, 'Ấp An Tài, xã An Phước, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00028', 'PLAINTIFF', 1, 'Tống Thị Cẩm Chúc', 1992, 'Ấp 6, phường Thường Lạc, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00029', 'PLAINTIFF', 1, 'Danh Thị Thanh Liên', 1996, 'Tổ 3, ấp Hòn me, xã Hòn Đất, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00030', 'PLAINTIFF', 1, 'Nguyễn Thị Bích Huyền', 1996, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00031', 'PLAINTIFF', 1, 'Dương Văn Tài', 1986, 'Ấp 3, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00032', 'PLAINTIFF', 1, 'Nguyễn Thị Nga', 1982, 'ấp Khánh Nhơn, xã Tân Khánh Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00033', 'PLAINTIFF', 1, 'Nguyễn Thị Nga', 1977, 'Khóm Nguyễn Cử, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00034', 'PLAINTIFF', 1, 'Phan Văn Tuấn', 1973, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00035', 'PLAINTIFF', 1, 'Huỳnh Thị Tiểu An', 1997, 'ấp Thanh Lợi, xã Đông Hòa, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00036', 'PLAINTIFF', 1, 'Trương Thị Lan', 1983, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00037', 'PLAINTIFF', 1, 'Lê Thị Ly', 1993, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00038', 'PLAINTIFF', 1, 'Võ Thị Ngọc Dung', 1990, 'Tổ 3, ấp 3, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00039', 'PLAINTIFF', 1, 'Nguyễn Văn Tựu', 1981, 'Ấp 5, xã Nhơn Ninh, Tây Ninh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00040', 'PLAINTIFF', 1, 'Huỳnh Thị Hồng Cẩm', 1991, 'khu phố 3, phường Phú Yên, Đăk Lăk');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00041', 'PLAINTIFF', 1, 'Trần Thị Đừng', 1984, 'khóm 14, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00042', 'PLAINTIFF', 1, 'Đoàn Thị Cẩm Tiên', 1994, 'khóm 12, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00043', 'PLAINTIFF', 1, 'Võ Tấn Phát', 2000, 'Ấp 3, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00044', 'PLAINTIFF', 1, 'Lê Thị Ly', 1977, 'Ấp 6 Kinh Hội, xã Trường Xuân, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00045', 'PLAINTIFF', 1, 'Đào Thị Thu Hoài', 1994, 'Tổ 5, ấp Bình Tân, Xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00046', 'PLAINTIFF', 1, 'Đặng Thị Ngân', 1990, 'Ấp 4, xã Gáo Giồng, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00047', 'PLAINTIFF', 1, 'Phạm Phước Vũ', 1994, 'Tổ 7, ấp 1, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00048', 'PLAINTIFF', 1, 'Trần Thị Bé Đèo', 1991, 'Ấp Mỹ Đông Ba, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00049', 'PLAINTIFF', 1, 'Nguyễn Thị Nhung', 1993, 'Ấp 6, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00050', 'PLAINTIFF', 1, 'Tống Thị Thanh Thúy', 1980, 'ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00051', 'PLAINTIFF', 1, 'Nguyễn Thị Khánh Vi', 1991, 'Khóm Hòa Khánh, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00052', 'PLAINTIFF', 1, 'Dương Thu Ba', 1977, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00053', 'PLAINTIFF', 1, 'Lê Thị Diệu', 1976, 'Ấp 7, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00054', 'PLAINTIFF', 1, 'Trần Văn Nhờ', 1991, 'Ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00055', 'PLAINTIFF', 1, 'Võ Thị Hiền', 1996, 'Khóm Bình Nhứt, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00056', 'PLAINTIFF', 1, 'Trần Tuấn Đông', 1986, 'khu phố 13, phường Tăng Nhơn Phú, Tp HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00057', 'PLAINTIFF', 1, 'Châu Anh Phương', 1997, 'Tân Hùng, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00058', 'PLAINTIFF', 1, 'Nguyễn Thị Đầm', 1999, 'ấp 3, xã Bình Thành, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00059', 'PLAINTIFF', 1, 'Nguyễn Công Minh', 1979, 'Ấp Mỹ Đông Bốn, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00060', 'PLAINTIFF', 1, 'Lê Thị Thùy Trang', 1988, 'ấp Tân Trường, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00061', 'PLAINTIFF', 1, 'Phạm Hồng Dân', 1994, 'Ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00062', 'PLAINTIFF', 1, 'Phạm Hoàng Bảo', 1976, 'khu phố 26, phường Khánh Hội, Tp HCM');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00063', 'PLAINTIFF', 1, 'Trần Thị Bích Tiền', 2005, 'khóm 4, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00064', 'PLAINTIFF', 1, 'Trương Thị Kiều Ngân', 1996, 'ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00065', 'PLAINTIFF', 1, 'Sơn Thị Thanh Thủy', 1978, 'ấp Mỹ Long 2, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00066', 'PLAINTIFF', 1, 'Lê Thị Đúng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00067', 'PLAINTIFF', 1, 'Ngô Thị Hồng Ngọc', NULL, 'Khánh Hòa');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00068', 'PLAINTIFF', 1, 'Trương Thị Thiệt', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00069', 'PLAINTIFF', 1, 'Phạm Thị Chúc Mai', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00070', 'PLAINTIFF', 1, 'Lê Văn Thành', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00071', 'PLAINTIFF', 1, 'Nguyễn Thị Ngọc Nhi', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00072', 'PLAINTIFF', 1, 'Nguyễn Thị Bích Phượng', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00073', 'PLAINTIFF', 1, 'Huỳnh Văn Bé Tám', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00074', 'PLAINTIFF', 1, 'Chung Thị Thoại Hoa', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00075', 'PLAINTIFF', 1, 'Trần Thị Kim Anh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00076', 'PLAINTIFF', 1, 'Nguyễn Cẩm Băng Trinh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00077', 'PLAINTIFF', 1, 'Trần Trí Linh', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00078', 'PLAINTIFF', 1, 'Đinh Thị Kim Thoa', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00079', 'PLAINTIFF', 1, 'Phạm Thị Mộng Dung', NULL, 'Ấp Mỹ Hưng Hòa, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00080', 'PLAINTIFF', 1, 'Phan Thị Vui', 1957, 'Khóm An Định, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00081', 'PLAINTIFF', 1, 'Đinh Thị Xạ', 1963, 'Tổ 17, ấp 2, xã Mỹ Long, huyện Cao Lãnh, ĐT( nay là xã Mỹ Hiệp, ĐT)');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00082', 'PLAINTIFF', 1, 'Lê Thị Lệ', 1985, 'Ấp 2, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00082', 'PLAINTIFF', 2, 'Trần Văn Lạc', 1983, 'Ấp 2, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00083', 'PLAINTIFF', 1, 'Tạ Thị Ánh Tuyết', 1987, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00084', 'PLAINTIFF', 1, 'Bùi Thị Búp', 1977, 'Tổ 22, ấp Đông, xã Mỹ Hiệp, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00085', 'PLAINTIFF', 1, 'Trần Xuân Thảo', 2003, 'xã Bình Đức 6, phường Bình Đức, An Giang');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00086', 'PLAINTIFF', 1, 'Hà Thị Huệ', 1990, 'Tổ 16, ấp 3, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00087', 'PLAINTIFF', 1, 'Phan Thị Mĩ Em', 1990, 'Tổ 3, ấp Bình Mỹ B, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00088', 'PLAINTIFF', 1, 'Bùi Thanh Hải', 1976, 'Ấp 3, xã Mỹ Long,HCL, ĐT nay là xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00089', 'PLAINTIFF', 1, 'Đào Hồng Diễm', 1992, 'Ấp Bờ Cảng, xã Long Điền, Cà Mau');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00090', 'PLAINTIFF', 1, 'Cheng Tien Fu', NULL, 'Ấp Tân Lợi, xã Tràm Chim, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00091', 'PLAINTIFF', 1, 'Võ Thị Thanh Hương', NULL, 'Ấp Bình Hòa, xã Mỹ Hiệp,ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00092', 'PLAINTIFF', 1, 'Quách Quý Liên', NULL, 'Ấp Mỹ Phú Cù Lao, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00093', 'PLAINTIFF', 1, 'Võ Minh Do', NULL, 'Ấp 3, xã Phong Mỹ, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00094', 'PLAINTIFF', 1, 'Phạm Thị Chi', 1982, 'Tổ 10, khóm 7, phường Mỹ Ngãi, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00095', 'PLAINTIFF', 1, 'Võ Thị Ngọc Dung', 1994, 'Ấp Mỹ Tây, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00096', 'PLAINTIFF', 1, 'Dương Thị Kim Thoa', 1991, 'Khóm Thanh Tiến, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00097', 'PLAINTIFF', 1, 'Nguyễn Thị Trinh', NULL, 'Ấp Phú Hưng 2, xã Bình Phú, tỉnh Vỉnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00098', 'PLAINTIFF', 1, 'Đào Thị Thắm', NULL, 'Ấp Mỹ Đông Nhất, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00099', 'PLAINTIFF', 1, 'Nguyễn Bảo Long', NULL, 'Ấp Rọc Chanh A, xã Tân Hưng, tỉnh Tây Ninh');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00100', 'PLAINTIFF', 1, 'Nguyễn Thị Bé Hai', NULL, 'khóm Bình Dân, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00101', 'PLAINTIFF', 1, 'Đặng Thị Thúy Em', NULL, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00102', 'PLAINTIFF', 1, 'Thái Trần Kim Cương', NULL, 'Ấp 2B, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00103', 'PLAINTIFF', 1, 'Nguyễn Kim Chi', NULL, 'Khóm 3, phường Hồng Ngự, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00104', 'PLAINTIFF', 1, 'Phan Minh Hoàng', NULL, 'Tổ 56, phường Cẩm Lệ, tp Đà Nẵng');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00105', 'PLAINTIFF', 1, 'Trần Xuân Huy', NULL, 'Thôn 2, xã Nam Thành, tỉnh Lâm Đồng');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00105', 'PLAINTIFF', 2, 'Trần Hà Lệ Hằng', NULL, '6P, xã Ba Sao, tỉnh Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00106', 'PLAINTIFF', 1, 'Võ Phú Anh', NULL, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00106', 'PLAINTIFF', 2, 'Đỗ Thị Bảo Ngọc', NULL, 'Khóm Tịnh Long, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00107', 'PLAINTIFF', 1, 'Nguyễn Tuấn Thanh', NULL, 'Ấp 4, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00107', 'PLAINTIFF', 2, 'Phạm Thị Mỹ Linh', NULL, 'Ấp 2, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00108', 'PLAINTIFF', 1, 'Trịnh Trung Hiếu', NULL, 'Ấp Phú Hòa, xã Tiên Thủy, tỉnh Vĩnh Long');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00108', 'PLAINTIFF', 2, 'Nguyễn Thị Ngọc Diệu', NULL, 'Ấp Mỹ Đông Nhì, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00109', 'PLAINTIFF', 1, 'Nguyễn Tấn Lộc', NULL, 'Ấp 4P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00110', 'PLAINTIFF', 1, 'Đinh Đin', NULL, 'Láng Quái, xã Bờ Ngoong, tỉnh Gia Lai');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00110', 'PLAINTIFF', 2, 'Võ Minh Nhật', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00111', 'PLAINTIFF', 1, 'Võ Thị Diệu Hiền', NULL, 'Ấp Mỹ Long 4, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00112', 'PLAINTIFF', 1, 'Võ Văn Thanh', NULL, 'Ấp 1T, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00112', 'PLAINTIFF', 2, 'Nguyễn Thị Kim Ngọc', NULL, 'Ấp Bình Hòa, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00113', 'PLAINTIFF', 1, 'Huỳnh Thị Nga', NULL, 'Ấp 4P, xã Ba Sao, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00114', 'PLAINTIFF', 1, 'Bùi Thị Bé Nhi', NULL, 'Ấp 1, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00115', 'PLAINTIFF', 1, 'Trần Minh Quang', NULL, 'Tổ 17, khóm 1, phường Mỹ Trà, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00115', 'PLAINTIFF', 2, 'Thị Sra', NULL, 'Bon Sê Rê 2, xã Quảng Tín, Đắk Nông');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00116', 'PLAINTIFF', 1, 'Lại Hoàng Dung', NULL, 'Ấp Khánh An, xã Tân Khánh Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00117', 'PLAINTIFF', 1, 'Dương Thị Thu Thảo', NULL, 'Ấp Mương Khai, xã Mỹ  Hương, TP Cần Thơ');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00118', 'PLAINTIFF', 1, 'Nguyễn Thị Thúy Vân', NULL, 'Ấp 4, xã Phú Cường, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00119', 'PLAINTIFF', 1, 'Hồ Thị Nhanh', NULL, 'Ấp Bình Tân, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00120', 'PLAINTIFF', 1, 'Ngô Thanh Bình', NULL, 'Tố 8, ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00121', 'PLAINTIFF', 1, 'Trần Thanh Mộng', NULL, 'Tổ 13, Khóm Tịch Châu, phường Cao Lãnh, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00122', 'PLAINTIFF', 1, 'Hồ Xuân Đức', NULL, 'Ấp 1, xã Mỹ Hiệp, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00123', 'PLAINTIFF', 1, 'Võ Thị Thu Thảo', NULL, 'Ấp 10, xã Phong Mỹ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00124', 'PLAINTIFF', 1, 'Nguyễn Thị Bích Giang', NULL, 'Tổ 6, ấp 3, xã Bình Hàng Trung, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HN00125', 'PLAINTIFF', 1, 'Lê Thị Mỹ Xuyên', NULL, 'Ấp Trà Teo, phường Khánh Hòa TP Cần Thơ');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2026HN00001', 'PLAINTIFF', 1, 'Lê Thị Thùy Dung', NULL, 'Ấp Mỹ Phú Cù Lao, xã Mỹ Thọ, ĐT');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00001', 'ACCUSED', 1, 'Nguyễn Minh Trung cùng đồng bọn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00002', 'ACCUSED', 1, 'Đỗ Cao Trí cùng dồng bọn', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00003', 'ACCUSED', 1, 'Đỗ Minh Thái', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00004', 'ACCUSED', 1, 'Lê Văn Ni', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00005', 'ACCUSED', 1, 'Huỳnh Thái Hào và 13 Đồng phạm', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025HS00006', 'ACCUSED', 1, 'Lâm Tuấn Ngọc', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00001', 'PLAINTIFF', 1, 'Công ty TNHH xây dựng Diên Hồng', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00002', 'PLAINTIFF', 1, 'Lê Việt Vinh', NULL, NULL);
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00003', 'PLAINTIFF', 1, 'Ngân hàng TMCP Công Thương Việt Nam', NULL, 'Số 108 Trần Hưng Đạo, quận Hoàn Kiếm, thành phố Hà Nội');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00004', 'PLAINTIFF', 1, 'Công ty TNHH MTV Tuấn Khải 2', NULL, 'Đồng Tháp');
INSERT INTO legal_case_litigants(legal_case_id, litigant_type, ordinal, name, year_of_birth, address) VALUES ('2025KT00005', 'PLAINTIFF', 1, 'Ngân hàng TMCP Công Thương Việt Nam', NULL, 'Hà Nội');


