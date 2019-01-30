package sdx;

import MEABP.Cal;
import sdx.webservice.EnvInfoDetail;
import sdx.webservice.ServiceFactory;
import sdx.webservice.ServiceSoap;
import utils.DBHelper;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class SendData implements Runnable{

    private ServiceSoap service;
    private boolean flag;
    private ShowBox showBox;

    public SendData(ShowBox showBox) {
        service=ServiceFactory.getService();
        this.showBox=showBox;
        flag=true;
    }
    public SendData() {
        service=ServiceFactory.getService();
        flag=true;
    }
    @Override
    public void run() {
        while (flag) {
            List<EnvInfoDetail> list=service.getEnvInfoDetails(7501).getEnvInfoDetail();
            String time=list.get(0).getTime().toXMLFormat();
            Map<String,Object> map=getMap(list);
          //  showBox.setData(map,time);
            if (list != null && list.size() > 0&&!isExist(time)) {
                String sql="INSERT INTO `data` VALUES (7501, ?, ?, ?, ?, ?, ?, ?, ?, ?);";//查询语句
                PreparedStatement prem = null;
                Object result[] = null;
                try {
                    double s1=(Double) map.get("ATP");
                    s1=(double)Math.round(s1*100)/100;
                    double s2=(Double) map.get("AHM");
                    double s3=(Double) map.get("STP");
                    double s4=(Double) map.get("SMC");
                    double s5=(Double) map.get("AWS");
                    s5=(double)Math.round(s5*10000)/10000;
                    double s6=(Double) map.get("AWD");
                    s6=(double)Math.round(s6*10000)/10000;
                    double s7=(Double) map.get("AIL");
                    Cal c=new Cal();
                    result = c.MEABP(1,s1,s2,s3,s4,s5,s6,s7);
                    double s8=Double.parseDouble(String.valueOf(result[0]));
                    map.put("thickness",s8);
                    prem = DBHelper.getConnection().prepareStatement(sql);
                    prem.setString(1, time);
                    prem.setDouble(2,s1);
                    prem.setDouble(3,s2);
                    prem.setDouble(4,s3);
                    prem.setDouble(5,s4);
                    prem.setDouble(6,s5);
                    prem.setDouble(7,s6);
                    prem.setDouble(8,s7);
                    prem.setDouble(9,s8);
                    int count=prem.executeUpdate();
                    System.out.println("当前时间："+time+" 成功数："+count);
                    if (s8>10){
                        String mFlie = "E:\\alert.wav";
                        try{
                            InputStream in = new FileInputStream(mFlie);
                            sun.audio.AudioStream as = new sun.audio.AudioStream(in);
                            sun.audio.AudioPlayer.player.start(as);
                        }
                        catch (Exception e){
                            e.printStackTrace();
                        }

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            try {
                Thread.sleep(300000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean isExist(String time)  {
        String sql="select * from data where TIME = ?";//查询语句
        PreparedStatement prem = null;
        try {
            prem = DBHelper.getConnection().prepareStatement(sql);
            prem.setString(1, time);
            ResultSet rs=prem.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    private Map<String,Object> getMap(List<EnvInfoDetail> list) {
        Map<String, Object> map = new HashMap<>();
        for (EnvInfoDetail envInfoDetail : list) {
            map.put(envInfoDetail.getCode(),envInfoDetail.getValue());
        }
        return map;
    }

    public static void main(String[] args) {
        Executor executor=Executors.newSingleThreadExecutor();
        executor.execute(new SendData());
    }
}
