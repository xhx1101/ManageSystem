package controller;

import org.omg.CORBA.Request;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName="Servlet3Filter",urlPatterns={"/analyse.jsp","/index.jsp","/modify.jsp","/manage.jsp","/query.jsp","/analyse","/importdata","/match","/modify","/search","/login"})
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest) req;
        String username=(String) request.getSession().getAttribute("username");
        if (username==null&&(!request.getRequestURI().endsWith("/index.jsp"))
                &&(!request.getRequestURI().endsWith("/match"))
                &&(!request.getRequestURI().endsWith("/login"))){
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
