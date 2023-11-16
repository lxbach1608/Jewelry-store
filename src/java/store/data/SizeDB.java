/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.data;

import java.util.List;
import store.business.Size;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import store.business.Product;

public class SizeDB {
    
    public static List<Size> selectSizes() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();

       String query = "SELECT s FROM Size s";

       TypedQuery<Size> q = em.createQuery(query, Size.class);

       List<Size> sizes;

       try {
           sizes = q.getResultList();

           if(sizes == null || sizes.isEmpty())
           { 
               sizes = null;
           }
       }
       finally {
           em.close();
       }

       return sizes;
    }
    
//    public static Size selectSize(double size) {
//        EntityManager em = DBUtil.getEmFactory().createEntityManager();
//        
//        System.out.println(size);
//        
//        String qString = "SELECT s FROM Size s " +
//                        "WHERE s.size = :size";
//        
//        TypedQuery<Size> q = em.createQuery(qString, Size.class);
//        
//        q.setParameter("size", size);
//        
//        Size result = null;
//        
//        try {
//            result = q.getSingleResult();
//            
//        } catch (NoResultException ex) {
//            return null;
//            
//        } finally {
//            em.close();
//            
//        }
//        
//        return (Size)result;
//    }
    
    public static Size selectSize(int sizeId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT s FROM Size s " +
                        "WHERE s.sizeId = :sizeId";
        
        TypedQuery<Size> q = em.createQuery(qString, Size.class);
        
        q.setParameter("sizeId", sizeId);
        
        Size result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Size)result;
    }
}
