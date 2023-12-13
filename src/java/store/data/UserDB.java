
package store.data;

import store.util.DBUtil;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.User;

public class UserDB {
    public static void insert(User u) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.persist(u);
            
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
    
    public static void update(User u) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.merge(u);
            
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
    
    public static void delete(User u) {
        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        trans.begin();

        try {
            em.remove(em.merge(u));
            
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
    
    public static User selectUser(long userId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT u FROM User u " +
                        "WHERE u.userId = :userId";
        
        TypedQuery<User> q = em.createQuery(qString, User.class);
        
        q.setParameter("userId", userId);
        
        User result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (User)result;
    }
    
    public static User selectUser(String email, String password) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT u FROM User u " +
                        "WHERE u.email = :email AND u.password = :password";
        
        TypedQuery<User> q = em.createQuery(qString, User.class);
        
        q.setParameter("email", email);
        q.setParameter("password", password);
        
        User result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (User)result;
    }
    
    public static User selectUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        System.out.println(email);
        
        String qString = "SELECT u FROM User u " +
                        "WHERE u.email = :email";
        
        TypedQuery<User> q = em.createQuery(qString, User.class);
        
        q.setParameter("email", email);
        
        User result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (User)result;
    }
}
