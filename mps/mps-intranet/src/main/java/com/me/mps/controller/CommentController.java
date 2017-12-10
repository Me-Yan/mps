package com.me.mps.controller;

import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.dto.CategorySecondDTO;
import com.me.mps.dto.CommentDTO;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.CategorySecondService;
import com.me.mps.service.CategoryService;
import com.me.mps.service.CommentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Me on 2017/12/10.
 */
@Controller
@RequestMapping("comment")
public class CommentController extends BaseController {

    private Logger logger = Logger.getLogger(ProductController.class);

    @Autowired
    private CommentService commentService;

    @Autowired
    private CategorySecondService categorySecondService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/listComment")
    public ModelAndView listComment() {
        logger.debug("Execute Method listProductComment...");
        ModelAndView model = new ModelAndView("listComment");

        List<CategoryDTO> categoryDTOList = categoryService.listCategoryData();
        if (!CollectionUtils.isEmpty(categoryDTOList)) {
            for (CategoryDTO categoryDTO : categoryDTOList) {
                List<CategorySecondDTO> categorySecondDTOList = categorySecondService.listCategorySecondDataByCategoryId(categoryDTO.getCategoryId());
                categoryDTO.setCategorySecondDTOList(categorySecondDTOList);
            }
        }

        model.addObject("categoryDTOList", categoryDTOList);
        model.addObject("categoryJson", new Gson().toJson(categoryDTOList));

        return model;
    }

    @RequestMapping("/listCommentByCriteria")
    @ResponseBody
    public List<CommentDTO> listCommentByCriteria(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listCommentByCriteria...");

        return commentService.listCommentByCriteria(searchCriteria);
    }

    @RequestMapping("/listProductComment")
    public ModelAndView listProductComment(Integer productId) {
        logger.debug("Execute Method listProductComment...");
        ModelAndView model = new ModelAndView("listProductComment");

        model.addObject("productId", productId);

        return model;
    }

    @RequestMapping("/listCommentByProductId")
    @ResponseBody
    public List<CommentDTO> listCommentByProductId(Integer productId) {
        logger.debug("Execute Method listCommentByProductId...");

        return commentService.listCommentByProductId(productId);
    }
}
