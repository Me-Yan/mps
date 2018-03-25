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
 * 用户管理
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    /**
     * 访问用户列表页面
     * @return
     */
    @RequestMapping("/listUser")
    public ModelAndView listUser() {
        logger.debug("Execute Method listUser...");
        ModelAndView model = new ModelAndView("user");

        List<CompanyDTO> companyDTOList = companyService.listCompanyData();

        model.addObject("companyDTOList", companyDTOList);

        return model;
    }

    /**
     * 异步请求获取用户列表页面数据
     * @return
     */
    @RequestMapping("/listUserData")
    @ResponseBody
    public List<UserDTO> listUserData() {
        logger.debug("Execute Method listUserData...");

        return userService.listUser();
    }

    /**
     * 添加新的用户并存储进数据库
     * @param userDTO
     * @return
     */
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

    /**
     * 检查新密码是否和旧密码是否一致
     * @param oldPassword
     * @param userId
     * @return
     */
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

    /**
     * 重置用户密码
     * @param userDTO
     * @return
     */
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

    /**
     * 补充某个用户的余额
     * @param userDTO
     * @return
     */
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

    /**
     * 检查所添加用户的用户名是否已经存在
     * @param userDTO
     * @return
     */
    @RequestMapping("/checkUsernameIsExist")
    @ResponseBody
    public Map<String, Object> checkUsernameIsExist(UserDTO userDTO) {
        logger.debug("Execute Method checkUsernameIsExist...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(userDTO.getUsernameM())) {
            int count = userService.checkUsernameIsExist(userDTO);

            if (count>0) {
                model.put("valid", false);
            } else {
                model.put("valid", true);
            }
        } else {
            model.put("valid", false);
        }

        return model;
    }

    /**
     * 删除某个用户
     * @param userId
     * @return
     */
    @RequestMapping("/deleteUserByUserId")
    @ResponseBody
    public Map<String, Object> deleteUserByUserId(Integer userId) {
        logger.debug("Execute Method checkUsernameIsExist...");
        Map<String, Object> model = Maps.newHashMap();

        if (userId!=null) {
            userService.deleteUserByUserId(userId);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
