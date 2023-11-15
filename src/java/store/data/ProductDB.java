
package store.data;

import store.business.Product;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;


public class ProductDB {
    
    public static void insert(Product p) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(p);
            
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
    
    public static void update(Product p) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.merge(p);
            
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
    
    public static void delete(Product p) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.remove(em.merge(p));
            
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
    
    
    
    public static Product selectProduct(String code) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT p FROM Product p " +
                        "WHERE p.code = :code";
        
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        
        q.setParameter("code", code);
        
        Product result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Product)result;

    }
    
    public static Product selectProduct(long productId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        return em.find(Product.class, productId);
    }
    
    public static List<Product> selectProducts() {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String query = "SELECT p FROM Product p";
        
        TypedQuery<Product> q = em.createQuery(query, Product.class);
        
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
