
package store.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import store.business.Colour;
import store.business.LineItem;
import store.business.Product;
import store.business.Size;
import store.data.ColourDB;
import store.data.LineItemDB;
import store.data.ProductDB;
import store.data.SizeDB;

public class CartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/cart/add")) {
            add(request, response);
        }
        
        String rootPath = getServletContext().getContextPath() + "/admin/stored/products";

        response.sendRedirect(rootPath);
        
//        response.setContentType("application/json");

//        // Create a JSON string
//        String jsonString = "{\"message\": \"Hello, this is a JSON response!\"}";
//
//        // Write the JSON string to the response
//        response.getWriter().write(jsonString);


        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
    }
    
    
    private void add(HttpServletRequest request, HttpServletResponse response) {
        String idInput = request.getParameter("form-add-to-cart-productId");
        
        String sizeInput = request.getParameter("form-add-to-cart-size");
        
        String colorInput = request.getParameter("form-add-to-cart-color");
        
        String quantityInput = request.getParameter("quantity-input");
        
        long id = 0;
        int sizeId = 0;
        int colorId = 0;
        int quantity = 0;
        
        try {
            id = Long.parseLong(idInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantity = Integer.parseInt(quantityInput);
        } catch(NumberFormatException ex) {
            System.out.println("can't parse");
        }
        
        Size sizeInstance = null;
        Colour colorInstance = null;
        
        try {
            sizeInstance = SizeDB.selectSize(sizeId);
            colorInstance = ColourDB.selectColor(colorId);
        } catch(Exception ex) {
            System.out.println("Can't not get sizeIntance or colorInstance");
        }
        
        Product p = ProductDB.selectProduct(id, colorId, sizeId);
        
        System.out.println(p);
        
        LineItem li = new LineItem();
        
        li.setProduct(p);
        
        li.setQuantity(quantity);
        
        LineItemDB.insert(li);
    }
}
