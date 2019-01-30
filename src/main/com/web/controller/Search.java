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


/**
 * 历史纪录
 */

@WebServlet(name = "Search",urlPatterns = ("/search"))
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
            try {
            String sql="select * from data where time>=? and time<=?  order by time DESC";//查询语句
            PreparedStatement prem =DBHelper.getConnection().prepareStatement(sql);
            prem.setString(1, starttime);
            prem.setString(2, endtime);
            // 通过数据库的连接操作数据库，实现增删改查
            ResultSet rs = prem.executeQuery();// 查询数据,其中输入sql语句
            JSONArray jsonData = JSONArray.fromObject(convertList(rs));//先转成List格式，再转成json格式
            response.getWriter().write(jsonData.toString());    //把json数据传递到前端，记着前端用ajax接收
        }catch (Exception e){
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
            for (int i = 1; i <= columnCount; i++) {
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
