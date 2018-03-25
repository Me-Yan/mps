package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CompanyDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.CompanyService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理连队
 */
@Controller
@RequestMapping("company")
public class CompanyController extends BaseController {

    private Logger logger = Logger.getLogger(CompanyController.class);

    @Autowired
    private CompanyService companyService;

    /**
     * 访问连队列表页面
     * @return
     */
    @RequestMapping("/listCompany")
    public ModelAndView listCompany() {
        logger.debug("Execute Method listCompany...");

        return new ModelAndView("company");
    }

    /**
     * 异步请求连队列表数据
     * @return
     */
    @RequestMapping("/listCompanyData")
    @ResponseBody
    public List<CompanyDTO> listCompanyData() {
        logger.debug("Execute Method listCompanyData...");

        return companyService.listCompanyData();
    }

    /**
     * 添加连队信息
     * @param companyForm
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> addCompany(@ModelAttribute("companyForm") CompanyDTO companyForm) {
        logger.debug("Execute Method addCompany...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(companyForm.getNameX())) {
            companyForm.setActiveC(Constants.IN_ACTIVE.ACTIVE);
            companyForm.setCrtByM(getUserInfo().getUsernameM());
            companyForm.setCrtOnDt(new Date());

            companyService.saveCompany(companyForm);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 修改某个连队的信息
     * @param companyForm
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Map<String, Object> editCompany(@ModelAttribute("companyForm") CompanyDTO companyForm) {
        logger.debug("Execute Method addCompany...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(companyForm.getNameX())) {
            companyForm.setUpdByM(getUserInfo().getUsernameM());
            companyForm.setUpdOnDt(new Date());

            companyService.updateCompany(companyForm);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 删除某个连队，并删除该连队下的所有用户
     * @param companyId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteCompany(Integer companyId) {
        logger.debug("Execute Method deleteCompany...");
        Map<String, Object> model = Maps.newHashMap();

        if (companyId!=null) {
            companyService.deleteCompany(companyId);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 添加连队时，检查所添加的连队是否已经存在
     * @param nameX
     * @return
     */
    @RequestMapping("/checkIsExistCompany")
    @ResponseBody
    public Map<String, Object> checkIsExistCompany(String nameX) {
        logger.debug("Execute Method checkIsExistCompany...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(nameX))) {
            Integer count = companyService.checkIsExistCompany(nameX);
            if (count==null||count==0) {
                model.put("valid", true);
            } else {
                model.put("valid", false);
            }
        } else {
            model.put("valid", false);
        }

        return model;
    }
}
