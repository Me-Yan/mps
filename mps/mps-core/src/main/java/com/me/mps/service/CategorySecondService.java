package com.me.mps.service;

import com.me.mps.dto.CategorySecondDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/8.
 */
public interface CategorySecondService {

    void saveCategorySecond(CategorySecondDTO categorySecondDTO);

    void updateCategorySecond(CategorySecondDTO categorySecondDTO);

    List<CategorySecondDTO> listCategorySecondDataByCategoryId(Integer categorySecondId);

    int countName(CategorySecondDTO categorySecondDTO);

    void deleteCategorySecond(Integer categorySecondId);

    void deleteCategorySecondByCategoryId(Integer categoryId);
}
