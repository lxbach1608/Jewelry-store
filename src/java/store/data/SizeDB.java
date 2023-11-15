/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.data;

import store.business.Size;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class SizeDB {
    public static Size selectSize(double size) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        System.out.println(size);
        
        String qString = "SELECT s FROM Size s " +
                        "WHERE s.size = :size";
        
        TypedQuery<Size> q = em.createQuery(qString, Size.class);
        
        q.setParameter("size", size);
        
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
    
    public static Size selectSize(int size) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        System.out.println("int size");
        System.out.println(size);
        
        String qString = "SELECT s FROM Size s " +
                        "WHERE s.size = :size";
        
        TypedQuery<Size> q = em.createQuery(qString, Size.class);
        
        q.setParameter("size", size);
        
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
