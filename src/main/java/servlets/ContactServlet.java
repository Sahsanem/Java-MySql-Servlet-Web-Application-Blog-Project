package servlets;

import props.Blog;
import props.Contact;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "contactServlet",value = "/contact-servlet")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message=req.getParameter("message");

        Contact contact=new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setMessage(message);


        DBUtil util = new DBUtil();
        int status = util.contactInsert(contact);
        if (status > 0) {
            resp.sendRedirect(Util.base_url+"index.jsp");
        } else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu!";
            }
            req.setAttribute("insertError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(req, resp);

        }
    }
}
