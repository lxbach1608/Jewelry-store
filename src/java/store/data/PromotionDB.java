/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.data;

import store.util.DBUtil;
import java.util.List;
import store.business.Promotion;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.Category;

public class PromotionDB {
 
    public static List<Promotion> selectPromotions() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String query = "SELECT p FROM Promotion p ";
        
        TypedQuery<Promotion> q = em.createQuery(query, Promotion.class);
        
        List<Promotion> promotions;
        
        try {
            promotions = q.getResultList();
            
            if(promotions == null || promotions.isEmpty())
            { 
                promotions = null;
            }
        }
        finally {
            em.close();
        }
        
        return promotions;
    }
    
    public static void insert(Promotion p) {
        
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
    
    public static Double selectByProductId(long productId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT promo.discountRate FROM Product p " +
                    "JOIN p.category c " +
                    "JOIN c.promotion promo " +
                    "WHERE p.productId = :productId GROUP BY p.productId";
        
        TypedQuery<Double> q = em.createQuery(qString, Double.class);
        
        q.setParameter("productId", productId);
        
        Double result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Double)result;
    }
}
