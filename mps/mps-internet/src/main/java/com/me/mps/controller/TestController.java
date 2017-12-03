package com.me.mps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2017/12/4.
 */
@Controller
public class TestController {

    @RequestMapping("/test")
    public ModelAndView testView() {

        return new ModelAndView("test");
    }
}
