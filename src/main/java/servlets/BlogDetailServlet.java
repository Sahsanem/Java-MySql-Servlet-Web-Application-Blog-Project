package servlets;

import props.Blog;
import utils.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "blogDetailServlet", value = "/blog-detailservlet")
public class BlogDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bidx=Integer.parseInt(req.getParameter("bid"));
        req.getSession().setAttribute("updateBid",bidx);

        DBUtil util=new DBUtil();
        Blog blog=util.SingleBlog(bidx);

        req.setAttribute("blog",blog);
        RequestDispatcher dispatcher= getServletContext().getRequestDispatcher("/blogDetail.jsp");
        dispatcher.forward(req,resp);
    }


}
