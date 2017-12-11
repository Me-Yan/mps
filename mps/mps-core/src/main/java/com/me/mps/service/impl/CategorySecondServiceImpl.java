package com.me.mps.service.impl;

import com.me.mps.dto.CategorySecondDTO;
import com.me.mps.mapper.CategorySecondMapper;
import com.me.mps.mapper.ProductMapper;
import com.me.mps.service.CategorySecondService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/8.
 */
@Service
public class CategorySecondServiceImpl extends BaseServiceImpl implements CategorySecondService {

    private Logger logger = Logger.getLogger(CategorySecondServiceImpl.class);

    public void saveCategorySecond(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method saveCategorySecond...");

        sqlSessionTemplate.getMapper(CategorySecondMapper.class).saveCategorySecond(categorySecondDTO);
    }

    public void updateCategorySecond(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method updateCategorySecond...");

        sqlSessionTemplate.getMapper(CategorySecondMapper.class).updateCategorySecond(categorySecondDTO);
    }

    public List<CategorySecondDTO> listCategorySecondDataByCategoryId(Integer categoryId) {
        logger.debug("Execute Method listCategorySecondData...");

        return sqlSessionTemplate.getMapper(CategorySecondMapper.class).listCategorySecondDataByCategoryId(categoryId);
    }

    public int countName(CategorySecondDTO categorySecondDTO) {
        logger.debug("Execute Method countName...");

        return sqlSessionTemplate.getMapper(CategorySecondMapper.class).countName(categorySecondDTO);
    }

    public void deleteCategorySecond(Integer categorySecondId) {
        logger.debug("Execute Method deleteCategorySecond...");

        sqlSessionTemplate.getMapper(ProductMapper.class).deleteProductByCategorySecondId(categorySecondId);
        sqlSessionTemplate.getMapper(CategorySecondMapper.class).deleteCategorySecond(categorySecondId);
    }
}
