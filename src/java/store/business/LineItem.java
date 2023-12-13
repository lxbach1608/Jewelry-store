
package store.business;

import java.io.Serializable;
import java.text.DecimalFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class LineItem implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long lineItemId;
    
    private int quantity = 1;
    
    private double subTotal;
    
    @OneToOne
    private Product product;

    public double getSubTotal() {
        return product.getPrice() * quantity;
    }
    
    public double getSubTotalSale(double salePrice) {
        return salePrice * quantity;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public Long getLineItemId() {
        return lineItemId;
    }

    public void setLineItemId(Long lineItemId) {
        this.lineItemId = lineItemId;
    }
    
    public String formattedSubtotal(double price) {
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        String formattedPrice = decimalFormat.format(price);
        
        return formattedPrice;
    }
}
