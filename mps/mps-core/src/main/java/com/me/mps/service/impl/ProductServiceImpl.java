package com.me.mps.service.impl;

import com.me.mps.dto.ImageDTO;
import com.me.mps.dto.ProductDTO;
import com.me.mps.helper.Constants;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.mapper.ImageMapper;
import com.me.mps.mapper.ProductMapper;
import com.me.mps.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/9.
 */
@Service
public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

    private Logger logger = Logger.getLogger(ProductServiceImpl.class);

    public void saveProduct(ProductDTO productDTO) {
        logger.debug("Execute Method saveProduct...");

        sqlSessionTemplate.getMapper(ProductMapper.class).saveProduct(productDTO);
        sqlSessionTemplate.getMapper(ImageMapper.class).saveImage(productDTO.getImageDTOList(), productDTO.getProductId());
    }

    public void updateProduct(ProductDTO productDTO) {
        logger.debug("Execute Method updateProduct...");

        sqlSessionTemplate.getMapper(ProductMapper.class).updateProduct(productDTO);
        if (Constants.YES_NO.YES.equals(productDTO.getDetailFlag())) {
            sqlSessionTemplate.getMapper(ImageMapper.class).deleteImageByProductId(productDTO.getProductId());
            sqlSessionTemplate.getMapper(ImageMapper.class).saveImage(productDTO.getImageDTOList(), productDTO.getProductId());
        }
    }

    public ProductDTO getProductByProductId(Integer productId) {
        logger.debug("Execute Method getProductByProductId...");

        ProductDTO productDTO = sqlSessionTemplate.getMapper(ProductMapper.class).getProductByProductId(productId);
        List<ImageDTO> imageDTOList = sqlSessionTemplate.getMapper(ImageMapper.class).listImageByProductId(productId);

        productDTO.setImageDTOList(imageDTOList);

        return productDTO;
    }

    public List<ProductDTO> listProductByCriteria(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listProductByCriteria...");

        return sqlSessionTemplate.getMapper(ProductMapper.class).listProductByCriteria(searchCriteria);
    }

    public void downProduct(Integer productId) {
        logger.debug("Execute Method downProduct...");

        sqlSessionTemplate.getMapper(ProductMapper.class).downProduct(productId);
    }

    public Integer getCountByProductId(Integer productId) {
        logger.debug("Execute Method getCountByProductId...");

        return sqlSessionTemplate.getMapper(ProductMapper.class).getCountByProductId(productId);
    }

    public void updateCountByProductId(ProductDTO productDTO) {
        logger.debug("Execute Method getCountByProductId...");

        sqlSessionTemplate.getMapper(ProductMapper.class).updateCountByProductId(productDTO);
    }
}
