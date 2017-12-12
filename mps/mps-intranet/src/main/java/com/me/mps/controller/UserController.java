package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CompanyDTO;
import com.me.mps.dto.UserDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.CompanyService;
import com.me.mps.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
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
 * Created by Me on 2017/12/4.
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @RequestMapping("/listUser")
    public ModelAndView listUser() {
        logger.debug("Execute Method listUser...");
        ModelAndView model = new ModelAndView("user");

        List<CompanyDTO> companyDTOList = companyService.listCompanyData();

        model.addObject("companyDTOList", companyDTOList);

        return model;
    }

    @RequestMapping("/listUserData")
    @ResponseBody
    public List<UserDTO> listUserData() {
        logger.debug("Execute Method listUserData...");

        return userService.listUser();
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> addUser(UserDTO userDTO) {
        logger.debug("Execute Method addUser...");
        Map<String, Object> model = Maps.newHashMap();

        if (userDTO!=null) {
            userDTO.setPasswordX(DigestUtils.md5Hex(userDTO.getPasswordX()));
            userDTO.setAuthorityX(Constants.AUTHORITY.INTERNET);
            userDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
            userDTO.setCrtByM(getUserInfo().getUsernameM());
            userDTO.setCrtOnDt(new Date());

            userService.saveUser(userDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/checkOldPassword")
    @ResponseBody
    public Map<String, Object> checkOldPassword(String oldPassword, Integer userId) {
        logger.debug("Execute Method checkOldPassword...");
        Map<String, Object> model = Maps.newHashMap();

        String password = userService.getPasswordByUserId(userId);

        if (StringUtils.isNotBlank(StringUtils.trim(oldPassword))) {
            if (DigestUtils.md5Hex(oldPassword).equals(password)) {
                model.put("valid", true);
            } else {
                model.put("valid", false);
            }
        } else {
            model.put("valid", false);
        }

        return model;
    }

    @RequestMapping("/resetPassword")
    @ResponseBody
    public Map<String, Object> resetPassword(UserDTO userDTO) {
        logger.debug("Execute Method resetPassword...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(userDTO.getPasswordX()))&&userDTO.getUserId()!=null) {
            userDTO.setPasswordX(DigestUtils.md5Hex(userDTO.getPasswordX()));

            userService.updatePassword(userDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/addAmount")
    @ResponseBody
    public Map<String, Object> addAmount(UserDTO userDTO) {
        logger.debug("Execute Method addAmount...");
        Map<String, Object> model = Maps.newHashMap();

        if (userDTO.getAmountN()!=null) {
            UserDTO tempUser = userService.getUserByUserId(userDTO.getUserId());
            userDTO.setAmountN(userDTO.getAmountN()+tempUser.getAmountN());
            userService.updateAmount(userDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
