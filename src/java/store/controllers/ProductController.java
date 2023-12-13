package store.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.*;
import java.util.ArrayList;
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
        
        if(requestURI.endsWith("/products/quantity")) {
            getQuantity(request, response);
            
            String url = "/views/products/details.jsp";
            
            getServletContext().getRequestDispatcher(url).forward(request, response);
            
            return;
        }
        
        String rootPath = getServletContext().getContextPath() + "/admin/stored/products";

        response.sendRedirect(rootPath);
    }
    
    // file-wellcome: /loadProducts
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("In do get product");
        String url = "/views/products/show.jsp";
        
        String requestURI = request.getRequestURI();
        String rootPath = getServletContext().getContextPath();
        
        System.out.println(requestURI);
        System.out.println(rootPath + "/api/products/promotion");
        
        if(requestURI.endsWith("/products/show")) {
            url = showProducts(request, response);
        }
        
        if(requestURI.startsWith(rootPath + "/products/details")) {
            url = productDetails(request, response);
        }
        
        if(requestURI.endsWith(rootPath + "/products/details")) {
            url = productDetails(request, response);
        }
        
        // API        
        if(requestURI.endsWith(rootPath + "/api/products")) {
            List<Product> products = ProductDB.selectDistinctProducts();
            
            response.setContentType("application/json");

            Gson gson = new GsonBuilder().create();

            String jsonProducts = gson.toJson(products);

            response.getWriter().write(jsonProducts);
            
            return;
        }
        
        
        if(requestURI.endsWith(rootPath + "/api/products/promotion")) {
            
            List<Product> products = ProductDB.selectProductsOnPromotion();

            response.setContentType("application/json");

            Gson gson = new GsonBuilder().create();

            String jsonProducts = gson.toJson(products);

            response.getWriter().write(jsonProducts);
            
            return;
        }
        
        
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    private String showProducts(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
               
        try {
            List<Product> productsOnPromotion = ProductDB.selectProductsOnPromotion();
        
            List<Long> productsPromotion_id = new ArrayList();
        
            for(Product p : productsOnPromotion) {
                long id = p.getProductId();

                productsPromotion_id.add(id);
            }

            request.setAttribute("productsPromotion_id", productsPromotion_id);
        } catch(Exception ex) {
            System.out.println(ex);
        }
//        
        List<Product> products = ProductDB.selectDistinctProducts();
        
        String page = request.getParameter("page");

        List<Integer> pages = new ArrayList<>();
        
        int count = products.size() / 9;
        
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
    
    private String productDetails(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        String id = request.getParameter("id");
        
        Product product = ProductDB.selectDistinctProducts(Long.parseLong(id));
        
        List<Product> products = ProductDB.selectProducts(Long.parseLong(id));
        
        List<Size> s = SizeDB.selectSizes();
        
        List<Colour> c = ColourDB.selectColors();

        session.setAttribute("product", product);
        
        session.setAttribute("products", products);
        
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
        Product new_p = ProductDB.selectProduct(id, colorId, sizeId);
        
        inventory.setProduct(new_p);
        inventory.setQuantityInStock(quantity);
        
        InventoryDB.insert(inventory);
    }
    
    private void update(HttpServletRequest request, HttpServletResponse response) {
        String idInput = request.getParameter("form-id");
        String name = request.getParameter("form-name");
        String description = request.getParameter("form-desc");
        String priceInput = request.getParameter("form-price");
        String sizeInput = request.getParameter("form-sizeId");
        String colorInput = request.getParameter("form-colorId");
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
        
        Product p = ProductDB.selectProduct(id, colorId, sizeId);
        
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
        HttpSession session = request.getSession();
        
        String productId = request.getParameter("delete-form-productId");
        String colorIdInput = request.getParameter("delete-form-colorId");
        String sizeIdInput = request.getParameter("delete-form-sizeId");
        
        long id = 0;
        int colorId = 0;
        int sizeId = 0;
        
        try {
            id = Long.parseLong(productId);
            colorId = Integer.parseInt(colorIdInput);
            sizeId = Integer.parseInt(sizeIdInput);;
        } catch(NumberFormatException ex) {
            log("Can't not parse in delete form", ex);
        }
        
        Inventory inventory = null;
        
        Product p = null;
        
        try {
            p = ProductDB.selectProduct(id, colorId, sizeId);
        
            inventory = InventoryDB.selectInventory(p);
            
        } catch (Exception ex) {
            System.out.println(ex);
            request.setAttribute("deleteMessage", "Can't get instance when delete !!! :(");
        }
            

        try {
            ProductDB.delete(p);
            
            InventoryDB.delete(inventory);
            request.setAttribute("deleteMessage", "Can't get instance when delete !!! :(");
            
//            session.removeAttribute("deleteMessage");
        } catch (Exception ex) {
            System.out.println(ex);
            
            request.setAttribute("deleteMessage", "Something went wrong when delete !!! :(");
        }
        
        
        
        
    }
    
    private void getQuantity(HttpServletRequest request, HttpServletResponse response) {
        String idInput = request.getParameter("form-add-to-cart-productId");
        String sizeInput = request.getParameter("form-add-to-cart-size");
        String colorInput = request.getParameter("form-add-to-cart-color");
        
        System.out.println(idInput);
        System.out.println(sizeInput);
        System.out.println(colorInput);
        
        long id;
        int sizeId;
        int colorId;
        
        try {
            id = Long.parseLong(idInput);
            sizeId = Integer.parseInt(sizeInput);
            colorId = Integer.parseInt(colorInput);
            
        } catch(NumberFormatException ex) {
            System.out.println("Error: " + ex);
                
            String quantityMessage = "Error 505: when add product to cart";

            request.setAttribute("quantityMessage", quantityMessage);
            
            return;
        }
        
        try {
            Inventory inven = InventoryDB.selectInventory(id, sizeId, colorId);
            
            String globalMessage = "Quantity: " + inven.getQuantityInStock();

            request.setAttribute("globalMessage", globalMessage);
            
            request.setAttribute("sizeId", sizeId);
            
            request.setAttribute("colorId", colorId);
        } catch(Exception ex) {
            System.out.println("Error: " + ex);
            
            String globalMessage = "Quantity: 0";

            request.setAttribute("globalMessage", globalMessage);
            
            request.setAttribute("sizeId", sizeId);
            
            request.setAttribute("colorId", colorId);
        }

    }
}
