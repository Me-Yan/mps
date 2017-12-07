package com.me.mps.service.impl;

import com.me.mps.dto.CategoryDTO;
import com.me.mps.mapper.CategoryMapper;
import com.me.mps.service.CategoryService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/8.
 */
@Service
public class CategoryServiceImpl extends BaseServiceImpl implements CategoryService {

    private Logger logger = Logger.getLogger(CategoryServiceImpl.class);

    public List<CategoryDTO> listCategoryData() {
        logger.debug("Execute Method listCategoryData...");

        return sqlSessionTemplate.getMapper(CategoryMapper.class).listCategoryData();
    }

    public Integer countName(String categoryName) {
        logger.debug("Execute Method countName...");

        return sqlSessionTemplate.getMapper(CategoryMapper.class).countName(categoryName);
    }

    public void saveCategory(CategoryDTO categoryDTO) {
        logger.debug("Execute Method saveCategory...");

        sqlSessionTemplate.getMapper(CategoryMapper.class).saveCategory(categoryDTO);
    }

    public void updateCategory(CategoryDTO categoryDTO) {
        logger.debug("Execute Method updateCategoryByCategoryId...");

        sqlSessionTemplate.getMapper(CategoryMapper.class).updateCategory(categoryDTO);
    }

    public void deleteCategory(Integer categoryId) {
        logger.debug("Execute Method deleteCategory...");

        sqlSessionTemplate.getMapper(CategoryMapper.class).deleteCategory(categoryId);
    }
}
