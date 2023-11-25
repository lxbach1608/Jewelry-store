package store.controllers;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import store.business.Category;
import store.business.Colour;

import store.data.ProductDB;
import store.business.Product;
import store.business.Size;
import store.data.ColourDB;
import store.data.SizeDB;

public class ProductController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("in do post product controller");
        
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/products/create")) {
            create(request, response);
        }
        
        if(requestURI.endsWith("/products/update")) {
//            create(request, response);
        }
        
        if(requestURI.endsWith("/products/delete")) {
            delete(request, response);
        }
        

        String rootPath = getServletContext().getContextPath();
        String url = "/admin/stored/products";

        response.sendRedirect(rootPath + url);

    }
    
    // file-wellcome: /loadProducts
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("in do get Product");
        
        String url = "/views/products/shopShow.jsp";
        
        String requestURI = request.getRequestURI();
        
        String rootPath = getServletContext().getContextPath();
        
        System.out.println(requestURI);
        
        if(requestURI.endsWith("/products/show")) {
            url = shopShow(request, response);
        }
        
        if(requestURI.endsWith(rootPath + "/products/details")) {
            url = productDetails(request, response);
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String shopShow(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        List<Product> products = ProductDB.selectProducts();

        session.setAttribute("products", products);
        
        return "/views/products/show.jsp";
    }
    
    private String productDetails(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        List<Product> products = ProductDB.selectProducts();

        session.setAttribute("products", products);
        
        return "/views/products/details.jsp";
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
        
        double price = 0;
        double salePrice = 0;
        int sizeId = 0;
        int colorId = 0;
         
        try {
            price = Double.parseDouble(priceInput);
            salePrice = Double.parseDouble(salePriceInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
        } catch(NumberFormatException ex) {
            System.out.println(ex);
        }
        
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
         
        System.out.println("productId " + productId);
         
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        
        System.out.println("product: " + p);

        ProductDB.delete(p);
    }
}
