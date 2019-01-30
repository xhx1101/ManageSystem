package sdx;

import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class ShowBox extends JFrame {
    private JLabel label1 = new JLabel("微气象数据");
    private JLabel label2 = new JLabel("当前时间");
    private JLabel label3 = new JLabel("空气温度(°C)");
    private JLabel label4 = new JLabel("空气湿度(%)");
    private JLabel label5 = new JLabel("土壤温度(°C)");
    private JLabel label6 = new JLabel("土壤水分(%)");
    private JLabel label7 = new JLabel("  风速(m/s)     ");
    private JLabel label8 = new JLabel("  风向(°)     ");
    private JLabel label9 = new JLabel("光照强度(lux)");
    private JLabel label10 = new JLabel("---by xhx");
    private JTextField txt2 = new JTextField(11);//时间
    private JTextField txt3 = new JTextField(10);//空气温度
    private JTextField txt4 = new JTextField(10);//空气湿度
    private JTextField txt5 = new JTextField(10);//土壤温度
    private JTextField txt6 = new JTextField(10);//土壤水分
    private JTextField txt7 = new JTextField(10);//风速
    private JTextField txt8 = new JTextField(10);//风向
    private JTextField txt9 = new JTextField(10);//光照强度
    private JPanel panel0 = new JPanel();
    private JPanel panel1 = new JPanel();
    private JPanel panel2 = new JPanel();
    private JPanel panel3 = new JPanel();
    private JPanel panel4 = new JPanel();
    private JPanel panel5 = new JPanel();
    private JPanel panel6 = new JPanel();
    private JPanel panel7 = new JPanel();
    private JPanel panel8 = new JPanel();
    private JPanel panel = new JPanel();

    public ShowBox() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
        txt2.setText(df.format(new Date()));// new Date()为获取当前系统时间
        Container con = this.getContentPane();
        panel0.setLayout(new GridLayout(2, 1));// 设置格局
        panel0.add(label1);
        panel0.add(label10);
        panel0.setBackground(Color.PINK);// 设置背景颜色
        panel1.add(label2);
        panel1.add(txt2);
        panel.setLayout(new GridLayout(4, 2));// 设置格局
        panel2.add(label3);
        panel2.add(txt3);
        panel3.add(label4);
        panel3.add(txt4);
        panel4.add(label5);
        panel4.add(txt5);
        panel5.add(label6);
        panel5.add(txt6);
        panel6.add(label7);
        panel6.add(txt7);
        panel7.add(label8);
        panel7.add(txt8);
        panel8.add(label9);
        panel8.add(txt9);
        label1.setHorizontalAlignment(JLabel.CENTER);// 居中处理
        label10.setHorizontalAlignment(JLabel.RIGHT);// 右对齐
        // label10. //设置字体颜色
        con.add(panel0, BorderLayout.NORTH);
        // con.add(panel10,BorderLayout.CENTER);
        panel.add(panel1);
        panel.add(panel2);
        panel.add(panel3);
        panel.add(panel4);
        panel.add(panel5);
        panel.add(panel6);
        panel.add(panel7);
        panel.add(panel8);
        con.add(panel, BorderLayout.CENTER);
        pack();
        setBounds(300, 100, 500, 350);
        setVisible(true);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

    public void setData(Map<String, Object> map, String time) {
        txt2.setText(time);
        txt3.setText(map.get("ATP").toString());
        txt4.setText(map.get("AHM").toString());
        txt5.setText(map.get("STP").toString());
        txt6.setText(map.get("SMC").toString());
        txt7.setText(map.get("AWS").toString());
        txt8.setText(map.get("AWD").toString());
        txt9.setText(map.get("AIL").toString());
    }
}
