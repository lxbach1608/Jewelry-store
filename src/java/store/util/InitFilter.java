package store.util;

import java.io.IOException;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import store.business.Cart;
import store.business.Category;
import store.data.CategoryDB;


@WebFilter(urlPatterns = {"/*"})
public class InitFilter implements Filter {
    
    @Override
    public void destroy() {
        
    }

    @Override
    public void init(FilterConfig filterConfig) {     
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
                
        HttpSession session = req.getSession();
        
        List<Category> parentCategories = (List<Category>) session.getAttribute("parentCategories");
        Cart cart = (Cart) session.getAttribute("cart");
        
        // Initial cart if null
        if(cart == null) {
            cart = new Cart();

            session.setAttribute("cart", cart);
        }
        
        // Initial categories if null
        if(parentCategories == null) {
            try {
                parentCategories = CategoryDB.selectParents();
                
                session.setAttribute("parentCategories", parentCategories);
            } catch(Exception ex) {
                System.out.println("Error filter: " + ex);
            }
        }

        chain.doFilter(request, response);
    }

}
