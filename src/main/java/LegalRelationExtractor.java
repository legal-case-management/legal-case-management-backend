import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class LegalRelationExtractor {

    public static void main(String[] args) {
        String html = "<select name=\"ctl00$CPManager$ctl00$drop_Cases\" onchange=\"javascript:setTimeout('__doPostBack(\\'ctl00$CPManager$ctl00$drop_Cases\\',\\'\\')', 0)\" id=\"ctl00_CPManager_ctl00_drop_Cases\" class=\"chosen-select\" data-placeholder=\"Chọn...\">\n" +
                "\t<option selected=\"selected\" value=\"\"></option>\n" +
                "\t<option value=\"581\">1. Đưa vào trường giáo dưỡng</option>\n" +
                "\t<option value=\"582\">2. Đưa vào cơ sở giáo dục bắt buộc</option>\n" +
                "\t<option value=\"583\">3. Đưa vào cơ sở cai nghiện bắt buộc</option>\n" +
                "\n" +
                "</select>"; // Dán nội dung HTML vào đây

        Document doc = Jsoup.parse(html);
        Elements lis = doc.select("option");

        for (Element li : lis) {

            System.out.println(li.text().trim());
        }
    }
}
