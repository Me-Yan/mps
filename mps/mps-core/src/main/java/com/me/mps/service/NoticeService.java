package com.me.mps.service;

import com.me.mps.dto.NoticeDTO;

/**
 * Created by Me on 2017/12/11.
 */
public interface NoticeService {

    NoticeDTO getCurrentNotice();

    void saveNotice(NoticeDTO noticeDTO);

    void deletePrevNotice();
}
