
package store.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.Invoice;


public class InvoiceDB {
    public static void insert(Invoice o) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(o);
            
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
    
    public static void update(Invoice o) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.merge(o);
            
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
    
    public static void delete(Invoice o) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.remove(em.merge(o));
            
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
    
    public static List<Invoice> selectInvoices() {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String query = "SELECT i FROM Invoice i";
        
        TypedQuery<Invoice> q = em.createQuery(query, Invoice.class);
        
        List<Invoice> invoices;
        
        try {
            invoices = q.getResultList();
            
            if(invoices == null || invoices.isEmpty())
            { 
                invoices = null;
            }
        }
        finally {
            em.close();
        }
        
        return invoices;
    }
    
    public static List<Invoice> selectInvoiceByUserId(long userId) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT i FROM Invoice i " +
                        "WHERE i.user.userId = :userId";
        
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        
        q.setParameter("userId", userId);
        
        List<Invoice> invoices;
        
        try {
            invoices = q.getResultList();
            
            if(invoices == null || invoices.isEmpty())
            { 
                invoices = null;
            }
        }
        finally {
            em.close();
        }
        
        return invoices;
    }
    
    public static Invoice selectInvoice(long orderId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT o FROM Order o " +
                        "WHERE o.orderId = :orderId";
        
        TypedQuery<Invoice> q = em.createQuery(qString, Invoice.class);
        
        q.setParameter("orderId", 1);
        
        Invoice result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Invoice)result;
    }
}
