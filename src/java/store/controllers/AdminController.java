package store.controllers;


import store.business.Promotion;
import java.io.*;
import java.text.ParseException;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import store.business.Category;
import store.business.Colour;

import store.business.Product;
import store.business.Size;
import store.data.CategoryDB;
import store.data.ColourDB;
import store.data.ProductDB;
import store.data.PromotionDB;
import store.data.SizeDB;


public class AdminController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        System.out.println("in do post admin");
        
        String requestURI = request.getRequestURI();
        
        System.out.println(requestURI);
        
        System.out.println("------------- end do post admin ------------");
//        
//        String url = "/index.jsp";
//        
//        String requestURI = request.getRequestURI();
//        
//        if(requestURI.endsWith("/admin/displayAdminPage")) {
//            url = displayAdminPage(request, response);
//        }
//        
//        if(requestURI.endsWith("displayProduct")) {
//            url = displayProduct(request, response);
//        }
//        
//        // Product
//        if(requestURI.contains("/admin/product")) {
//            if(requestURI.endsWith("/admin/product/create")) {
//                url = insertProduct(request, response);
//            }
//            if(requestURI.endsWith("/admin/product/update")) {
//                url = updateProduct(request, response);
//            }
//            if(requestURI.endsWith("/admin/product/delete")) {
//                url = deleteProduct(request, response);
//            }
//        }
//        
//        // Category
//        if(requestURI.contains("/admin/category")) {
//            if(requestURI.endsWith("/admin/category/parent/create")) {
//                url = insertParentCategory(request, response);
//            }
//            if(requestURI.endsWith("/admin/category/child/create")) {
//                url = insertChildCategory(request, response);
//            }
//        }
//        
//        // Promotion
//        if(requestURI.contains("/admin/promotion")) {
//            if(requestURI.endsWith("/admin/promotion/create")) {
//                url = insertPromotion(request, response);
//            }
//        }
//
//        if(requestURI.endsWith("/")) {
//            url = "/index.jsp";
//        }
//        
//        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    // [GET] /admin/show
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
        throws ServletException, IOException {
        System.out.println("in do get Admin");
        
        // initial default url if the request doesn't match any route (particular url)
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
    
    //Product
    
    
    private String insertProduct(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String priceInput = request.getParameter("price");
        String imgUrl = request.getParameter("imgUrl");
        String slug = request.getParameter("slug");
        String[] selectedCategory = request.getParameterValues("childCheckbox");
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        
        double price = Double.parseDouble(priceInput);
        double sizeValue = Double.parseDouble(sizeInput);

        
        Size size = null;
        Colour color = null;

        
        List<Category> listSelectedCategory = new ArrayList<Category>();

        try
        {
            for(String value : selectedCategory)
            {
                long id = Long.parseLong(value);
                
                Category c = CategoryDB.selectCategory(id);
                
                listSelectedCategory.add(c);
            }
        }
        catch(NullPointerException ex)
        {
            System.out.println(ex);
        }


        try {
            size = sizeInput.endsWith(".0") ? SizeDB.selectSize((int)sizeValue) : SizeDB.selectSize(sizeValue);
        } catch(Exception e) {
            System.out.println("Error in get Size instant");
        }
        
        try {
            color = ColourDB.selectColor(colorInput);
        } catch(Exception e) {
            System.out.println("Error in get Colour instant");
        }

        Product p = new Product();
        p.setName(name);
        p.setDesciption(desc);
        p.setPrice(price);
        p.setImageUrl(imgUrl);
        p.setSlug(slug);
        p.setColor(color);
        p.setSize(size);
        p.setCategory(listSelectedCategory);
        
        ProductDB.insert(p);
        
//        displayProduct(request, response);
        
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    private String updateProduct(HttpServletRequest request, HttpServletResponse response) {
        
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
        
//        displayProduct(request, response);
        
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    private String deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        
        String productId = request.getParameter("productId");
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        
        ProductDB.delete(p);
        
//        displayProduct(request, response);
        
        String url = "/views/admin/index.jsp";
            
        return url;
    }
    
    // Category
    
    
    private String displayChildCategory(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        List<Category> children = CategoryDB.selectCategories();
        
        if(children == null) {
            System.out.println("null children");
        } else {
//            children = ListUtil.refactoryList(children);

        }
        
        session.setAttribute("children", children);
        
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    private String insertParentCategory(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        
        Category c = new Category();
        c.setName(name);
        
        CategoryDB.insert(c);
        
//        displayParentCategory(request, response);
                
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    private String insertChildCategory(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        
        String[] parents = request.getParameterValues("parentCheckbox");
        
        if(parents == null) System.out.println("Null in insertChildCategory");
        else {
            for(String parentId : parents)
            {
                Category c = new Category();
                c.setName(name);
                c.setParentId(Long.parseLong(parentId));
                
                CategoryDB.insert(c);
            }
        }
        
        displayChildCategory(request, response);
        
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    // Promotion
    
    
    private String insertPromotion(HttpServletRequest request, HttpServletResponse response) {
        
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String discoutRate = request.getParameter("discoutRate");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        double discount = Double.parseDouble(discoutRate);
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        
        Promotion p = new Promotion();

        p.setName(name);
        p.setDescription(desc);
        p.setDiscountRate(discount);
        try 
        {
            p.setStartDate(dateFormat.parse(startDate));
            p.setEndDate(dateFormat.parse(endDate));
        }
        catch(ParseException ex)
        {
            System.out.println(ex);
        }
        
        PromotionDB.insert(p);
        
//        displayPromotion(request, response);
        
        String url = "/views/admin/index.jsp";
        
        return url;
    }
    
    //
    
    
    private String storedProducts(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        List<Product> products = ProductDB.selectProducts();

        session.setAttribute("products", products);
        
        return "/views/admin/stored-products.jsp";
    }
    
    private String storedCategories(HttpServletRequest request, HttpServletResponse response){
        
        HttpSession session = request.getSession();
        
        List<Category> categories = CategoryDB.selectCategories();
        
        session.setAttribute("categories", categories);
        
        return "/views/admin/stored-categories.jsp";
    }
    
    private String storedPromotions(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        List<Promotion> promotions = PromotionDB.selectPromotions();
        
        session.setAttribute("promotions", promotions);
        
        
        return "/views/admin/stored-promotions.jsp";
    }
    
    private String storedOrders(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        return "/views/admin/stored-orders.jsp";
    }
    
    private String storedUsers(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        return "/views/admin/stored-users.jsp";
    }
}
