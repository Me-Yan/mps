package com.me.mps.controller;

import com.google.common.collect.Lists;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.dto.CategorySecondDTO;
import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.PageNation;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.CategorySecondService;
import com.me.mps.service.CategoryService;
import com.me.mps.service.NoticeService;
import com.me.mps.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 管理商品展示
 */
@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

    private Logger logger = Logger.getLogger(ProductController.class);

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategorySecondService categorySecondService;

    @Autowired
    private ProductService productService;

    @Autowired
    private NoticeService noticeService;

    /**
     * 访问商品列表页面
     * 获取所有商品的数据，并计算分页展示的数据信息
     * @param searchCriteria
     * @param request
     * @return
     */
    @RequestMapping("/listProduct")
    public ModelAndView listProduct(SearchCriteria searchCriteria, HttpServletRequest request) {
        logger.debug("Execute Method listProduct...");
        ModelAndView model = new ModelAndView("listProduct");

        int count = productService.countProductByCriteria(searchCriteria);
        PageNation pageNation = getPageNationInfo(count, request, 12);
        searchCriteria.setPageNation(pageNation);
        List<ProductDTO> productDTOList = productService.listProductByCriteria(searchCriteria);

        List<CategoryDTO> categoryDTOList = categoryService.listCategoryData();

        List<CategorySecondDTO> categorySecondDTOList = Lists.newArrayList();
        if (searchCriteria.getCategoryId()!=null) {
            categorySecondDTOList = categorySecondService.listCategorySecondDataByCategoryId(searchCriteria.getCategoryId());
        }

        model.addObject("searchCriteria", searchCriteria);
        model.addObject("categoryDTOList", categoryDTOList);
        model.addObject("categorySecondDTOList", categorySecondDTOList);
        model.addObject("productDTOList", productDTOList);
        model.addObject("pageNation", pageNation);
        model.addObject("noticeDTO", noticeService.getCurrentNotice());

        return model;
    }

    /**
     * 查看单个商品的详情
     * 根据商品id，获取相应商品信息
     * @param productId
     * @return
     */
    @RequestMapping("/detail")
    public ModelAndView detail(Integer productId) {
        logger.debug("Execute Method detail...");
        ModelAndView model = new ModelAndView("productDetail");

        ProductDTO  productDTO = productService.getProductByProductId(productId);

        if (productDTO==null) {
            return new ModelAndView("redirect:/product/listProduct");
        }

        model.addObject("productDTO", productDTO);

        return model;
    }
}
