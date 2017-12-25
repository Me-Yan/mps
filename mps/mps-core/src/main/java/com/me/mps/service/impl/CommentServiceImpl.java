package com.me.mps.service.impl;

import com.me.mps.dto.CommentDTO;
import com.me.mps.helper.SearchCriteria;
import com.me.mps.mapper.CommentMapper;
import com.me.mps.service.CommentService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/10.
 */
@Service
public class CommentServiceImpl extends BaseServiceImpl implements CommentService {

    private Logger logger = Logger.getLogger(CommentServiceImpl.class);

    public void saveComment(CommentDTO commentDTO) {
        logger.debug("Execute Method saveComment...");

        sqlSessionTemplate.getMapper(CommentMapper.class).saveComment(commentDTO);
    }

    public List<CommentDTO> listCommentByProductId(Integer productId) {
        logger.debug("Execute Method listCommentByProductId...");

        return sqlSessionTemplate.getMapper(CommentMapper.class).listCommentByProductId(productId);
    }

    public List<CommentDTO> listCommentByCriteria(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listCommentByCriteria...");

        return sqlSessionTemplate.getMapper(CommentMapper.class).listCommentByCriteria(searchCriteria);
    }

    public List<CommentDTO> listCommentByUserId(SearchCriteria searchCriteria) {
        logger.debug("Execute Method listCommentByUserId...");

        return sqlSessionTemplate.getMapper(CommentMapper.class).listCommentByUserId(searchCriteria);
    }

    public void updateStatusByCommentId(Integer commentId) {
        logger.debug("Execute Method updateStatusByCommentId...");

        sqlSessionTemplate.getMapper(CommentMapper.class).updateStatusByCommentId(commentId);
    }
}
