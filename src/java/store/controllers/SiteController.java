
package store.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import store.business.Address;
import store.business.Category;
import store.business.Customer;
import store.business.Product;
import store.business.User;
import store.data.AddressDB;
import store.data.CategoryDB;
import store.data.CustomerDB;
import store.data.ProductDB;

public class SiteController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String url = "/index.jsp";
        
        String requestURI = request.getRequestURI();
        String rootPath = getServletContext().getContextPath();
        
        System.out.println(requestURI);

        if(requestURI.startsWith(rootPath + "/categories")) {
            url = showProductsCategory(request, response);
        }
                
        if(requestURI.endsWith("/site/cart")) {
            url = "/views/cart.jsp";
        }
        
        if(requestURI.endsWith("/site/checkout")) {
            url = showCheckout(request, response);
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String showCheckout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("user");

        if( user != null) {
            Customer customer = null;
            Address address = null;
            
            try {
                customer = CustomerDB.selectCustomer(user.getCustomer().getCustomerId());
                address = AddressDB.selectAddress(customer.getAddress().getAddressId());
                
                session.setAttribute("customer", customer);
                session.setAttribute("address", address);
            } 
            catch(Exception ex) {
                System.out.println("Error: " + ex);
                
                String globalMessage = "Error when checkout";
                
                request.setAttribute("globalMessage", globalMessage);
            }
        }

        return "/views/checkout.jsp";
    }

    private String showProductsCategory(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();   
        
        String categoryIdURL = request.getParameter("id");
        String parent = request.getParameter("parent");
        
        List<Product> products = null;
        long categoryId;
        
        try {
            categoryId = Long.parseLong(categoryIdURL);
            
        } catch (NumberFormatException ex) {
            System.out.println("Error: " + ex);

            return "/views/products/show.jsp";
        }
        
        if (parent != null) {
            List<Category> categories = null;
            
            try {
                categories = CategoryDB.selectChildren(categoryId);
                
            } catch(Exception ex) {
                System.out.println("Error: " + ex);
                
                String globalMessage = "Error when get products from category";
                
                request.setAttribute("globalMessage", globalMessage);
                        
                return "/index.jsp";
            }
            
            
            List<Product> parentCategory_Products = new ArrayList<>();
            
            for(Category c : categories) {
                products = ProductDB.selectProductsByCategory(c.getCategoryId());

                if(products != null) {
                    for(Product p : products) {
                        parentCategory_Products.add(p);
                    }
                }
            }

            if(!parentCategory_Products.isEmpty()) {
                
                products = parentCategory_Products;
            } else {
                products = null;
            }
            
        } else {
            products = ProductDB.selectProductsByCategory(categoryId);
        }
        
        if(products == null) {
            System.out.println("product null");
                
            request.setAttribute("globalMessage", "There are no products for this category");

            return "/views/products/show.jsp";
        }
        
        String page = request.getParameter("page");
        
        List<Integer> pages = new ArrayList<>();
        
        int count = 0;
        
        int size;
        
        try {
            size = products.size();
        } catch(Exception ex) {
            size = 0;
        }
        
        count = products.size() / 9;
        
        for (int i = 0; i <= count; i++) {
            boolean add = pages.add(i);
        }
        
        int start = 0;
        int end = 8;
        
        if(page != null) {
            start = 9 * Integer.parseInt(page);
            end = start + 9 - 1;
        }
    
        request.setAttribute("products", products);
        
        request.setAttribute("pages", pages);
        
        request.setAttribute("start", start);
        
        request.setAttribute("end", end);
        
        return "/views/products/show.jsp";
    }
}
