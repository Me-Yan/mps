package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.helper.Constants;
import com.me.mps.service.CategorySecondService;
import com.me.mps.service.CategoryService;
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
 * Created by Me on 2017/12/7.
 */
@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {

    private Logger logger = Logger.getLogger(CategoryController.class);

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategorySecondService categorySecondService;

    @RequestMapping("/listCategory")
    public ModelAndView listCategory() {
        logger.debug("Execute Method listCategory...");

        return new ModelAndView("category");
    }

    @RequestMapping("/listCategoryData")
    @ResponseBody
    public List<CategoryDTO> listCategoryData() {
        logger.debug("Execute Method listCategoryData...");

        return categoryService.listCategoryData();
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> add(CategoryDTO categoryDTO) {
        logger.debug("Execute Method add...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(categoryDTO.getNameX()))) {
            categoryDTO.setCrtByM(getUserInfo().getUsernameM());
            categoryDTO.setCrtOnDt(new Date());
            categoryDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
            categoryService.saveCategory(categoryDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/checkIsExistCategory")
    @ResponseBody
    public Map<String, Object> checkIsExistCategory(String nameX) {
        logger.debug("Execute Method checkIsExistCategory...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(nameX))) {
            Integer count = categoryService.countName(nameX);
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

    @RequestMapping("/edit")
    @ResponseBody
    public Map<String, Object> edit(CategoryDTO categoryDTO) {
        logger.debug("Execute Method edit...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(categoryDTO.getNameX()))) {
            categoryDTO.setUpdByM(getUserInfo().getUsernameM());
            categoryDTO.setUpdOnDt(new Date());
            categoryService.updateCategory(categoryDTO);
            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Integer categoryId) {
        logger.debug("Execute Method edit...");
        Map<String, Object> model = Maps.newHashMap();

        if (categoryId!=null) {
            categoryService.deleteCategory(categoryId);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
