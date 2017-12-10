package com.me.mps.dto;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by Me on 2017/12/9.
 */
public class ProductDTO implements Serializable {

    private static final long serialVersionUID = 8585571928359103619L;

    private Integer productId;
    private Integer categoryId;
    private Integer categorySecondId;
    private String nameX;
    private Integer countN;
    private Double priceN;
    private String imagePathX;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;
    private String updByM;
    private Date updOnDt;
    private List<ImageDTO> imageDTOList;

    // for operation
    private MultipartFile imageFile;
    private List<MultipartFile> imageList;
    private String showFlag;
    private String detailFlag;

    // for view
    private Integer serialNumber;
    private String createDate;

    public String getShowFlag() {
        return showFlag;
    }

    public void setShowFlag(String showFlag) {
        this.showFlag = showFlag;
    }

    public String getDetailFlag() {
        return detailFlag;
    }

    public void setDetailFlag(String detailFlag) {
        this.detailFlag = detailFlag;
    }

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

    public List<ImageDTO> getImageDTOList() {
        return imageDTOList;
    }

    public void setImageDTOList(List<ImageDTO> imageDTOList) {
        this.imageDTOList = imageDTOList;
    }

    public List<MultipartFile> getImageList() {
        return imageList;
    }

    public void setImageList(List<MultipartFile> imageList) {
        this.imageList = imageList;
    }

    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getNameX() {
        return nameX;
    }

    public void setNameX(String nameX) {
        this.nameX = nameX;
    }

    public Integer getCountN() {
        return countN;
    }

    public void setCountN(Integer countN) {
        this.countN = countN;
    }

    public Double getPriceN() {
        return priceN;
    }

    public void setPriceN(Double priceN) {
        this.priceN = priceN;
    }

    public String getImagePathX() {
        return imagePathX;
    }

    public void setImagePathX(String imagePathX) {
        this.imagePathX = imagePathX;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCategorySecondId() {
        return categorySecondId;
    }

    public void setCategorySecondId(Integer categorySecondId) {
        this.categorySecondId = categorySecondId;
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
