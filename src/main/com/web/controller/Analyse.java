package controller;

import utils.DBHelper;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据分析
 */

    @WebServlet(name = "Analyse", urlPatterns = ("/analyse"))
    public class Analyse extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String starttime = request.getParameter("starttime");
            String endtime = request.getParameter("endtime");
            try {
                String sql = " select * from data where time>=? and time<=? order by time ";//查询语句
                PreparedStatement prem = DBHelper.getConnection().prepareStatement(sql);
                prem.setString(1, starttime);
                prem.setString(2, endtime);
                // 通过数据库的连接操作数据库，实现增删改查
                ResultSet rs = prem.executeQuery();// 查询数据,其中输入sql语句
                JSONArray jsonData = JSONArray.fromObject(convertList(rs));      //先转成List格式，再转成json格式
                response.getWriter().write(jsonData.toString());    //把json数据传递到前端，记着前端用ajax接收
            } catch (Exception e) {
                e.printStackTrace();
        }
    }

    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        while (rs.next()) {
            Map<String, Object> rowData = new HashMap<String, Object>();
            rowData.put("time", sdf.format(rs.getObject(2)));
            rowData.put("airtem", rs.getObject(3));
            rowData.put("airhum", rs.getObject(4));
            rowData.put("soiltem", rs.getObject(5));
            rowData.put("soilwater", rs.getObject(6));
            rowData.put("windspeed", rs.getObject(7));
            rowData.put("winddir", rs.getObject(8));
            rowData.put("light", rs.getObject(9));
            rowData.put("thickness",rs.getObject(10));
            list.add(rowData);
        }
        return list;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
