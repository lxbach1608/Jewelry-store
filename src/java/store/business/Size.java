package store.business;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Size implements Serializable {
    
    @Id
    private Long sizeId;
    
    private double size;

    public Long getSizeId() {
        return sizeId;
    }

    public void setSizeId(Long sizeId) {
        this.sizeId = sizeId;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }
    
    
    public Size() {}

 
    
}
