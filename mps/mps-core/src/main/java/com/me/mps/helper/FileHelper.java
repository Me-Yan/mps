package com.me.mps.helper;

import com.google.common.collect.Lists;
import com.me.mps.dto.ImageDTO;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Me on 2017/12/10.
 */
public class FileHelper extends FileUtils {

    private static Logger logger = Logger.getLogger(FileHelper.class);

    // 上传单个文件
    public static ImageDTO uploadSingleFile(MultipartFile file) throws IOException {
        logger.debug("Execute Method uploadSingleFile...");

        try {
            if (file!=null) {
                StringBuffer filePath = new StringBuffer();
                filePath.append(Constants.VIRTUAL_PATH);

                String fileName = UUID.randomUUID() + Constants.UNDERLINE + file.getOriginalFilename();

                filePath.append(fileName);

                File desFile = new File(filePath.toString());
                file.transferTo(desFile);

                return new ImageDTO(fileName, Constants.IN_ACTIVE.ACTIVE, Helper.getUserInfo().getUsernameM(), new Date());
            }
        } catch (Exception e) {
            logger.error("Error: ", e);
        }

        return null;
    }

    // 上传多个文件
    public static List<ImageDTO> uploadMultipleFiles(List<MultipartFile> fileList) {
        logger.debug("Execute Method uploadMultipleFiles...");

        List<ImageDTO> imageDTOList = Lists.newArrayList();
        try {
            if (!CollectionUtils.isEmpty(fileList)) {
                for (MultipartFile file : fileList) {
                    if (file!=null) {
                        imageDTOList.add(uploadSingleFile(file));
                    }
                }
            }
        } catch (Exception e) {
            logger.error("Error: ", e);
        }

        return imageDTOList;
    }
}
