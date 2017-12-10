package com.me.mps.controller;

import com.me.mps.dto.NoticeDTO;
import com.me.mps.service.NoticeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Me on 2017/12/10.
 */
@Controller
@RequestMapping("notice")
public class NoticeController extends BaseController {

    private Logger logger = Logger.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/notice")
    public ModelAndView notice() {
        logger.debug("Execute Method notice...");
        ModelAndView model = new ModelAndView("notice");

        NoticeDTO noticeDTO = noticeService.getCurrentNotice();

        model.addObject("noticeDTO", noticeDTO);

        return model;
    }
}
