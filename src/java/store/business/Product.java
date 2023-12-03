package store.business;

import java.text.DecimalFormat;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import store.data.InventoryDB;


@Entity
public class Product implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long productId;
    
    @ManyToOne
    @JoinColumn(name="SIZEID")
    private Size size;
    
    @ManyToOne
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
    
    public int getQuantity() {
        int quantity = 0;
        
        Inventory inventory = InventoryDB.selectInventory(this);
        
        System.out.println(inventory.getInventoryId());
        quantity = inventory.getQuantityInStock();
        
        return quantity;
    }
    
    public String formattedPrice(double price) {
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        String formattedPrice = "$" + decimalFormat.format(price);
        
        return formattedPrice;
    }
}
