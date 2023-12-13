package store.controllers;


import store.business.Promotion;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.List;

import store.business.Category;
import store.business.Colour;
import store.business.Invoice;

import store.business.Product;
import store.business.Size;
import store.data.CategoryDB;
import store.data.ColourDB;
import store.data.InvoiceDB;
import store.data.ProductDB;
import store.data.PromotionDB;
import store.data.SizeDB;


public class AdminController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
    }
    
    // [GET] /admin/show
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
        throws ServletException, IOException {
        System.out.println("in do get Admin");
        
        String url = "/views/admin/stored-products.jsp";
        
        String requestURI = request.getRequestURI();
        
        System.out.println(requestURI);
        
        if(requestURI.endsWith("/stored/products")) {
            url = storedProducts(request, response);
        }
        
        if(requestURI.endsWith("/stored/categories")) {
            url = storedCategories(request, response);
        }
        
        if(requestURI.endsWith("/stored/promotions")) {
            url = storedPromotions(request, response);
        }
        
        if(requestURI.endsWith("/stored/orders")) {
            url = storedOrders(request, response);
        }
        
        if(requestURI.endsWith("/stored/users")) {
            url = storedUsers(request, response);
        }
        
        System.out.println("------------- end do get admin ------------");
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String storedProducts(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        try {
            List<Product> products = ProductDB.selectProducts();

            request.setAttribute("products", products);

            List<Category> categories = CategoryDB.selectCategories();

            request.setAttribute("categories", categories);

            List<Size> sizes = SizeDB.selectSizes();

            request.setAttribute("sizes", sizes);

            List<Colour> colors = ColourDB.selectColors();

            request.setAttribute("colors", colors);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        
        return "/views/admin/stored-products.jsp";
    }
    
    private String storedCategories(HttpServletRequest request, HttpServletResponse response){
        
        HttpSession session = request.getSession();
        
        List<Category> categories = CategoryDB.selectCategories();
        
        request.setAttribute("categories", categories);
        
        return "/views/admin/stored-categories.jsp";
    }
    
    private String storedPromotions(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        try {
            List<Promotion> promotions = PromotionDB.selectPromotions();
            
            System.out.println(promotions);
        
            request.setAttribute("promotions", promotions);
            
        } catch(Exception ex) {
            System.out.println(ex);
        }
        
        return "/views/admin/stored-promotions.jsp";
    }
    
    private String storedOrders(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        try {
            List<Invoice> invoices = InvoiceDB.selectInvoices();
            
            request.setAttribute("invoices", invoices);
        } catch(Exception ex) {
            System.out.println(ex);
        }
        
        return "/views/admin/stored-orders.jsp";
    }
    
    private String storedUsers(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        return "/views/admin/stored-users.jsp";
    }
}
