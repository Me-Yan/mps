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
        String INTERNET = "MPS_L";
        String INTRANET = "MPS_H";
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

    interface DATETIME_PATTERN {
        String YYYY_MM_DD = "yyyyMMdd";
    }

    interface ORDER_STATUS {
        String PENDING = "Pending";
        String PAYED = "Payed";
        String CONFIRMED = "Confirmed";
        String GETTED = "Getted";
        String OVER = "Over";
        String CANCELLED = "Cancelled";
        String INVALID = "Invalid";
    }
}
