package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/9.
 */
public class ImageDTO implements Serializable {

    private static final long serialVersionUID = 8378374620684419649L;

    private Integer imageId;
    private Integer productId;
    private String pathX;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;

    public ImageDTO(){

    }

    public ImageDTO(String pathX, String activeC, String crtByM, Date crtOnDt) {
        this.imageId = imageId;
        this.productId = productId;
        this.pathX = pathX;
        this.activeC = activeC;
        this.crtByM = crtByM;
        this.crtOnDt = crtOnDt;
    }

    public String getPathX() {
        return pathX;
    }

    public void setPathX(String pathX) {
        this.pathX = pathX;
    }

    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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
}
