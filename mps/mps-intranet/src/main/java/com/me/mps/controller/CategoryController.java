package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.helper.Constants;
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
 * 管理菜单分类
 */
@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {

    private Logger logger = Logger.getLogger(CategoryController.class);

    @Autowired
    private CategoryService categoryService;

    /**
     * 访问一级分类页面
     * @return
     */
    @RequestMapping("/listCategory")
    public ModelAndView listCategory() {
        logger.debug("Execute Method listCategory...");

        return new ModelAndView("category");
    }

    /**
     * 异步请求获取一级分类数据
     * @return
     */
    @RequestMapping("/listCategoryData")
    @ResponseBody
    public List<CategoryDTO> listCategoryData() {
        logger.debug("Execute Method listCategoryData...");

        return categoryService.listCategoryData();
    }

    /**
     * 添加一级分类，并存储进数据库
     * @param categoryDTO
     * @return
     */
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

    /**
     * 检查所添加的一级分类是否已经存在
     * @param nameX
     * @return
     */
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

    /**
     * 修改一级分类
     * @param categoryDTO
     * @return
     */
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

    /**
     * 删除一级分类
     * 删除一级分类后，同时也会该分类下的所有二级分类和所有商品
     * @param categoryId
     * @return
     */
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
