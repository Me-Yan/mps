package com.me.mps.mapper;

import com.me.mps.dto.CategoryDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/8.
 */
public interface CategoryMapper {

    List<CategoryDTO> listCategoryData();

    Integer countName(String categoryName);

    void saveCategory(CategoryDTO categoryDTO);

    void updateCategory(CategoryDTO categoryDTO);

    void deleteCategory(Integer categoryId);
}
