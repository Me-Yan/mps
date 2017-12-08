package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/8.
 */
public class CategorySecondDTO implements Serializable {

    private static final long serialVersionUID = 5259726013477421331L;

    private Integer categorySecondId;
    private Integer categoryId;
    private String nameX;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;
    private String updByM;
    private Date updOnDt;

    // for view
    private Integer serialNumber;
    private String categoryName;
    private String createDate;

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getCategorySecondId() {
        return categorySecondId;
    }

    public void setCategorySecondId(Integer categorySecondId) {
        this.categorySecondId = categorySecondId;
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
