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
 * 管理商品
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

    /**
     * 访问商品添加页面
     * @param productDTO
     * @return
     */
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

    /**
     * 添加商品，存储商品信息进数据库，并将商品图片上传到服务器
     * @param productDTO
     * @param redirectAttributes
     * @return
     * @throws IOException
     */
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

    /**
     * 查看商品详情
     * 根据商品id，查询某个商品的信息
     * @param productId
     * @return
     * @throws IOException
     */
    @RequestMapping("/detail")
    public ModelAndView detail(@ModelAttribute("productId") Integer productId) throws IOException {
        logger.debug("Execute Method detail...");
        ModelAndView model = new ModelAndView("productDetail");

        ProductDTO productDTO = productService.getProductByProductId(productId);

        model.addObject("productDTO", productDTO);

        return model;
    }

    /**
     * 访问商品展示列表页面
     * @return
     */
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

    /**
     * 异步请求获取商品列表数据
     * @param searchCriteria
     * @return
     * @throws IOException
     */
    @RequestMapping("/listProductByCriteria")
    @ResponseBody
    public List<ProductDTO> listProductByCriteria(SearchCriteria searchCriteria) throws IOException {
        logger.debug("Execute Method listProductByCriteria...");

        List<ProductDTO> productDTOList = productService.listProductByCriteria(searchCriteria);

        return productDTOList;
    }

    /**
     * 访问商品修改的页面
     * 查询出具体商品的数据，并填充进输入框中
     * @param productDTO
     * @return
     */
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

    /**
     * 确认修改商品
     * 获取修改后商品的信息，并将这些信息封装成对象存储进数据库，最后重定向至商品详情页面
     * @param productDTO
     * @param redirectAttributes
     * @return
     * @throws IOException
     */
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

    /**
     * 下架商品
     * @param productId
     * @return
     * @throws IOException
     */
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

    /**
     * 当某个商品的数量需要补充时，则进行数量的补充
     * @param productDTO
     * @return
     * @throws IOException
     */
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
