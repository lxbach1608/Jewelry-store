/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.data;

import java.util.List;
import store.business.Promotion;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class PromotionDB {
 
    public static List<Promotion> selectPromotions() {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        
//        String query = "SELECT p FROM Promotion p ";
//        
//        TypedQuery<Promotion> q = em.createQuery(query, Promotion.class);
//        
//        List<Promotion> categories;
//        
//        try {
//            categories = q.getResultList();
//            
//            if(categories == null || categories.isEmpty())
//            { 
//                categories = null;
//            }
//        }
//        finally {
//            em.close();
//        }
//        
//        return categories;
        return null;
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
}
