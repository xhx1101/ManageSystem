package controller;

import dto.Users;
import utils.DBHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "Match",urlPatterns = ("/match"))
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");//得到验证码
       String sessionCode = request.getSession().getAttribute("code").toString();
         if (code != null && sessionCode != null && code.equalsIgnoreCase(sessionCode)){
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            try {
                String sql="select * from login where username= ? AND password= ?";//查询语句
                PreparedStatement prem =DBHelper.getConnection().prepareStatement(sql);
                prem.setString(1, username);
                prem.setString(2, password);
                // 通过数据库的连接操作数据库，实现增删改查
                ResultSet rs = prem.executeQuery();// 查询数据,其中输入sql语句
                response.getWriter().print(rs.next()?1:0);
            }catch (Exception e){
                e.printStackTrace();
            }
        } else {
            response.getWriter().print(3);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
