
package store.controllers;


import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import store.business.Address;
import store.business.Customer;
import store.business.Role;
import store.business.User;
import store.data.AddressDB;
import store.data.CustomerDB;
import store.data.RoleDB;
import store.data.UserDB;


public class UserController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException{
        System.out.println("in do post User");
        
        String requestURI = request.getRequestURI();
        String rootPath = getServletContext().getContextPath();
        
        String url = "/index.jsp";
        
        System.out.println(requestURI);
        
        if(requestURI.endsWith("/user/signin")) {
            if(!signIn(request, response)) {
                url = "/views/account/login.jsp";
            }
        }
        if(requestURI.endsWith("/user/signup")) {
            url = insertUser(request, response);
        }
        
        if(requestURI.endsWith("/user/sendopt")) {
            url = forgotPassword(request, response);
        }
        
        if(requestURI.endsWith("/user/validateopt")) {
            url = validateOTP(request, response);
        }
        
        if(requestURI.endsWith("/user/newpassword")) {
            url = changePassword(request, response);
        }
        
        if(requestURI.endsWith("/user/password/update")) {
            url = updatePassword(request, response);
        }
        
        if(requestURI.endsWith("/user/address/update")) {
            url = updateAddress(request, response);
        }
       
        getServletContext().getRequestDispatcher(url).forward(request, response);
        
    }
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException{
        System.out.println("in do get User");
        
        HttpSession session = request.getSession();
        
        String url = "/index.jsp";
        
        String requestURI = request.getRequestURI();
        
        System.out.println(requestURI);
        
        if(requestURI.endsWith("/user/login")) {
            url = "/views/account/login.jsp";
        }
        
        if(requestURI.endsWith("/user/logout")) {
            // remove user, customer, address from session
            session.removeAttribute("user");
            session.removeAttribute("customer");
            session.removeAttribute("address");
            
            url = "/views/account/login.jsp";
        }
        
        if(requestURI.endsWith("/user/register")) {
            url = "/views/account/register.jsp";
        }
        
        if(requestURI.endsWith("/user/forgetpassword")) {
            url = "/views/account/forgotPassword.jsp";
        }
        
        if(requestURI.endsWith("/user/myAccount")) {
            url = "/views/account/my-account.jsp";
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
        
    }
    
    private String insertUser(HttpServletRequest request,
            HttpServletResponse response) throws IOException{
            String url;
            
            String email = request.getParameter("form-register-email").trim();
            String password = request.getParameter("form-register-password").trim();
            String rePassword = request.getParameter("form-register-repassword").trim();
            
            if(!rePassword.equals(password)) {
                String registerMessage = "Your password are not the same :(";
                
                request.setAttribute("registerMessage", registerMessage);
                
                url = "/views/account/register.jsp";
                
                return url;
            }
            
            User u = UserDB.selectUser(email);
            
            if(u != null){
                String registerMessage = "Your email are exist :(";
                
                request.setAttribute("registerMessage", registerMessage);

                url = "/views/account/register.jsp";
            }
            else{
                u = new User();
                Address a = new Address();
                a.setAddressLine(null);
                a.setCity(null);
                a.setRegion(null);
                
                Customer c = new Customer();
                c.setFirstName(null);
                c.setLastName(null);
                c.setPhoneNumber(null);
                c.setAddress(a);
                
                Role role = RoleDB.selectRole(1);
                
                u.setEmail(email);
                u.setPassword(password);
                u.setRole(role);
                u.setCustomer(c);

                UserDB.update(u);
                
                url = "/views/account/login.jsp";
            }
        
            return url; 
        }
    
    private boolean signIn(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();
        
        String email = request.getParameter("form-login-email").trim();
        String password = request.getParameter("form-login-password").trim();
        
        
        
        String messageLogin = null;
        
        if (email == null || password == null || email.isEmpty() || password.isEmpty() ) {
            messageLogin = "Please fillout these boxes !!";
            
            request.setAttribute("messageLogin", messageLogin);
            
            return false;
        }
        
        User u = UserDB.selectUser(email, password);
        
        if( u == null ) {
            messageLogin = "Invalid email or password !!";
            
            request.setAttribute("messageLogin", messageLogin);
            
            return false;
        }
        
        // set set, customer, address to session        
        session.setAttribute("user", u);
        
        try {
            session.setAttribute("customer", u.getCustomer());
            session.setAttribute("address", u.getCustomer().getAddress());         
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return true;
    }
    
    private String updateAddress(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("update address");

        HttpSession session = request.getSession();
        
        User user = (User) session.getAttribute("user");
        
        if(user == null) {
            System.out.println("no user to update");
//            return;
        }
        
        String firstName = request.getParameter("address-update-firstname").trim();
        String lastName = request.getParameter("address-update-lastname").trim();
        String city = request.getParameter("address-update-city").trim();
        String region = request.getParameter("address-update-region").trim();
        String addressLine = request.getParameter("address-update-addressline").trim();
        String phone = request.getParameter("address-update-phone").trim();
        String note = request.getParameter("address-update-note").trim();
        

        User u = UserDB.selectUser(user.getUserId());
        Customer customer = user.getCustomer();
        
        Address address = null;
        
        
        if(customer == null) {
            System.out.println("customer null !!!");
            
            customer = new Customer();
            address = new Address();
            
            address.setAddressLine(addressLine);
            address.setCity(city);
            address.setRegion(region);
            
            customer.setAddress(address);
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setPhoneNumber(phone);
            
            u.setCustomer(customer);
            
            UserDB.update(u);
            
            session.setAttribute("user", u);
        }
        
        
        customer = CustomerDB.selectCustomer(user.getCustomer().getCustomerId());

        address = AddressDB.selectAddress(customer.getAddress().getAddressId());

        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setPhoneNumber(phone);
        
        address.setAddressLine(addressLine);
        address.setCity(city);
        address.setRegion(region);
        
        AddressDB.update(address);
        CustomerDB.update(customer);
        
        session.setAttribute("customer", customer);
        session.setAttribute("address", address);
        
        return "/views/checkout.jsp";
    }
   
    private String insertCustomer(HttpServletRequest request,
            HttpServletResponse response){
        HttpSession session = request.getSession();
        String url;
        String message;
        
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        
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
    private String updatePassword(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        User user = (User) session.getAttribute("user");
        
        String curPass = request.getParameter("user-form-currentpassword").trim();
        String newPass = request.getParameter("user-form-newpassword").trim();
        String confirmPass = request.getParameter("user-form-confirmpassword").trim();
        
        if(curPass.equals("") || newPass.equals("") || confirmPass.equals("") ||
            curPass == null || newPass == null || confirmPass == null)  
        {
            String globalMessage = "Please full fill these boxes !!";

            request.setAttribute("globalMessage", globalMessage);
            
            return "/views/customers/customer-details.jsp";
        }
        
        if(!user.getPassword().equals(curPass)) {
            String globalMessage = "Current password is wrong !!";

            request.setAttribute("globalMessage", globalMessage);
            
            return "/views/customers/customer-details.jsp";
        }
        
        if(!newPass.equals(confirmPass)) {
            String globalMessage = "New password and confirmed password are not the same !!!";

            request.setAttribute("globalMessage", globalMessage);
            
            return "/views/customers/customer-details.jsp";
        }
        
        user = UserDB.selectUser(user.getEmail(), user.getPassword());
        user.setPassword(confirmPass);
        UserDB.update(user);
        
        return "/views/customers/customer-details.jsp";
    }
    private String forgotPassword(HttpServletRequest request,
            HttpServletResponse response){
        String url;
        
        String email = request.getParameter("form-forgot-email").trim();		
	int otpvalue = 0;
	HttpSession mySession = request.getSession();
        
        User u = UserDB.selectUser(email);
        
        System.out.println(u);
        
        if(u!=null){
            if(email!=null || !email.isEmpty()){
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);
            
            String to = email;// change accordingly
			// Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                                @Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("aa7853137@gmail.com", "tewbyoxkbbfrhihd");// Put your email																									
				}
			});
            try {
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(email));// change accordingly
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject("Hello");
		message.setText("Your OTP is: " + otpvalue);
		// send message
		Transport.send(message);
		System.out.println("message sent successfully");
            }

            catch (MessagingException e) {
		throw new RuntimeException(e);
            }
        }
            url = "/views/account/enterOTP.jsp";

            request.setAttribute("message","OTP is sent to your email id");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp",otpvalue); 
            mySession.setAttribute("email",email); 
        }
        else{
            request.setAttribute("messageOpt","Your email is not registered");
            url="/views/account/forgotPassword.jsp";
        }

        return url;
    }
    private String validateOTP(HttpServletRequest request,
            HttpServletResponse response){
        String url;
        
        int value=Integer.parseInt(request.getParameter("form-validate-opt").trim());
	HttpSession session=request.getSession();
	int otp=(int)session.getAttribute("otp");
        
        if (value==otp) 
	{
			
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            url = "/views/account/newPassword.jsp";			
	}
        else{
            request.setAttribute("message","Wrong otp");
            url = "/views/account/enterOTP.jsp";
        }
        return url;
    }
    private String changePassword(HttpServletRequest request,
            HttpServletResponse response){
        String url;
        HttpSession session=request.getSession();
        
        String email = (String)session.getAttribute("email");
        String newPassword = request.getParameter("form-new-password").trim();
        
        User u = UserDB.selectUser(email);

        u.setPassword(newPassword);
        UserDB.update(u);
        url = "/views/account/login.jsp";
        
        return url;
    }
}
