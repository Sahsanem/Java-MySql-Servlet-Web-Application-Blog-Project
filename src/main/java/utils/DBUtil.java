package utils;

import props.Blog;
import props.Contact;
import utils.DB;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {
    public boolean login( String email, String password,String remember, HttpServletRequest req, HttpServletResponse resp){
        boolean status=false;
        DB db=new DB();
        try{
            String sql="select * from admin where email= ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2,Util.MD5(password));
            ResultSet rs=pre.executeQuery();
            status=rs.next();

            if ( status ) {
                // session create
                int aid = rs.getInt("aid");
                String name = rs.getString("ad");

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("ad", name);

                if ( remember != null && remember.equals("on")) {
                    name = name.replaceAll(" ", "_");
                    String val = aid+"_"+name;
                    Cookie cookie = new Cookie("user", val);
                    cookie.setMaxAge( 60*60 );
                    resp.addCookie(cookie);
                }
            }
        }catch (Exception e){
            System.err.println("loginError"+e);
        }finally {
            db.close();
        }
        return status;

    }

    public int blogInsert(Blog blog, int aid){
        int status=0;
        DB db=new DB();

        try{
            String sql="insert into blog values( null, ?, ?, now(),?)";
            PreparedStatement pre=db.conn.prepareStatement(sql);
            pre.setString(1,blog.getTitle());
            pre.setString(2,blog.getDetail());
            pre.setInt(3,aid);
            status=pre.executeUpdate();
        }catch (Exception e){
            System.err.println("BlogInsertError"+e);
        }finally {
            db.close();
        }
        return status;
    }

    public List<Blog> allBlogMain() {
        List<Blog> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blog";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet res = pre.executeQuery();
            while ( res.next() ) {
                int bid = res.getInt("bid");
                String title = res.getString("title");
                String detail = res.getString("detail");
                Date date = res.getDate("date");

                Blog blog=new Blog(bid,title,detail,date);
                ls.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
        return ls;
    }

    public List<Blog> allBlog(int aid) {
        List<Blog> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from blog where aid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ) {
                int bid = rs.getInt("bid");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");

                Blog blog=new Blog(bid,title,detail,date);
                ls.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
        return ls;
    }

    public int blogDelete( int bid ) {
        int status = 0;
        DB db = new DB();
        try {
            String sql = "delete from blog where bid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1, bid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("blogDelete Error :  " + e);
        } finally {
            db.close();
        }
        return status;
    }

    public boolean isBlogValid(int cbid,int aid){
        boolean status=false;
        DB db=new DB();
        try{
            String sql="select * from blog where bid=? and aid=?";
            PreparedStatement pre=db.conn.prepareStatement(sql);
            pre.setInt(1,cbid);
            pre.setInt(2,aid);
            ResultSet rs=pre.executeQuery();
            status=rs.next();
        }
        catch(Exception e){

        }finally{
            db.close();
        }
        return status;

    }

    public Blog SingleBlog(int bid){
        Blog blog=new Blog();
        DB db=new DB();
        try{
            String sql="select * from blog where bid=? ";
            PreparedStatement pre=db.conn.prepareStatement(sql);
            pre.setInt(1,bid);
            ResultSet rs=pre.executeQuery();
            if(rs.next()){
                int bidx = rs.getInt("bid");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");

                blog = new Blog(bidx,title,detail, date);
                return blog;
            }
        }
        catch(Exception e){

        }finally{
            db.close();
        }
        return blog;
    }

    public int updateBlog(String title, String detail,int bid){

        int status = 0;
        DB db = new DB();
        try {
            String sql = "update blog set title = ?, detail = ?  where bid = ? ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,detail);
            pre.setInt(3,bid);
            status = pre.executeUpdate();

        }catch (Exception e){
            System.err.println("updateBlog Error : " + e);
        }finally {
            db.close();
        }

        return status;
    }


    public int SifreDegistirme(String email, String password,int aid){

        int status = 0;
        DB db = new DB();
        Util util=new Util();
        try {
            String sql = "update admin set password = ?  where email= ? and aid=? ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,util.MD5(password));
            pre.setString(2,email);
            pre.setInt(3,aid);
            status = pre.executeUpdate();

        }catch (Exception e){
            System.err.println("SifreDegistirme Error : " + e);
        }finally {
            db.close();
        }

        return status;
    }

    public int contactInsert(Contact contact){
        int status=0;
        DB db=new DB();

        try{
            String sql="insert into contact values ( null, ?, ?, ?)";
            PreparedStatement pre=db.conn.prepareStatement(sql);
            pre.setString(1,contact.getName());
            pre.setString(2,contact.getEmail());
            pre.setString(3,contact.getMessage());
            status=pre.executeUpdate();
        }catch (Exception e){
            System.err.println("contactInsertError"+e);
        }finally {
            db.close();
        }
        return status;
    }

}
