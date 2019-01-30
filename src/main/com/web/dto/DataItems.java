package dto;

import java.sql.Timestamp;

public class DataItems {
    private int no;
    private Timestamp time;
    private double airtem;
    private int airhum;
    private double soiltem;
    private int soilwater;
    private double windspeed;
    private double winddir;
    private double light;

    public DataItems(){

    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public double getAirtem() {
        return airtem;
    }

    public void setAirtem(double airtem) {
        this.airtem = airtem;
    }

    public int getAirhum() {
        return airhum;
    }

    public void setAirhum(int airhum) {
        this.airhum = airhum;
    }

    public double getSoiltem() {
        return soiltem;
    }

    public void setSoiltem(double soiltem) {
        this.soiltem = soiltem;
    }

    public int getSoilwater() {
        return soilwater;
    }

    public void setSoilwater(int soilwater) {
        this.soilwater = soilwater;
    }

    public double getWindspeed() {
        return windspeed;
    }

    public void setWindspeed(double windspeed) {
        this.windspeed = windspeed;
    }

    public double getWinddir() {
        return winddir;
    }

    public void setWinddir(double winddir) {
        this.winddir = winddir;
    }

    public double getLight() {
        return light;
    }

    public void setLight(double light) {
        this.light = light;
    }
}
