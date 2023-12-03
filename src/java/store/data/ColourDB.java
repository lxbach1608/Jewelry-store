
package store.data;

import java.util.List;
import store.business.Colour;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class ColourDB {
    public static List<Colour> selectColors() {
       EntityManager em = DBUtil.getEmFactory().createEntityManager();

       String query = "SELECT c FROM Colour c";

       TypedQuery<Colour> q = em.createQuery(query, Colour.class);

       List<Colour> colors;

       try {
           colors = q.getResultList();

           if(colors == null || colors.isEmpty())
           { 
               colors = null;
           }
       }
       finally {
           em.close();
       }

       return colors;
    }
    
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
    
    public static Colour selectColor(int colorId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        String qString = "SELECT c FROM Colour c " +
                        "WHERE c.colorId = :colorId";
        
        TypedQuery<Colour> q = em.createQuery(qString, Colour.class);
        
        q.setParameter("colorId", colorId);
        
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
