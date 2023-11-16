package store.controllers;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import store.business.Category;
import store.business.Colour;

import store.data.ProductDB;
import store.business.Product;
import store.business.Size;
import store.data.CategoryDB;
import store.data.ColourDB;
import store.data.SizeDB;

public class ProductController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("in do post product controller");
        
        // initial default url if the request doesn't match any route (particular url) or wrong path
        String url = "/admin/stored/products";
        
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/products/create")) {
            create(request, response);
        }
//        if(requestURI.endsWith("/products/update")) {
//            update(request, response);
//        }
//        if(requestURI.endsWith("/products/delete")) {
//            delete(request, response);
//        }
//
        String rootPath = getServletContext().getContextPath();
        
        response.sendRedirect(rootPath + url);

    }
    
    // file-wellcome: /loadProducts

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("in do get product controller");
    }
    
    private void show(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        List<Product> products = ProductDB.selectProducts();
        
        session.setAttribute("products", products);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceInput = request.getParameter("price");
        String salePriceInput = request.getParameter("salePrice");
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        String imageUrl = request.getParameter("imageUrl");
        String slug = request.getParameter("slug");
        String[] selectedCategoriesInput = request.getParameterValues("categories");
        
        double price = Double.parseDouble(priceInput);
        double salePrice = Double.parseDouble(salePriceInput);
        int sizeId = Integer.parseInt(sizeInput);
        int colorId = Integer.parseInt(colorInput);


        
//        
//        List<Category> listSelectedCategory = new ArrayList<Category>();
//
//        try
//        {
//            for(String value : selectedCategory)
//            {
//                long id = Long.parseLong(value);
//                
//                Category c = CategoryDB.selectCategory(id);
//                
//                listSelectedCategory.add(c);
//            }
//        }
//        catch(NullPointerException ex)
//        {
//            System.out.println(ex);
//        }
//
//
//        try {
//            size = sizeInput.endsWith(".0") ? SizeDB.selectSize((int)sizeValue) : SizeDB.selectSize(sizeValue);
//        } catch(Exception e) {
//            System.out.println("Error in get Size instant");
//        }
//        
//        try {
//            color = ColourDB.selectColor(colorInput);
//        } catch(Exception e) {
//            System.out.println("Error in get Colour instant");
//        }

        Size sizeInstance = null;
        Colour colorInstance = null;
        List<Category> selectedCategories = Category.convertToCategories(selectedCategoriesInput);


        

        try {
            sizeInstance = SizeDB.selectSize(sizeId);
            colorInstance = ColourDB.selectColor(colorId);
        } catch(Exception ex) {
            System.out.println("Can't not get sizeIntance or colorInstance");
        }

        Product p = new Product();
        p.setName(name);
        p.setDesciption(description);
        p.setColor(colorInstance);
        p.setSize(sizeInstance);
        p.setImageUrl(imageUrl);
        p.setPrice(price);
        p.setSalePrice(salePrice);
        p.setSlug(slug);
        p.setCategory(selectedCategories);
        
        ProductDB.insert(p);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("productId");
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String productPrice = request.getParameter("price");
        String imgUrl = request.getParameter("imgUrl");
        String slug = request.getParameter("slug");
        
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        double price = Double.parseDouble(productPrice);
        
        p.setName(name);
        p.setDesciption(desc);
        p.setPrice(price);
        p.setImageUrl(imgUrl);
        p.setSlug(slug);
        
        ProductDB.update(p);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
         String productId = request.getParameter("productId");
         
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        
        ProductDB.delete(p);
    }
}
