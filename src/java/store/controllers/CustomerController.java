
package store.controllers;


import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.business.Customer;
import store.business.Invoice;
import store.business.User;
import store.data.CustomerDB;
import store.data.InvoiceDB;
import store.data.UserDB;

public class CustomerController extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String url = "/index.jsp";
        
        HttpSession session = request.getSession();
        
        String requestURI = request.getRequestURI();
        String rootPath = getServletContext().getContextPath();
        
        if(requestURI.endsWith("/customers/password/update")) {
            url = updatePassword(request, response);
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    } 
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String url = "/index.jsp";
        
        HttpSession session = request.getSession();
        
        String requestURI = request.getRequestURI();
        String rootPath = getServletContext().getContextPath();
        
        System.out.println(requestURI);
        
        if(requestURI.endsWith("/customers/dashboard")) {
            url = "/views/customers/orders.jsp";
        }
        
        if(requestURI.endsWith("/customers/addresses")) {
            url = "/views/customers/addresses.jsp";
        }
        
        if(requestURI.endsWith("/customers/orders")) {
            url = viewInvoices(request, response);
        }
        
        if(requestURI.endsWith("/customers/details")) {
            url = "/views/customers/customer-details.jsp";
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String viewInvoices(HttpServletRequest request, HttpServletResponse response) {
        String url = "/views/customers/orders.jsp";
        
        HttpSession session = request.getSession();
        
        User u = (User) session.getAttribute("user");
        
        try {
            List<Invoice> invoices = InvoiceDB.selectInvoiceByUserId(u.getUserId());
            
            System.out.println("Invoice:" + invoices);
            
            request.setAttribute("invoices", invoices);
            
        } catch(Exception ex) {
            System.out.println(ex);
            
        }
        
        return url;
    }
    
    private String updatePassword(HttpServletRequest request, HttpServletResponse response) {
        String url = "/views/customers/customer-details.jsp";
        
        String email = request.getParameter("customer-form-email").trim();
        String curPassword = request.getParameter("customer-form-currentpassword").trim();
        String newPassword = request.getParameter("customer-form-newpassword").trim();
        String confirmedPassword = request.getParameter("customer-form-confirmpassword").trim();
        
        try {
            User u = (User) UserDB.selectUser(email, curPassword);
            
        } catch(NullPointerException ex) {
            System.out.println("Error: " + ex);
                
            String globalMessage = "Wrong password !!!";

            request.setAttribute("globalMessage", globalMessage);
            
            return url;
        }
        
        if(!confirmedPassword.equals(newPassword)) {
            String globalMessage = "Something wrong !!";

            request.setAttribute("globalMessage", globalMessage);
            
            return url;
        }
        
        User u = UserDB.selectUser(email, curPassword);
        u.setPassword(confirmedPassword);
        
        UserDB.update(u);
        
        request.setAttribute("globalMessage", "Change password sucessfully !!");
        
        return url;
    }
    
    private String insert_updateCustomer(HttpServletRequest request,
            HttpServletResponse response){
        HttpSession session = request.getSession();
        String url;
        String message;
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        
        User u = (User)session.getAttribute("user");
        
        Long userId = u.getUserId();
        Customer c = CustomerDB.selectCustomer(userId);
        
        if(firstName == null || lastName == null || phoneNumber == null || firstName.isEmpty() || lastName.isEmpty() || phoneNumber.isEmpty()){
            message = "Please fill out all three text boxes.";
            request.setAttribute("message", message);
            url = "/my_account/edit-account.jsp";
        }
        else{
            if(c == null){
                c = new Customer();
                c.setFirstName(firstName);
                c.setLastName(lastName);
                c.setPhoneNumber(phoneNumber);
                CustomerDB.insert(c);
                u.setCustomer(c);
                UserDB.update(u);
            }
            else{
                c.setFirstName(firstName);
                c.setLastName(lastName);
                c.setPhoneNumber(phoneNumber);
                CustomerDB.update(c);

                u.setCustomer(c);
                UserDB.update(u);
            }
            url = "/my_account/edit-account.jsp";
        }
        
        session.setAttribute("customer", c);
        
        return url;
    }
}