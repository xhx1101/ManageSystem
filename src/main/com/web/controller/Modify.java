package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.DBHelper;

/**
 *
 * 重置密码
 */

@WebServlet(name = "Modify", urlPatterns = ("/modify"))
public class Modify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String oldpassword = request.getParameter("oldword");
        String newpassword = request.getParameter("assureword");
        try {
            String sqlword = "Select password from login where username=? and password=?";
            PreparedStatement prem = DBHelper.getConnection().prepareStatement(sqlword);
            prem.setString(1, username);
            prem.setString(2, oldpassword);
            ResultSet resultSet = prem.executeQuery();
            if (resultSet.next()) {
                String sql = "UPDATE login SET password=? WHERE passname=?";//查询语句
                PreparedStatement premt = DBHelper.getConnection().prepareStatement(sql);
                premt.setString(1, newpassword);
                premt.setString(2, username);
                // 通过数据库的连接操作数据库，实现增删改查
                int rs = premt.executeUpdate();// 查询数据,其中输入sql语
                response.getWriter().print(rs);
            }
            else{
                response.getWriter().print(2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
