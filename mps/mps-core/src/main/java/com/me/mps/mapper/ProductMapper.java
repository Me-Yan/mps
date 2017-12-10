package com.me.mps.mapper;

import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.SearchCriteria;

import java.util.List;

/**
 * Created by Me on 2017/12/9.
 */
public interface ProductMapper {

    void saveProduct(ProductDTO productDTO);

    void updateProduct(ProductDTO productDTO);

    ProductDTO getProductByProductId(Integer productId);

    List<ProductDTO> listProductByCriteria(SearchCriteria searchCriteria);

    void downProduct(Integer productId);

    Integer getCountByProductId(Integer productId);

    void updateCountByProductId(ProductDTO productDTO);
}
