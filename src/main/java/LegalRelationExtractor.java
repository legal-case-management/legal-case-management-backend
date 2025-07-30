import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class LegalRelationExtractor {

    public static void main(String[] args) {
        String html = "<select name=\"ctl00$dvSpliter$ContentPlaceHolder1$ddlQHPLTK\" id=\"dvSpliter_ContentPlaceHolder1_ddlQHPLTK\" class=\"chosen-select\" style=\"width:250px;\">\n" +
                "\t\t\t\t\t<option value=\"0\">--Chọn QHPL dùng thống kê--</option>\n" +
                "\t\t\t\t\t<option value=\"1008\">1. QĐ xử phạt vi phạm hành chính</option>\n" +
                "\t\t\t\t\t<option value=\"1009\">2. QĐ áp dụng các biện pháp ngăn chặn và bảo đảm việc xử lý vi phạm hành chính</option>\n" +
                "\t\t\t\t\t<option value=\"1010\">3. QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp cưỡng chế thi hành quyết định xừ phạt vi phạm hành chính</option>\n" +
                "\t\t\t\t\t<option value=\"1021\">4. QĐ hành chính, hành vi hành chính trong việc áp dụng hoặc thi hành biện pháp xử lý hành chính bằng một trong các hình thức giáo dục tại xã, phường, thị trấn; đưa vào trường giáo dưỡng; đưa vào cơ sở giáo dục; đưa vào cơ sở chữa bệnh; quản chế hành chính</option>\n" +
                "\t\t\t\t\t<option value=\"1022\">5. QĐ hành chính, hành vi hành chính trong việc áp dụng biện pháp buộc tháo dỡ nhà ở, công trình, vật kiến trúc kiên cố khác</option>\n" +
                "\t\t\t\t\t<option value=\"1024\">6. QĐ hành chính, hành vi hành chính trong việc cấp, thu hồi giấy phép về xây dựng cơ bản, sản xuất, kinh doanh; giấy chứng nhận đăng ký kinh doanh và chứng chỉ hành nghề hoặc khiếu kiện QĐ hành chính, hành vi hành chính khác liên quan đến hoạt động kinh doanh, tài chính của thương nhân</option>\n" +
                "\t\t\t\t\t<option value=\"1025\">7. QĐ hành chính, hành vi hành chính liên quan đến thương mại hàng hoá quốc tế hoặc trong nước</option>\n" +
                "\t\t\t\t\t<option value=\"1026\">8. QĐ hành chính, hành vi hành chính liên quan đến chuyển giao tài chính trong nước và quôc tế, dịch vụ và cung ứng dịch vụ</option>\n" +
                "\t\t\t\t\t<option value=\"1027\">9. QĐ hành chính, hành vi hành chính trong việc trưng dụng, trưng mua, tịch thu tài sản</option>\n" +
                "\t\t\t\t\t<option value=\"1028\">10. QĐ hành chính, hành vi hành chính trong việc áp dụng thuế, thu thuế, truy thu thuế</option>\n" +
                "\t\t\t\t\t<option value=\"1029\">11. QĐ hành chính, hành vi hành chính trong việc áp dụng phí, thu phí, lệ phí; thu tiền sử dụng đất</option>\n" +
                "\t\t\t\t\t<option value=\"1030\">12. QĐ hành chính, hành vi hành chính trong quản lý nhà nước về sở hữu trí tuệ và chuyển giao công nghệ</option>\n" +
                "\t\t\t\t\t<option value=\"1031\">13. QĐ hành chính, hành vi hành chính trong quản lý nhà nước về đầu tư</option>\n" +
                "\t\t\t\t\t<option value=\"1032\">14. QĐ hành chính, hành vi hành chính của cơ quan hải quan, công chức hải quan</option>\n" +
                "\t\t\t\t\t<option value=\"1033\">15. QĐ hành chính, hành vi hành chính về quản lý hộ tịch</option>\n" +
                "\t\t\t\t\t<option value=\"1034\">16. QĐ hành chính, hành vi hành chính đối với việc từ chối công chứng, chứng thực</option>\n" +
                "\t\t\t\t\t<option value=\"1036\">17. QĐ hành chính, hành vi hành chính về quản lý đất đai trong trường hợp giao đất, cho thuê đất, thu hồi đất, trưng dụng đất, cho phép chuyển mục đích sử dụng đất; bồi thường, hỗ trợ, giải phóng mặt bằng, tái định cư; cấp hoặc thu hồi giấy chứng nhận quyền sử dụng đất; gia hạn thời hạn sử dụng đất</option>\n" +
                "\t\t\t\t\t<option value=\"1037\">18. Về danh sách cử tri</option>\n" +
                "\t\t\t\t\t<option value=\"1038\">19. QĐ kỷ luật buộc thôi việc công chức giữ giữ chức vụ từ Tổng cục trưởng và tương đương trở xuống</option>\n" +
                "\t\t\t\t\t<option value=\"1039\">20. QĐ của Chủ tịch UBND tỉnh, thành phố trực thuộc trung ương giải quyết khiếu nại đối với quyết định của Ban chủ nhiệm, Hội đồng khen thưởng, kỷ luật của Đoàn luật sư</option>\n" +
                "\t\t\t\t\t<option value=\"1040\">21. QĐ giải quyết khiếu nại về quyết định xử lý vụ việc cạnh tranh</option>\n" +
                "\t\t\t\t\t<option value=\"1041\">22. Các khiếu kiện khác</option>\n" +
                "\n" +
                "\t\t\t\t</select>"; // Dán nội dung HTML vào đây

        Document doc = Jsoup.parse(html);
        Elements lis = doc.select("option");

        for (Element li : lis) {

            System.out.println(li.text().trim());
        }
    }
}
