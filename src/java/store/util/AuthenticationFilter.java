package store.util;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.business.User;

/**
 *
 * @author bale
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/admin/*","/site/checkout", "/customers/dashboard"})
public class AuthenticationFilter implements Filter {
    
    @Override
    public void destroy() {
        
    }

    @Override
    public void init(FilterConfig filterConfig) {        
        System.out.println("init in filter: ");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
                
        HttpSession session = req.getSession();
        
        String requestURI = req.getRequestURI();
        
        if(requestURI.startsWith("/JewelryStore/admin/")) {
            User user = (User) session.getAttribute("user");
            
            if(!"admin".equals(user.getRole().getRole())) {
                res.sendRedirect(req.getContextPath() + "/");
                
                return;
            }
        }
        
        User user = (User)session.getAttribute("user");
        
        System.out.println(user);
        
        if(user == null) {
            res.sendRedirect(req.getContextPath() + "/user/login");
            
            return;
        }
        

        chain.doFilter(request, response);
    }
    
}
