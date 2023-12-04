
package store.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        System.out.println("Cart controller");
        
        String productInput = request.getParameter("form-add-to-cart-productId");
        
        String sizeInput = request.getParameter("form-add-to-cart-size");
        
        String colorInput = request.getParameter("form-add-to-cart-color");
        
        String quantityInput = request.getParameter("quantity-input");

        response.setContentType("application/json");

        // Create a JSON string
        String jsonString = "{\"message\": \"Hello, this is a JSON response!\"}";

        // Write the JSON string to the response
        response.getWriter().write(jsonString);

    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
    }
}
