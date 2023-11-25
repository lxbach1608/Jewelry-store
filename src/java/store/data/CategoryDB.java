
package store.data;

import java.util.List;
import store.business.Category;
import store.business.Product;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class CategoryDB {
    
    public static void insert(Category c) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(c);
            
            trans.commit();
        }
        catch(Exception ex) {
            System.out.println(ex);
            
            trans.rollback();
        }
        finally {
            em.close();
        }
    }
    
    public static List<Category> selectChildren(long parentId) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String query = "SELECT c FROM Category c " + 
                        "WHERE c.parentId = :id";
        
        TypedQuery<Category> q = em.createQuery(query, Category.class);
        
        q.setParameter("id", parentId);
        
        List<Category> categories;
        
        try {
            categories = q.getResultList();
            
            if(categories == null || categories.isEmpty())
            { 
                categories = null;
            }
        }
        finally {
            em.close();
        }
        
        return categories;
    }
    
    public static List<Category> selectCategories() {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String query = "SELECT c FROM Category c ";
        
        TypedQuery<Category> q = em.createQuery(query, Category.class);
        
        List<Category> categories;
        
        try {
            categories = q.getResultList();
            
            if(categories == null || categories.isEmpty())
            { 
                categories = null;
            }
        }
        finally {
            em.close();
        }
        
        return categories;
    }
    
    public static Category selectCategory(long id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT c FROM Category c " +
                        "WHERE c.categoryId = :id";
        
        TypedQuery<Category> q = em.createQuery(qString, Category.class);
        
        q.setParameter("id", id);
        
        Category result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Category)result;
    }

    public static List<Product> selectProducts(long categoryId) {
        System.out.println("in selectProducts");
        System.out.println(categoryId);
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

        String query = "SELECT p FROM Product p JOIN p.category c WHERE c.categoryId = :id";

        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        
        q.setParameter("id", categoryId);
        
        List<Product> products;
        
        try {
            products = q.getResultList();
            
            if(products == null || products.isEmpty())
            { 
                products = null;
            }
        }
        finally {
            em.close();
        }
        
        return products;
    }
}
