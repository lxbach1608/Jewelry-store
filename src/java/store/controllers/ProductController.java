package store.controllers;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import store.business.Category;
import store.business.Colour;
import store.business.Inventory;

import store.data.ProductDB;
import store.business.Product;
import store.business.Size;
import store.data.ColourDB;
import store.data.InventoryDB;
import store.data.SizeDB;

import store.util.randomUtil;

public class ProductController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/products/create")) {
            create(request, response);
        }
        
        if(requestURI.endsWith("/products/update")) {
            update(request, response);
        }
        
        if(requestURI.endsWith("/products/delete")) {
            delete(request, response);
        }
        
        String rootPath = getServletContext().getContextPath() + "/admin/stored/products";

        response.sendRedirect(rootPath);
    }
    
    // file-wellcome: /loadProducts
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String url = "/views/products/shopShow.jsp";
        
        String requestURI = request.getRequestURI();
        
        String rootPath = getServletContext().getContextPath();
        
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
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        String imageUrl = request.getParameter("imageUrl");
        String quantityInput = request.getParameter("quantity");
        String slug = request.getParameter("slug");
        String[] selectedCategoriesInput = request.getParameterValues("categories");
        
        double price = 0;
        int sizeId = 0;
        int colorId = 0;
        int quantity = 0;
         
        try {
            price = Double.parseDouble(priceInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantity = Integer.parseInt(quantityInput);
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
        
        Long id = randomUtil.randomId();
        p.setProductId(id);
        p.setName(name);
        p.setDescription(description);
        p.setColor(colorInstance);
        p.setSize(sizeInstance);
        p.setImageUrl(imageUrl);
        p.setPrice(price);
        p.setSlug(slug);
        p.setCategory(selectedCategories);
        
        ProductDB.insert(p);
        
        Inventory inventory = new Inventory();
        Product new_p = ProductDB.selectProduct(id);
        
        inventory.setProduct(new_p);
        inventory.setQuantityInStock(quantity);
        
        InventoryDB.insert(inventory);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) {
        String idInput = request.getParameter("productId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceInput = request.getParameter("price");
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        String imageUrl = request.getParameter("imageUrl");
        String quantityInStockInput = request.getParameter("quantityInStock");
        String slug = request.getParameter("slug");
        String[] selectedCategoriesInput = request.getParameterValues("categories");
        
        double price = 0;
        int sizeId = 0;
        int colorId = 0;
        int quantityInStock = 0;
        int id = 0;
         
        try {
            price = Double.parseDouble(priceInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantityInStock = Integer.parseInt(quantityInStockInput);
            id = Integer.parseInt(idInput);
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
        p.setDescription(description);
        p.setColor(colorInstance);
        p.setSize(sizeInstance);
        p.setImageUrl(imageUrl);
        p.setPrice(price);
        p.setSlug(slug);
        p.setCategory(selectedCategories);
        
        ProductDB.insert(p);
        
        Inventory i = new Inventory();
        i.setQuantityInStock(quantityInStock);
        i.setProduct(p);
        
        ProductDB.update(p);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("delete-form-productId");
         
        System.out.println("productId " + productId);
         
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        
        System.out.println("product: " + p);

        ProductDB.delete(p);
    }
}
