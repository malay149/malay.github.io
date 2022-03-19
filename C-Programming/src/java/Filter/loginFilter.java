///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author theth
// */
//public class loginFilter implements Filter {
//
//    private static final boolean debug = true;
//
//    private FilterConfig filterConfig = null;
//
//    public loginFilter() {
//    }
//
//    public void doFilter(ServletRequest request, ServletResponse response,
//            FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse =(HttpServletResponse)response;
//        HttpSession session = httpRequest.getSession();
//        String login = (String) session.getAttribute("login");
//        String type = (String) session.getAttribute("type");
//        String homeFolder = (String) session.getAttribute("homeFolder");
//        String Lock = (String) session.getAttribute("Lock");
//        int user_id = (int) session.getAttribute("user_id");
//       if ((login != null) && (type != null) && (homeFolder != null)&& (Lock != null))
//        {
//        chain.doFilter(request, response);
//        }else{
//        httpResponse.sendRedirect("login.jsp");
//        }
//    }
//
//    public void destroy() {
//    }
//
//    public void init(FilterConfig filterConfig) {
//        this.filterConfig = filterConfig;
//
//    }
//
//}
