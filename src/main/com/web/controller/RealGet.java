package controller;


import utils.DBHelper;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

@WebServlet(name = "RealGet",urlPatterns="/realget")
public class RealGet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String sql = "select * from data ORDER BY time DESC LIMIT 1";
            PreparedStatement prem = DBHelper.getConnection().prepareStatement(sql);
            ResultSet rs = prem.executeQuery();// 查询数据,其中输入sql语句
            JSONArray jsonData = JSONArray.fromObject(convertList(rs));//先转成List格式，再转成json格式
            response.getWriter().write(jsonData.toString());    //把json数据传递到前端，记着前端用ajax接收
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        ResultSetMetaData md = rs.getMetaData();
        int columnCount = md.getColumnCount();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        while (rs.next()) {
            Map rowData = new HashMap();
            for (int i = 2; i <= columnCount; i++) {
                Object o=rs.getObject(i);
                rowData.put(md.getColumnName(i), o.getClass().getSimpleName().equals("Timestamp")?sdf.format(o):o);
            }
            list.add(rowData);
        }
        return list;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
