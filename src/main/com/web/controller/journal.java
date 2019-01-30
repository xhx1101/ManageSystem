//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import utils.DBHelper;

@WebServlet(
        name = "journal",
        urlPatterns = {"/journal"}
)
public class journal extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       response.setCharacterEncoding("UTF-8");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");

        try {
            String sql = "select * from record where time>=? and time<=? order by time DESC";
            PreparedStatement prem = DBHelper.getConnection().prepareStatement(sql);
            prem.setString(1, starttime);
            prem.setString(2, endtime);
            ResultSet rs = prem.executeQuery();
//            rs.next();
            JSONArray jsonData = JSONArray.fromObject(convertList(rs));
            response.getWriter().write(jsonData.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        ResultSetMetaData md = rs.getMetaData();
        int columnCount = md.getColumnCount();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            while (rs.next()) {
                Map rowData = new HashMap();
                for (int i = 1; i <= columnCount; i++) {
                    Object o = rs.getObject(i);
                    rowData.put(md.getColumnName(i), o.getClass().getSimpleName().equals("Timestamp") ? sdf.format(o) : o);
                }
                list.add(rowData);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
