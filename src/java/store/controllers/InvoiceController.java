package store.controllers;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.business.Cart;
import store.business.Inventory;
import store.business.Invoice;
import store.business.LineItem;
import store.business.Status;
import store.business.User;
import store.data.InventoryDB;
import store.data.InvoiceDB;
import store.data.StatusDB;
import store.data.UserDB;


public class InvoiceController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String rootPath = getServletContext().getContextPath();
        
        String url = "/views/checkout.jsp";
        
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/orders/placed")) {
            url = placedOrder(request, response);
        }
        
//        response.sendRedirect(rootPath);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    
    
    }
    
    private String placedOrder(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        Cart cart = (Cart)session.getAttribute("cart");
        
        if (cart == null) {
            String failureMessage = "Error when place order";
            
            request.setAttribute("failureMessage", failureMessage);
            
//            return;
        }
        
        User user = (User)session.getAttribute("user");
        
        long id = user.getUserId();
        
       
        
        Date orderDate = new Date();
        String note = "this is Node";
        Status status = null;
        double total = cart.getTotalCartValue();
        
        user = UserDB.selectUser(id);
        status = StatusDB.selectStatus(id);
        
        String phone = user.getCustomer().getPhoneNumber();
        String addressLine = user.getCustomer().getAddress().getAddressLine();
        String city = user.getCustomer().getAddress().getCity();
        String region = user.getCustomer().getAddress().getRegion();
        
        if(phone.equals("") || addressLine.equals("") || city.equals("") || region.equals("") || 
                phone == null || addressLine == null || city == null || region == null) {
            String orderMessage = "Please full fill your information !!";
            
            request.setAttribute("orderMessage", orderMessage);
            
            return "/views/checkout.jsp";
        }
        
        Invoice o = new Invoice();
    
        o.setStatus(status);
        o.setUser(user);
        o.setNote(note);
        o.setOrderDate(orderDate);
        o.setLines(cart.getItems());
        o.setTotal(total);
        
        for(LineItem li : cart.getItems()) {
            System.out.println(li.getQuantity());
        }
        
        try {
            InvoiceDB.insert(o);
            
            session.setAttribute("invoice", o);
            
            for(LineItem li : cart.getItems()) {
                Inventory i = InventoryDB.selectInventory(li.getProduct().getProductId(), li.getProduct().getSize().getSizeId(), li.getProduct().getColor().getColorId());
                
                i.setQuantityInStock(i.getQuantityInStock() - li.getQuantity());
                
                InventoryDB.update(i);
                
                return "/views/success-order.jsp";
            }
        } catch(Exception ex) {
            System.out.println(ex);
        }
        
        return "/views/checkout.jsp";
    }
}
