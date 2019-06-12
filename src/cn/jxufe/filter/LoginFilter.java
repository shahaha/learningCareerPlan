package cn.jxufe.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 登陆过滤器
 */
public class LoginFilter extends OncePerRequestFilter{

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // 不拦截的url
        String[] notFilter = new String[] {"/adminLogin","/getGifCode","/login","/login.jsp"};

        // 请求的url
        String url = request.getRequestURI();
        
        boolean doFilter = chek(notFilter, url);
        if (doFilter) {
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("loginUser");
            if (null == obj) {
                // 如果session中不存在登录者实体，则弹出框提示重新登录
                PrintWriter out = response.getWriter();
                String loginPage = request.getContextPath() + "/login.jsp";
                StringBuilder builder = new StringBuilder();
                builder.append("<script type=\"text/javascript\">");
                builder.append("window.top.location.href='");
                builder.append(loginPage);
                builder.append("';");
                builder.append("</script>");
                out.print(builder.toString());
            } else {
                filterChain.doFilter(request, response);
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }

    /**
     * 检查是否拦截
     * @param notFilter 不拦截的url           
     * @param url 请求的url
     * @return false：不拦截  true：拦截
     */
    public boolean chek(String[] notFilter, String url) {
        // 图片、脚本、css、页面不进行拦截
        if (url.endsWith(".css") || url.endsWith(".js") 
            || url.endsWith(".png") || url.endsWith(".jpg")
            || url.endsWith(".gif") || url.endsWith(".jsp")
            || url.endsWith(".ico") || url.endsWith(".html")
            || url.endsWith(".eot") || url.endsWith(".svg")
            || url.endsWith(".ttf") || url.endsWith(".woff")) {
            return false;
        }
        // 含有notFilter中的任何一个则不进行拦截
        for (String s : notFilter) {
            if (url.indexOf(s) != -1) {
                return false;
            }
        }
        return true;
    }
}