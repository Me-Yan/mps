package com.me.mps.helper;

import com.me.mps.dto.UserDTO;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Me on 2017/12/10.
 */
public class Helper {

    private static Logger logger = Logger.getLogger(FileHelper.class);

    public static UserDTO getUserInfo() {
        logger.debug("Execute Method getUserInfo...");

        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();

        UserDTO user = (UserDTO) session.getAttribute(Constants.USER.SESSION_USER);

        return user;
    }

    public static String generateOrderNumber() {
        logger.debug("Execute Method generateOrderNumber...");
        DateFormat dateFormat = new SimpleDateFormat(Constants.DATETIME_PATTERN.YYYY_MM_DD);
        StringBuffer numberBuffer = new StringBuffer();
        numberBuffer.append(dateFormat.format(new Date())).append(System.currentTimeMillis());

        return numberBuffer.toString();
    }
}
