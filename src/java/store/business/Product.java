package store.business;

import java.text.DecimalFormat;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import store.data.CategoryDB;
import store.data.InventoryDB;
import store.data.PromotionDB;


@Entity
public class Product implements Serializable {
    
    @Id
    private Long productId;
    
    @Id
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="SIZEID")
    private Size size;
    
    @Id
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="COLORID")
    private Colour color;

    @OneToMany
    private List<Category> category;
    private String name;
    private String imageUrl;
    private String description;
    private double price;
    private String slug;
    
    public Product() {}
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public List<Category> getCategory() {
        return category;
    }

    public void setCategory(List<Category> category) {
        this.category = category;
    }
    
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }
    
    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }
    
    public Colour getColor() {
        return color;
    }

    public void setColor(Colour color) {
        this.color = color;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }
    
//    public Category getCategory() {
//        Category category = null;
//        
//        try {
//            category = CategoryDB.selectOwnCategoryById(productId);
//        } catch(Exception ex) {
//            System.out.println(ex);
//        }
//        
//        
//        return category;
//    }
    
    public int getQuantity() {
        int quantity = 0;
        
        Inventory inventory = InventoryDB.selectInventory(this);
        
        quantity = inventory.getQuantityInStock();
        
        return quantity;
    }
    
    public double salePrice() {
        
        Double p = PromotionDB.selectByProductId(productId);
        
        return price - price * p;
    }
    
    public String formattedPrice() {
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        String formattedPrice = decimalFormat.format(price);
        
        return formattedPrice;
    }
    
    public String formattedPrice(double salePrice) {
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        String formattedPrice = decimalFormat.format(salePrice);
        
        return formattedPrice;
    }
}
