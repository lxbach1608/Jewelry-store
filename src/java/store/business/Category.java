package store.business;

import java.io.Serializable;
import store.data.CategoryDB;

import java.util.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Category implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long categoryId;
    
    @ManyToOne
    private Promotion promotion;        

    private Long parentId;

    private String name;

    public Category() {}

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
    
    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
    
    public List<Category> getParents() {
        return CategoryDB.selectChildren(this.categoryId);
    }

    public List<Category> getChildren() {
        return CategoryDB.selectChildren(this.categoryId);
    }
    
   public List<Product> getProducts() {
       return CategoryDB.selectProducts(this.categoryId);
   }
}
