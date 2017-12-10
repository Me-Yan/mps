package com.me.mps.mapper;

import com.me.mps.dto.NoticeDTO;

/**
 * Created by Me on 2017/12/10.
 */
public interface NoticeMapper {

    NoticeDTO getCurrentNotice();

    void saveNotice(NoticeDTO noticeDTO);

    void deletePrevNotice();
}
