
package store.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SiteController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        System.out.println("in do get Site");
        
        String url = "/views/cart.jsp";
        
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/site/checkout")) {
            url = showCheckout(request, response);
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String showCart(HttpServletRequest request, HttpServletResponse response) {
        
        
        return "/views/cart.jsp";
    }
    
    private String showCheckout(HttpServletRequest request, HttpServletResponse response) {
        
        
        return "/views/checkout.jsp";
    }
}
