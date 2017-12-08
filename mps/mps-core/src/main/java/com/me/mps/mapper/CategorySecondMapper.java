package com.me.mps.mapper;

import com.me.mps.dto.CategorySecondDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Me on 2017/12/8.
 */
public interface CategorySecondMapper {

    void saveCategorySecond(CategorySecondDTO categorySecondDTO);

    void updateCategorySecond(CategorySecondDTO categorySecondDTO);

    List<CategorySecondDTO> listCategorySecondDataByCategoryId(@Param("categoryId") Integer categoryId);

    int countName(CategorySecondDTO categorySecondDTO);

    void deleteCategorySecond(Integer categorySecondId);

    void deleteCategorySecondByCategoryId(Integer categoryId);
}
