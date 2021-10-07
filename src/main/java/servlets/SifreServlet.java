package servlets;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "sifreServlet",value = "/sifre-servlet")
public class SifreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(Util.base_url+"sifreDegistirme.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        int aid = (int)req.getSession().getAttribute("aid");

        DBUtil util=new DBUtil();
        int status=util.SifreDegistirme(email,password,aid);

        if(status>0){
            resp.sendRedirect(Util.base_url+"sifreDegistirme.jsp");
        }else{
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/sifreDegistirme.jsp");
            dispatcher.forward(req,resp);
        }
    }
}

