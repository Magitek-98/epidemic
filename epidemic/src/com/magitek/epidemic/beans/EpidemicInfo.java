package com.magitek.epidemic.beans;

import java.util.Date;

public class EpidemicInfo {
    private Integer serialId;
    private Integer provinceId;
    private int dataYear;
    private int dataMonth;
    private int dataDay;
    private Integer affirmed,suspected,cured,isolated,dead,userId;
    private Date inputDate;

    public Integer getSerialId() {
        return serialId;
    }

    public void setSerialId(Integer serialId) {
        this.serialId = serialId;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public int getDataYear() {
        return dataYear;
    }

    public void setDataYear(int dataYear) {
        this.dataYear = dataYear;
    }

    public int getDataMonth() {
        return dataMonth;
    }

    public void setDataMonth(int dataMonth) {
        this.dataMonth = dataMonth;
    }

    public int getDataDay() {
        return dataDay;
    }

    public void setDataDay(int dataDay) {
        this.dataDay = dataDay;
    }

    public Integer getAffirmed() {
        return affirmed;
    }

    public void setAffirmed(Integer affirmed) {
        this.affirmed = affirmed;
    }

    public Integer getSuspected() {
        return suspected;
    }

    public void setSuspected(Integer suspected) {
        this.suspected = suspected;
    }

    public Integer getCured() {
        return cured;
    }

    public void setCured(Integer cured) {
        this.cured = cured;
    }

    public Integer getIsolated() {
        return isolated;
    }

    public void setIsolated(Integer isolated) {
        this.isolated = isolated;
    }

    public Integer getDead() {
        return dead;
    }

    public void setDead(Integer dead) {
        this.dead = dead;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getInputDate() {
        return inputDate;
    }

    public void setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }
}
