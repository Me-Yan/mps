package com.me.mps.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Me on 2017/12/10.
 */
public class NoticeDTO implements Serializable {

    private static final long serialVersionUID = 6302414082358090388L;

    private Integer noticeId;
    private String contentX;
    private String typeC;
    private String activeC;
    private String crtByM;
    private Date crtOnDt;

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getContentX() {
        return contentX;
    }

    public void setContentX(String contentX) {
        this.contentX = contentX;
    }

    public String getTypeC() {
        return typeC;
    }

    public void setTypeC(String typeC) {
        this.typeC = typeC;
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
