
package store.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.Status;

public class StatusDB {
    public static void insert(Status s) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(s);
            
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
    
    public static void update(Status s) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.merge(s);
            
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
    
    public static void delete(Status s) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.remove(em.merge(s));
            
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
    
    public static Status selectStatus(long statusId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT s FROM Status s " +
                        "WHERE s.statusId = :statusId";
        
        TypedQuery<Status> q = em.createQuery(qString, Status.class);
        
        q.setParameter("statusId", statusId);
        
        Status result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Status)result;
    }
}
