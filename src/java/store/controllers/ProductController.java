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
        String url = "/views/products/show.jsp";
        
        
        String requestURI = request.getRequestURI();
        
        String rootPath = getServletContext().getContextPath();
        
        if(requestURI.endsWith("/products/show")) {
            url = shopShow(request, response);
        }
        
        if(requestURI.startsWith(rootPath + "/products/details")) {
            url = productDetails(request, response);
        }
        
        if(requestURI.endsWith(rootPath + "/products/details")) {
            url = productDetails(request, response);
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String shopShow(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        List<Product> products = ProductDB.selectDistinctProducts();
        
        session.setAttribute("products", products);
        
        return "/views/products/show.jsp";
    }
    
    private String productDetails(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        String id = request.getParameter("id");
        
        Product p = ProductDB.selectProduct(Long.parseLong(id));
        
        List<Size> s = SizeDB.selectSizes();
        
        List<Colour> c = ColourDB.selectColors();

        session.setAttribute("product", p);
        
        session.setAttribute("sizes", s);
        
        session.setAttribute("colors", c);
        
        return "/views/products/details.jsp";
    }
    
    private void create(HttpServletRequest request, HttpServletResponse response) {
        String idInput = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceInput = request.getParameter("price");
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        String imageUrl = request.getParameter("imageUrl");
        String quantityInput = request.getParameter("quantity");
        String slug = request.getParameter("slug");
        String[] selectedCategoriesInput = request.getParameterValues("categories");

        long id = 0;
        double price = 0;
        int sizeId = 0;
        int colorId = 0;
        int quantity = 0;
       
        try {
            id = Long.parseLong(idInput);
            price = Double.parseDouble(priceInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantity = Integer.parseInt(quantityInput);
        } catch(NumberFormatException ex) {
            System.out.println("can't parse");
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
        String idInput = request.getParameter("form-id");
        String name = request.getParameter("form-name");
        String description = request.getParameter("form-desc");
        String priceInput = request.getParameter("form-price");
        String sizeInput = request.getParameter("size");
        String colorInput = request.getParameter("color");
        String imageUrl = request.getParameter("form-imgUrl");
        String quantityInput = request.getParameter("form-quantity");
        String slug = request.getParameter("form-slug");
        String[] selectedCategoriesInput = request.getParameterValues("form-categories");
        
        long id = 0;
        double price = 0;
        int sizeId = 0;
        int colorId = 0;
        int quantity = 0;
         
        try {
            id = Long.parseLong(idInput);
            price = Double.parseDouble(priceInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            quantity = Integer.parseInt(quantityInput);
        } catch(NumberFormatException ex) {
            System.out.println("parse null");
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
        
        Product p = ProductDB.selectProduct(id);
        
        Inventory inventory = InventoryDB.selectInventory(p);        
        
        p.setName(name);
        p.setDescription(description);
//        p.setColor(colorInstance);
//        p.setSize(sizeInstance);
        p.setImageUrl(imageUrl);
        p.setPrice(price);
        p.setSlug(slug);
        p.setCategory(selectedCategories);

        inventory.setQuantityInStock(quantity);
        
        InventoryDB.update(inventory);
        ProductDB.update(p);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("delete-form-productId");
        
        long id = Long.parseLong(productId);
        
        Product p = ProductDB.selectProduct(id);
        
        Inventory inventory = InventoryDB.selectInventory(p);
        
        InventoryDB.delete(inventory);
        
        ProductDB.delete(p);
    }
}
