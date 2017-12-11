package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.NoticeDTO;
import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.EmailHelper;
import com.me.mps.service.NoticeService;
import com.me.mps.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2017/12/10.
 */
@Controller
@RequestMapping("notice")
public class NoticeController extends BaseController {

    private Logger logger = Logger.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private UserService userService;

    @RequestMapping("/notice")
    public ModelAndView notice() {
        logger.debug("Execute Method notice...");
        ModelAndView model = new ModelAndView("notice");

        NoticeDTO noticeDTO = noticeService.getCurrentNotice();

        model.addObject("noticeDTO", noticeDTO);

        return model;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Map<String, Object> edit(NoticeDTO noticeDTO) {
        logger.debug("Execute Method edit...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(noticeDTO.getContentX())) {
            noticeDTO.setTypeC(Constants.NOTICE_TYPE.WEB);
            noticeDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
            noticeDTO.setCrtByM(getUserInfo().getUsernameM());
            noticeDTO.setCrtOnDt(new Date());
            noticeService.saveWebNotice(noticeDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/send")
    @ResponseBody
    public Map<String, Object> send(NoticeDTO noticeDTO) {
        logger.debug("Execute Method send...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(noticeDTO.getContentX())) {
            try {
                List<String> emailList = userService.listEmailOfAllUser();
                EmailHelper.sendMultipleMail(emailList, noticeDTO.getContentX());

                noticeDTO.setTypeC(Constants.NOTICE_TYPE.EMAIL);
                noticeDTO.setActiveC(Constants.IN_ACTIVE.INACTIVE);
                noticeDTO.setCrtByM(getUserInfo().getUsernameM());
                noticeDTO.setCrtOnDt(new Date());
                noticeService.saveEmailNotice(noticeDTO);

                model.put("msg", "success");

            } catch (Exception e) {
                logger.error("Error...", e);
                model.put("msg", "fail");
            }
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
