package com.me.mps.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.me.mps.dto.CategoryDTO;
import com.me.mps.dto.CategorySecondDTO;
import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.FileHelper;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.service.CategorySecondService;
import com.me.mps.service.CategoryService;
import com.me.mps.service.NoticeService;
import com.me.mps.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Me on 2017/12/9.
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

    @RequestMapping("/add")
    public ModelAndView addProduct(@ModelAttribute("productForm") ProductDTO productDTO) {
        logger.debug("Execute Method addProduct");
        ModelAndView model = new ModelAndView("addProduct");

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

    @RequestMapping("/save")
    public ModelAndView saveProduct(@ModelAttribute("productForm") ProductDTO productDTO, RedirectAttributes redirectAttributes) throws IOException {
        logger.debug("Execute Method saveProduct...");

        productDTO.setImagePathX(FileHelper.uploadSingleFile(productDTO.getImageFile()).getPathX());
        productDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
        productDTO.setCrtByM(getUserInfo().getUsernameM());
        productDTO.setCrtOnDt(new Date());

        productDTO.setImageDTOList(FileHelper.uploadMultipleFiles(productDTO.getImageList()));

        productService.saveProduct(productDTO);

        redirectAttributes.addFlashAttribute("productId", productDTO.getProductId());

        return new ModelAndView("redirect:/product/detail");
    }

    @RequestMapping("/detail")
    public ModelAndView detail(@ModelAttribute("productId") Integer productId) throws IOException {
        logger.debug("Execute Method detail...");
        ModelAndView model = new ModelAndView("productDetail");

        ProductDTO productDTO = productService.getProductByProductId(productId);

        model.addObject("productDTO", productDTO);

        return model;
    }

    @RequestMapping("/listProduct")
    public ModelAndView listProduct() {
        logger.debug("Execute Method listProduct...");
        ModelAndView model = new ModelAndView("listProduct");

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

    @RequestMapping("/listProductByCriteria")
    @ResponseBody
    public List<ProductDTO> listProductByCriteria(SearchCriteria searchCriteria) throws IOException {
        logger.debug("Execute Method listProductByCriteria...");

        List<ProductDTO> productDTOList = productService.listProductByCriteria(searchCriteria);

        return productDTOList;
    }

    @RequestMapping("/edit")
    public ModelAndView edit(@ModelAttribute("productForm") ProductDTO productDTO) {
        logger.debug("Execute Method edit...");
        ModelAndView model = new ModelAndView("editProduct");

        productDTO = productService.getProductByProductId(productDTO.getProductId());

        List<CategorySecondDTO> categorySecondDTOList = Lists.newArrayList();
        List<CategoryDTO> categoryDTOList = categoryService.listCategoryData();
        if (!CollectionUtils.isEmpty(categoryDTOList)) {
            for (CategoryDTO categoryDTO : categoryDTOList) {
                List<CategorySecondDTO> tempCategorySecondDTOList = categorySecondService.listCategorySecondDataByCategoryId(categoryDTO.getCategoryId());
                categoryDTO.setCategorySecondDTOList(tempCategorySecondDTOList);
                if (categoryDTO.getCategoryId()==productDTO.getCategoryId()) {
                    categorySecondDTOList = tempCategorySecondDTOList;
                }
            }
        }

        model.addObject("categoryDTOList", categoryDTOList);
        model.addObject("categorySecondDTOList", categorySecondDTOList);
        model.addObject("categoryJson", new Gson().toJson(categoryDTOList));
        model.addObject("productForm", productDTO);

        return model;
    }

    @RequestMapping("/editConfirm")
    public ModelAndView editConfirm(@ModelAttribute("productForm") ProductDTO productDTO, RedirectAttributes redirectAttributes) throws IOException {
        logger.debug("Execute Method editConfirm...");

        if (Constants.YES_NO.YES.equals(productDTO.getShowFlag())) {
            productDTO.setImagePathX(FileHelper.uploadSingleFile(productDTO.getImageFile()).getPathX());
        }
        if (Constants.YES_NO.YES.equals(productDTO.getDetailFlag())) {
            productDTO.setImageDTOList(FileHelper.uploadMultipleFiles(productDTO.getImageList()));
        }
        productDTO.setActiveC(Constants.IN_ACTIVE.ACTIVE);
        productDTO.setUpdByM(getUserInfo().getUsernameM());
        productDTO.setUpdOnDt(new Date());

        productService.updateProduct(productDTO);

        redirectAttributes.addFlashAttribute("productId", productDTO.getProductId());

        return new ModelAndView("redirect:/product/detail");
    }

    @RequestMapping("/downProduct")
    @ResponseBody
    public Map<String, Object> downProduct(Integer productId) throws IOException {
        logger.debug("Execute Method down...");
        Map<String, Object> model = Maps.newHashMap();

        if (productId!=null) {
            productService.downProduct(productId);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }

    @RequestMapping("/supplyProduct")
    @ResponseBody
    public Map<String, Object> supplyProduct(ProductDTO productDTO) throws IOException {
        logger.debug("Execute Method supplyProduct...");
        Map<String, Object> model = Maps.newHashMap();

        if (null!=productDTO.getCountN()&&null!=productDTO.getProductId()) {

            Integer count = productService.getCountByProductId(productDTO.getProductId());
            productDTO.setCountN(count+productDTO.getCountN());

            productService.updateCountByProductId(productDTO);

            model.put("msg", "success");
        } else {
            model.put("msg", "fail");
        }

        return model;
    }
}
