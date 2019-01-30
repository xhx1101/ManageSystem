package controller;

import utils.DBHelper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "addWarn",urlPatterns = ("/addWarn"))
public class addWarn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String thickness=request.getParameter("thickness");
        String time = request.getParameter("time");
        String grade = request.getParameter("grade");
        String operator =  request.getParameter("operator");
        String operation =  request.getParameter("operation");
        String remarks =  request.getParameter("remarks");

        try {
            String sql="INSERT INTO `record`  VALUES (7501, ?, ?, ?, ?, ?, ?);";
            PreparedStatement prem =  DBHelper.getConnection().prepareStatement(sql);
            prem.setString(1, time);
            prem.setString(2,grade);
            prem.setString(3,thickness);
            prem.setString(4,operation);
            prem.setString(5,operator);
            prem.setString(6,remarks);
            int count=prem.executeUpdate();
            System.out.println("成功数"+count);

        }catch (Exception e){
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
