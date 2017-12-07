package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/8.
 */
public class CategoryDTO implements Serializable {

    private static final long serialVersionUID = 7169286870581813308L;

    private Integer serialNumber;
    private Integer categoryId;
    private String nameX;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;
    private String updByM;
    private Date updOnDt;

    // for view
    private String createDate;

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getNameX() {
        return nameX;
    }

    public void setNameX(String nameX) {
        this.nameX = nameX;
    }

    public String getActiveC() {
        return activeC;
    }

    public void setActiveC(String activeC) {
        this.activeC = activeC;
    }

    public String getCrtByM() {
        return crtByM;
    }

    public void setCrtByM(String crtByM) {
        this.crtByM = crtByM;
    }

    public Date getCrtOnDt() {
        return crtOnDt;
    }

    public void setCrtOnDt(Date crtOnDt) {
        this.crtOnDt = crtOnDt;
    }

    public String getUpdByM() {
        return updByM;
    }

    public void setUpdByM(String updByM) {
        this.updByM = updByM;
    }

    public Date getUpdOnDt() {
        return updOnDt;
    }

    public void setUpdOnDt(Date updOnDt) {
        this.updOnDt = updOnDt;
    }
}
