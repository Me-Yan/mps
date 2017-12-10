package com.me.mps.helper;

import com.me.mps.dto.UserDTO;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
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

        UserDTO tempUser = new UserDTO();
        tempUser.setUserId(1);
        tempUser.setUsernameM("Me");
        tempUser.setRealNameM("严杨鸿");
        tempUser.setPasswordX("123456");
        tempUser.setSexX("男");
        tempUser.setAgeN(23);
        tempUser.setEmailX("875649210@qq.com");
        tempUser.setPhoneX("18380448173");
        tempUser.setCompanyId(1);
        tempUser.setAmountN(0d);
        tempUser.setAuthorityX(Constants.AUTHORITY.INTERNET);
        tempUser.setCrtByM("Admin");
        tempUser.setCrtOnDt(new Date());

        return tempUser;
    }
}
