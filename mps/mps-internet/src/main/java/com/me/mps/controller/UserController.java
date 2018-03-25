package com.me.mps.controller;

import com.me.mps.dto.UserDTO;
import com.me.mps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2017/12/17.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/detail")
    public ModelAndView detail() {
        logger.debug("Execute Method detail...");
        ModelAndView model = new ModelAndView("user");

        UserDTO userDTO = userService.getUserByUserId(getUserInfo().getUserId());

        model.addObject("userDTO", userDTO);
        model.addObject("position", "user");

        return model;
    }
}
