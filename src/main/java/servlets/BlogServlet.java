package servlets;

import props.Blog;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogServlet",value = "/blog-insert")
public class BlogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String title = req.getParameter("title");
        String detail = req.getParameter("detail");

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setDetail(detail);

        int aid = (int) req.getSession().getAttribute("aid");
        DBUtil util = new DBUtil();

        int status = util.blogInsert(blog,aid);
        if (status > 0) {
            resp.sendRedirect(Util.base_url + "adminPanel.jsp");
        } else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu!";
            }
            if (status == -1) {
                errorMessage = "Bu ürün başlığı daha önce kullanılmış";
            }
            req.setAttribute("insertError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminPanel.jsp");
            dispatcher.forward(req, resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bid = req.getParameter("bid");
        String ipAddress = req.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = req.getRemoteAddr();
        }
        try {

        int cbid = Integer.parseInt(bid);

         int aid=(int)req.getSession().getAttribute("aid");
        DBUtil util = new DBUtil();
          if(util.isBlogValid(cbid,aid)){
        int status = util.blogDelete(cbid);
        if (status > 0) {
        }
            }
        } catch (NumberFormatException e) {
            System.err.println("Delete item Error : " + ipAddress + " Error " + e);
        }
        resp.sendRedirect(Util.base_url + "adminPanel.jsp");

    }
}

