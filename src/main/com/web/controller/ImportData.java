package controller;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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
 * 导出数据
 */

//引入数据   查询语句
@WebServlet(name = "ImportData", urlPatterns = ("/importdata"))
public class ImportData extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String starttime=request.getParameter("starttime");
        String endtime=request.getParameter("endtime");
        try {
            String sql="select no,time,airtem,airhum,windspeed,winddir,light,thinkness from data where time>=? and time<=?";//查询语句
            PreparedStatement prem = utils.DBHelper.getConnection().prepareStatement(sql);
            prem.setString(1, starttime);
            prem.setString(2, endtime);
            // 通过数据库的连接操作数据库，实现增删改查
            ResultSet rs = prem.executeQuery();// 查询数据,其中输入sql语句
            JSONArray jsonData = JSONArray.fromObject(convertList(rs));//先转成List格式，再转成json格式
            String downFileName =starttime+"---"+endtime+".xls";
            writeExcel(jsonData,response,downFileName);
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
    public void writeExcel(JSONArray microdata,HttpServletResponse response,String downFileName)throws IOException{
        String[] keyarray={"no","time","airtem","airhum","windspeed","winddir","light","thinkness"};
        //创建工作簿
        HSSFWorkbook workBook = new HSSFWorkbook();
        //创建工作表  工作表的名字叫helloWorld
        HSSFSheet sheet = workBook.createSheet("Micrometeorological data");
        //创建并填充表头
        String[] array={"编号","时间","空气温度","空气湿度","风速","风向","光照强度","覆冰厚度"};
        HSSFRow row1=sheet.createRow(0);
        for(int i=0;i<array.length;i++){
            row1.createCell(i).setCellValue(array[i]);
        }
        //创建数据单元表格并填充数据
        for (int i=1;i<=microdata.size();i++){
            HSSFRow row2=sheet.createRow(i);
            for (int j=0;j<8;j++){
                row2.createCell(j).setCellValue(JSONObject.fromObject(microdata.get(i-1)).getString(keyarray[j]));
            }
        }

        response.setContentType("application/x-download");
        response.addHeader("Content-Disposition", "attachment;filename="+downFileName);
        workBook.write(response.getOutputStream());
        workBook.close();//最后记得关闭工作簿

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
