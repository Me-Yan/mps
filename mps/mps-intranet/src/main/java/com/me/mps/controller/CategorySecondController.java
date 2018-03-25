package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.dto.CategorySecondDTO;
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
 * 管理二级分类
 */
@Controller
@RequestMapping("categorySecond")
public class CategorySecondController extends BaseController {

    private Logger logger = Logger.getLogger(CategorySecondController.class);

    @Autowired
    private CategorySecondService categorySecondService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 访问二级分类页面
     * @return
     */
    @RequestMapping("/listCategorySecond")
    public ModelAndView listCategorySecond() {
        logger.debug("Execute Method listCategorySecond...");

        ModelAndView model = new ModelAndView("categorySecond");

        List<CategoryDTO> categoryDTOList = categoryService.listCategoryData();

        model.addObject("categoryDTOList", categoryDTOList);

        return model;
    }

    /**
     * 异步请求获取具体某个一级分类下的所有二级分类信息
     * @param categoryId
     * @return
     */
    @RequestMapping("/listCategorySecondDataByCategoryId")
    @ResponseBody
    public List<CategorySecondDTO> listCategorySecondDataByCategoryId(Integer categoryId) {
        logger.debug("Execute Method listCategorySecondData...");

        return categorySecondService.listCategorySecondDataByCategoryId(categoryId);
    }

    /**
     * 添加二级分类
     * @param categorySecondDTO
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> add(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method add...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(categorySecondDTO.getNameX()))) {
            categorySecondDTO.setCrtByM(getUserInfo().getUsernameM());
            categorySecondDTO.setCrtOnDt(new Date());
            categorySecondDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
            categorySecondService.saveCategorySecond(categorySecondDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 检查所添加的二级分类是否已经存在
     * @param categorySecondDTO
     * @return
     */
    @RequestMapping("/checkIsExistCategorySecond")
    @ResponseBody
    public Map<String, Object> checkIsExistCategorySecond(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method checkIsExistCategorySecond...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(categorySecondDTO.getNameX()))) {
            int count = categorySecondService.countName(categorySecondDTO);
            if (count==0) {
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
     * 修改二级分类
     * @param categorySecondDTO
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Map<String, Object> edit(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method edit...");
        Map<String, Object> model = Maps.newHashMap();

        if (StringUtils.isNotBlank(StringUtils.trim(categorySecondDTO.getNameX()))) {
            categorySecondDTO.setUpdByM(getUserInfo().getUsernameM());
            categorySecondDTO.setUpdOnDt(new Date());
            categorySecondService.updateCategorySecond(categorySecondDTO);
            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    /**
     * 根据二级分类id删除该分类，并删除该分类下的所有商品
     * @param categorySecondId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(Integer categorySecondId) {
        logger.debug("Execute Method edit...");
        Map<String, Object> model = Maps.newHashMap();

        if (categorySecondId!=null) {
            categorySecondService.deleteCategorySecond(categorySecondId);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
