/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package store.data;

import store.business.Colour;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class ColourDB {
    public static Colour selectColor(String color) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT c FROM Colour c " +
                        "WHERE c.color = :color";
        
        TypedQuery<Colour> q = em.createQuery(qString, Colour.class);
        
        q.setParameter("color", color);
        
        Colour result = null;
        
        try {
            result = q.getSingleResult();
            
        } catch (NoResultException ex) {
            return null;
            
        } finally {
            em.close();
            
        }
        
        return (Colour)result;
    }
}
