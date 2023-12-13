
package store.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.business.Cart;
import store.business.Colour;
import store.business.LineItem;
import store.business.Product;
import store.business.Size;
import store.data.ProductDB;

public class CartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String url;
        
        String requestURI = request.getRequestURI();
        
        String rootPath = getServletContext().getContextPath();
        
        if(requestURI.endsWith("/cart/add")) {
            boolean isAdd = add(request, response);
            
            if(!isAdd) {
                getServletContext().getRequestDispatcher("/views/products/details.jsp").forward(request, response);
                
                return;
            }
        }
        
        if(requestURI.endsWith("/cart/update")) {
            url = update(request, response);
        }
        
        response.sendRedirect(rootPath + "/cart/view");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String url = "/views/cart.jsp";
        
        String requestURI = request.getRequestURI();
         
        if(requestURI.endsWith("/cart/view")) {
            url = "/views/cart.jsp";
        }
        
        if(requestURI.endsWith("/cart/update")) {
            url = update(request, response);
        }
         
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    
    private boolean add(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        String idInput = request.getParameter("form-add-to-cart-productId");
        String sizeInput = request.getParameter("form-add-to-cart-size");
        String colorInput = request.getParameter("form-add-to-cart-color");
        String quantityInput = request.getParameter("quantity-input");
        
        long id;
        int sizeId;
        int colorId;
        int quantity;
        
        try {
            id = Long.parseLong(idInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantity = Integer.parseInt(quantityInput);
            
        } catch(NumberFormatException ex) {
            System.out.println("Error: " + ex);
                
            String globalMessage = "Error 505: when add product to cart";

            request.setAttribute("globalMessage", globalMessage);
            
            return false;
        }
        
        Cart cart = (Cart) session.getAttribute("cart");
        
        Product product = null;
        
        try {
            product = ProductDB.selectProduct(id, colorId, sizeId);
            Size s = product.getSize();
            Colour c = product.getColor();

        } catch(Exception ex) {
            System.out.println("Error: " + ex);
                
            String globalMessage = "Product don't has these variation ! Please choose other variation";

            request.setAttribute("globalMessage", globalMessage);
            
            return false;
        }


        LineItem li = new LineItem();
        
        li.setProduct(product);
        li.setQuantity(quantity);
        
        cart.addItem(li);
        
        session.setAttribute("cart", cart);
        
        return true;
    }

    private String update(HttpServletRequest request, HttpServletResponse response) {
        String[] quantityInput = request.getParameterValues("quantity-input");
        String[] lineProductId = request.getParameterValues("line-productId");
        String redirect = request.getParameter("redirect");
        
        System.out.println(redirect);
        
        
        HttpSession session = request.getSession();
        
        Cart cart = (Cart)session.getAttribute("cart");
        
        int id = 0;
        int quantity = 0;
        
        for(int i = 0; i < quantityInput.length; i++) {
            
            try {
                id = Integer.parseInt(lineProductId[i]);
                quantity = Integer.parseInt(quantityInput[i]);
                
                if(quantity < 1 && quantity != 0) {
                    continue;
                    
                }
            } catch(NumberFormatException ex) {
                continue;
                
            }
            
            cart.updateItem(id, quantity);
        }
        
        if(redirect != null) {
            return "/views/products/details.jsp";
        }
        
        return "/views/cart.jsp";
    }
}
