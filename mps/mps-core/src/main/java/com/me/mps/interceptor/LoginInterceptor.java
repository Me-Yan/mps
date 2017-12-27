package com.me.mps.interceptor;

import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Me on 2017/12/27.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();

        UserDTO userDTO = (UserDTO) session.getAttribute(Constants.USER.SESSION_USER);

        if (userDTO==null) {
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath+"/login");

            return false;
        }
        return true;
    }
}
