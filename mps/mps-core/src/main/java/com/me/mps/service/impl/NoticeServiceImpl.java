package com.me.mps.service.impl;

import com.me.mps.dto.NoticeDTO;
import com.me.mps.mapper.NoticeMapper;
import com.me.mps.service.NoticeService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * Created by Me on 2017/12/11.
 */
@Service
public class NoticeServiceImpl extends BaseServiceImpl implements NoticeService {

    private Logger logger = Logger.getLogger(NoticeServiceImpl.class);

    public NoticeDTO getCurrentNotice() {
        logger.debug("Execute Method getCurrentNotice...");

        return sqlSessionTemplate.getMapper(NoticeMapper.class).getCurrentNotice();
    }

    public void saveNotice(NoticeDTO noticeDTO) {
        logger.debug("Execute Method getCurrentNotice...");

        sqlSessionTemplate.getMapper(NoticeMapper.class).saveNotice(noticeDTO);
    }

    public void deletePrevNotice() {
        logger.debug("Execute Method getCurrentNotice...");

        sqlSessionTemplate.getMapper(NoticeMapper.class).deletePrevNotice();
    }
}
