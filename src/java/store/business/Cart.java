
package store.business;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import store.data.ProductDB;

public class Cart implements Serializable {

    private List<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<LineItem> lineItems) {
        items = lineItems;
    }

    public List<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LineItem item) {
        long id = item.getProduct().getProductId();
        long colorId = item.getProduct().getColor().getColorId();
        long sizeId = item.getProduct().getSize().getSizeId();
        int quantity = item.getQuantity();
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            
            if (lineItem.getProduct().getProductId() == id &&
                lineItem.getProduct().getColor().getColorId() == colorId &&
                lineItem.getProduct().getSize().getSizeId() == sizeId) 
            {
                int currentQuantity = lineItem.getQuantity() + quantity;
                lineItem.setQuantity(currentQuantity);
                return;
            }
        }
        
        items.add(item);
    }
    
    public void updateItem(long productId, int quantity) {
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            
            if (lineItem.getProduct().getProductId() == productId) 
            {
                if(quantity == 0) {
                    items.remove(i);
                    
                    return;
                }
                lineItem.setQuantity(quantity);
                
                return;
            }
        }
    }
    
    public int getCartQuantity() {
        int size = 0;
        
        for(LineItem li : items) {
            size += li.getQuantity();
        }
        return size;
    }
    
    public String getTotalCart() {
        
        List<Product> productsOnPromotion = null;
        List<Long> productsPromotion_id = new ArrayList();
        
        double price = 0;


        try {
            productsOnPromotion = ProductDB.selectProductsOnPromotion();
        } catch(Exception ex) {
            System.out.println(ex);
        }
        
        if(productsOnPromotion != null) {
        
            for(Product p : productsOnPromotion) {
                long id = p.getProductId();

                productsPromotion_id.add(id);
            }
        }
        
        for(LineItem li : items) {
            
            if(productsPromotion_id.contains(li.getProduct().getProductId())) {
                price += li.getQuantity() * li.getProduct().salePrice();
            } else {
                price += li.getQuantity() * li.getProduct().getPrice();
            }
            
        }
        
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        String formattedPrice = decimalFormat.format(price);
        
        return formattedPrice;
    }
    
    public double getTotalCartValue() {
        
        List<Product> productsOnPromotion = ProductDB.selectProductsOnPromotion();
        
        List<Long> productsPromotion_id = new ArrayList();

        if(productsOnPromotion != null) {
        
            for(Product p : productsOnPromotion) {
                long id = p.getProductId();

                productsPromotion_id.add(id);
            }
        }
        
        
        double price = 0;
        
        for(LineItem li : items) {
            
            if(productsPromotion_id.contains(li.getProduct().getProductId())) {
                price += li.getQuantity() * li.getProduct().salePrice();
            } else {
                price += li.getQuantity() * li.getProduct().getPrice();
            }
            
        }
        
        return price;
    }
}
