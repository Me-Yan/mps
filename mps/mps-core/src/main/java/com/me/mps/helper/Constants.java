package com.me.mps.helper;

/**
 * Created by Me on 2017/12/4.
 */
public interface Constants {

    String VIRTUAL_PATH = "E:/temp/mps/";
    String UNDERLINE = "-";

    interface USER {
        String SESSION_USER = "SessionUser";
    }

    interface AUTHORITY {
        String INTERNET = "MPS_H";
        String INTRANET = "MPS_L";
    }

    interface IN_ACTIVE {
        String ACTIVE = "A";
        String INACTIVE = "I";
    }

    interface YES_NO {
        String YES = "Y";
        String NO = "N";
    }

    interface COMMENT_STATUS {
        String PENDING = "Pending";
        String READ = "Read";
    }

    interface NOTICE_TYPE {
        String WEB = "web";
        String EMAIL = "email";
    }
}
