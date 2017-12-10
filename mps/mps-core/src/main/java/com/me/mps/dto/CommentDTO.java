package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/10.
 */
public class CommentDTO implements Serializable {

    private static final long serialVersionUID = -7299764258684967565L;

    private Integer commentId;
    private Integer productId;
    private Integer userId;
    private String commentX;
    private String statusX;
    private String crtByM;
    private Date crtOnDt;

    // for view
    private Integer serialNumber;
    private String username;
    private String createDate;
    private String imagePath;
    private String productName;

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

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

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCommentX() {
        return commentX;
    }

    public void setCommentX(String commentX) {
        this.commentX = commentX;
    }

    public String getStatusX() {
        return statusX;
    }

    public void setStatusX(String statusX) {
        this.statusX = statusX;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
