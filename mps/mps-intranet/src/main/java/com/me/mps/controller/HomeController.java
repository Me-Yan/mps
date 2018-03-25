package com.me.mps.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController extends BaseController {

    private Logger logger = Logger.getLogger(HomeController.class);

    /**
     * 后勤主页面不变化的框架，以iframe标签展示主要的信息
     * @return
     */
    @RequestMapping("/home")
    public ModelAndView adminHome() {
        logger.debug("Execute Method adminHome...");
        ModelAndView model = new ModelAndView("index");

        model.addObject("userInfo", getUserInfo());

        return model;
    }
}
