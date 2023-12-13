
package store.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.business.Address;
import store.business.Cart;
import store.business.Customer;
import store.business.Invoice;
import store.business.LineItem;
import store.business.User;

import store.util.MailUtil;


public class MailController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String html = "";
        
        List<Long> productsPromotion_id = (List<Long>) session.getAttribute("productsPromotion_id");
        
        
        
        Cart cart = (Cart)session.getAttribute("cart");
        User user = (User)session.getAttribute("user");
        Customer customer = (Customer)session.getAttribute("customer");
        Address address = (Address)session.getAttribute("address");
        Invoice invoice = (Invoice)session.getAttribute("invoice");
        
        for(LineItem li : cart.getItems()) {
            String td = "";
            if(productsPromotion_id.contains(li.getProduct().getProductId())) {
            td = "<tr>\n" +
"            <td class=\"service\">" + li.getProduct().getName() + "</td>\n" +
"            <td class=\"desc\">Creating a recognizable design solution based on the company's existing visual identity</td>\n" +
"            <td class=\"unit\">20%</td>\n" +
"            <td class=\"unit\">$ " + li.getProduct().getPrice() + "</td>\n" +
"            <td class=\"qty\">" + li.getQuantity() + "</td>\n" +
"            <td class=\"total\">$ " + li.getSubTotalSale(li.getProduct().salePrice())+ "</td>\n" +
"          </tr>";
            } else {
            td = "<tr>\n" +
"            <td class=\"service\">" + li.getProduct().getName() + "</td>\n" +
"            <td class=\"desc\">Creating a recognizable design solution based on the company's existing visual identity</td>\n" +
"            <td class=\"unit\">20%</td>\n" +
"            <td class=\"unit\">$ " + li.getProduct().getPrice() + "</td>\n" +
"            <td class=\"qty\">" + li.getQuantity() + "</td>\n" +
"            <td class=\"total\">$ " + li.getSubTotal() + "</td>\n" +
"          </tr>";
            }
            html += td;
        }
        
        System.out.println("HTML: " + html);
        
        String to = "lov3rinve146@gmail.com";
        String from = "lxbach1608@gmail.com";
        String subject = "Welcome to our email list";
        String body = "<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"  <head>\n" +
"    <meta charset=\"utf-8\">\n" +
"    <title>Example 1</title>\n" +
"    <link rel=\"stylesheet\" href=\"style.css\" media=\"all\" />\n" +
"    \n" +
"    <style>\n" +
"    .clearfix:after {\n" +
"      content: \"\";\n" +
"      display: table;\n" +
"      clear: both;\n" +
"    }\n" +
"\n" +
"    a {\n" +
"      color: #5D6975;\n" +
"      text-decoration: underline;\n" +
"    }\n" +
"\n" +
"    body {\n" +
"      position: relative;\n" +
"      width: 21cm;  \n" +
"      height: 29.7cm; \n" +
"      margin: 0 auto; \n" +
"      color: #001028;\n" +
"      background: #FFFFFF; \n" +
"      font-family: Arial, sans-serif; \n" +
"      font-size: 12px; \n" +
"      font-family: Arial;\n" +
"    }\n" +
"\n" +
"    header {\n" +
"      padding: 10px 0;\n" +
"      margin-bottom: 30px;\n" +
"    }\n" +
"\n" +
"    #logo {\n" +
"      text-align: center;\n" +
"      margin-bottom: 10px;\n" +
"    }\n" +
"\n" +
"    #logo img {\n" +
"      width: 90px;\n" +
"    }\n" +
"\n" +
"    h1 {\n" +
"      border-top: 1px solid  #5D6975;\n" +
"      border-bottom: 1px solid  #5D6975;\n" +
"      color: #5D6975;\n" +
"      font-size: 2.4em;\n" +
"      line-height: 1.4em;\n" +
"      font-weight: normal;\n" +
"      text-align: center;\n" +
"      margin: 0 0 20px 0;\n" +
"      background: url(dimension.png);\n" +
"    }\n" +
"\n" +
"    #project {\n" +
"      float: left;\n" +
"    }\n" +
"\n" +
"    #project span {\n" +
"      color: #5D6975;\n" +
"      text-align: right;\n" +
"      width: 52px;\n" +
"      margin-right: 10px;\n" +
"      display: inline-block;\n" +
"      font-size: 0.8em;\n" +
"    }\n" +
"\n" +
"    #company {\n" +
"      float: right;\n" +
"      text-align: right;\n" +
"    }\n" +
"\n" +
"    #project div,\n" +
"    #company div {\n" +
"      white-space: nowrap;        \n" +
"    }\n" +
"\n" +
"    table {\n" +
"      width: 100%;\n" +
"      border-collapse: collapse;\n" +
"      border-spacing: 0;\n" +
"      margin-bottom: 20px;\n" +
"    }\n" +
"\n" +
"    table tr:nth-child(2n-1) td {\n" +
"      background: #F5F5F5;\n" +
"    }\n" +
"\n" +
"    table th,\n" +
"    table td {\n" +
"      text-align: center;\n" +
"    }\n" +
"\n" +
"    table th {\n" +
"      padding: 5px 20px;\n" +
"      color: #5D6975;\n" +
"      border-bottom: 1px solid #C1CED9;\n" +
"      white-space: nowrap;        \n" +
"      font-weight: normal;\n" +
"    }\n" +
"\n" +
"    table .service,\n" +
"    table .desc {\n" +
"      text-align: left;\n" +
"    }\n" +
"\n" +
"    table td {\n" +
"      padding: 20px;\n" +
"      text-align: right;\n" +
"    }\n" +
"\n" +
"    table td.service,\n" +
"    table td.desc {\n" +
"      vertical-align: top;\n" +
"    }\n" +
"\n" +
"    table td.unit,\n" +
"    table td.qty,\n" +
"    table td.total {\n" +
"      font-size: 1.2em;\n" +
"    }\n" +
"\n" +
"    table td.grand {\n" +
"      border-top: 1px solid #5D6975;;\n" +
"    }\n" +
"\n" +
"    #notices .notice {\n" +
"      color: #5D6975;\n" +
"      font-size: 1.2em;\n" +
"    }\n" +
"\n" +
"    footer {\n" +
"      color: #5D6975;\n" +
"      width: 100%;\n" +
"      height: 30px;\n" +
"      position: absolute;\n" +
"      bottom: 0;\n" +
"      border-top: 1px solid #C1CED9;\n" +
"      padding: 8px 0;\n" +
"      text-align: center;\n" +
"    }\n" +
"    </style>\n" +
"  </head>\n" +
"  <body>\n" +
"    <header class=\"clearfix\">\n" +
"      <div id=\"logo\">\n" +
"        <img src=\"logo.png\">\n" +
"      </div>\n" +
"      <h1>INVOICE 3-2-1</h1>\n" +
"      <div id=\"company\" class=\"clearfix\">\n" +
"        <div>Company Name</div>\n" +
"        <div>455 Foggy Heights,<br /> AZ 85004, US</div>\n" +
"        <div>(602) 519-0450</div>\n" +
"        <div><a href=\"mailto:company@example.com\">company@example.com</a></div>\n" +
"      </div>\n" +
"      <div id=\"project\">\n" +
"        <div><span>PROJECT</span> Website development</div>\n" +
"        <div><span>CLIENT</span> "+ customer.getFirstName() + " " + customer.getLastName() + "</div>\n" +
"        <div><span>ADDRESS</span> "+ address.getAddressLine()+ "</div>\n" +
"        <div><span>EMAIL</span> <a href=\"mailto:john@example.com\">"+ user.getEmail()+ "</a></div>\n" +
"        <div><span>DATE</span> "+ invoice.getOrderDate().toString() + "</div>\n" +
"        <div><span>DUE DATE</span> December 30, 2023</div>\n" +
"      </div>\n" +
"    </header>\n" +
"    <main>\n" +
"      <table>\n" +
"        <thead>\n" +
"          <tr>\n" +
"            <th class=\"service\">PRODUCT</th>\n" +
"            <th class=\"desc\">DESCRIPTION</th>\n" +
"            <th>DISCOUNT RATE</th>\n" +
"            <th>PRICE</th>\n" +
"            <th>QTY</th>\n" +
"            <th>TOTAL</th>\n" +
"          </tr>\n" +
"        </thead>\n" +
"        <tbody>\n" + html +
"          <tr>\n" +
"            <td colspan=\"5\">SUBTOTAL</td>\n" +
"            <td class=\"total\">$ "+ cart.getTotalCart() + "</td>\n" +
"          </tr>\n" +
"          <tr>\n" +
"            <td colspan=\"5\">TAX 25%</td>\n" +
"            <td class=\"total\">$1,300.00</td>\n" +
"          </tr>\n" +
"          <tr>\n" +
"            <td colspan=\"5\" class=\"grand total\">GRAND TOTAL</td>\n" +
"            <td class=\"grand total\">$ "+ cart.getTotalCart() + "</td>\n" +
"          </tr>\n" +
"        </tbody>\n" +
"      </table>\n" +
"      <div id=\"notices\">\n" +
"        <div>NOTICE:</div>\n" +
"        <div class=\"notice\">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>\n" +
"      </div>\n" +
"    </main>\n" +
"    <footer>\n" +
"      Invoice was created on a computer and is valid without the signature and seal.\n" +
"    </footer>\n" +
"  </body>\n" +
"</html>";
        boolean isBodyHTML = true;

        try {
            MailUtil.sendMail(to, from, subject, body, isBodyHTML);
        } catch (MessagingException e) {
            String errorMessage
                    = "ERROR: Unable to send email. "
                    + "Check Tomcat logs for details.<br>"
                    + "NOTE: You may need to configure your system "
                    + "as described in chapter 14.<br>"
                    + "ERROR MESSAGE: " + e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            this.log(
                    "Unable to send email. \n"
                    + "Here is the email you tried to send: \n"
                    + "=====================================\n"
                    + "TO: " + to + "\n"
                    + "FROM: " + from + "\n"
                    + "SUBJECT: " + subject + "\n"
                    + "\n"
                    + body + "\n\n");
        }
        
        getServletContext()
                .getRequestDispatcher("/index.jsp")
                .forward(request, response);
        
    }
}
