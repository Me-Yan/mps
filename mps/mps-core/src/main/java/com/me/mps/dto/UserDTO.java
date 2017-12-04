package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/4.
 */
public class UserDTO implements Serializable {

    private static final long serialVersionUID = 2519611454788724861L;

    private Integer userId;
    private String usernameM;
    private String realNameM;
    private String passwordX;
    private String sexX;
    private Integer ageN;
    private String emailX;
    private String phoneX;
    private Integer companyId;
    private Double amountN;
    private String authorityX;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;
    private String updByM;
    private Date updOnDt;

    // for view
    private Integer serialNumber;
    private String companyName;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsernameM() {
        return usernameM;
    }

    public void setUsernameM(String usernameM) {
        this.usernameM = usernameM;
    }

    public String getRealNameM() {
        return realNameM;
    }

    public void setRealNameM(String realNameM) {
        this.realNameM = realNameM;
    }

    public String getPasswordX() {
        return passwordX;
    }

    public void setPasswordX(String passwordX) {
        this.passwordX = passwordX;
    }

    public String getSexX() {
        return sexX;
    }

    public void setSexX(String sexX) {
        this.sexX = sexX;
    }

    public Integer getAgeN() {
        return ageN;
    }

    public void setAgeN(Integer ageN) {
        this.ageN = ageN;
    }

    public String getEmailX() {
        return emailX;
    }

    public void setEmailX(String emailX) {
        this.emailX = emailX;
    }

    public String getPhoneX() {
        return phoneX;
    }

    public void setPhoneX(String phoneX) {
        this.phoneX = phoneX;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Double getAmountN() {
        return amountN;
    }

    public void setAmountN(Double amountN) {
        this.amountN = amountN;
    }

    public String getAuthorityX() {
        return authorityX;
    }

    public void setAuthorityX(String authorityX) {
        this.authorityX = authorityX;
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
