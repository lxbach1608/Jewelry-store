
package store.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.Inventory;
import store.business.Product;


public class InventoryDB {
    public static void insert(Inventory i) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(i);
            
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
    
    public static void update(Inventory i) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.merge(i);
            
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
    
    public static void delete(Inventory in) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.remove(em.merge(in));
            
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
    
    public static List<Inventory> selectInventories() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

       String query = "SELECT i FROM Inventory i";

       TypedQuery<Inventory> q = em.createQuery(query, Inventory.class);

       List<Inventory> inventories;

       try {
           inventories = q.getResultList();

           if(inventories == null || inventories.isEmpty())
           { 
               inventories = null;
           }
       }
       finally {
           em.close();
       }

       return inventories;
    }

    public static Inventory selectInventory(Product product) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT c FROM Inventory c WHERE c.product = :product";
        
        TypedQuery<Inventory> q = em.createQuery(qString, Inventory.class);
        
        q.setParameter("product", product);
        
        Inventory result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Inventory)result;
    }
    
    public static Inventory selectInventory(long productId, long sizeId, long colorId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT i FROM Inventory i " +
                 "WHERE i.product.productId = :productId " +
                 "AND i.product.color.colorId = :colorId " +
                 "AND i.product.size.sizeId = :sizeId";
        
        TypedQuery<Inventory> q = em.createQuery(qString, Inventory.class);
        
        q.setParameter("productId", productId);
         q.setParameter("sizeId", sizeId);
          q.setParameter("colorId", colorId);
        
        Inventory result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Inventory)result;
    }
}
