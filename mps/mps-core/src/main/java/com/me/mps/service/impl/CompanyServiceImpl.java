package com.me.mps.service.impl;

import com.me.mps.dto.CompanyDTO;
import com.me.mps.mapper.CompanyMapper;
import com.me.mps.mapper.UserMapper;
import com.me.mps.service.CompanyService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Me on 2017/12/5.
 */
@Service
public class CompanyServiceImpl extends BaseServiceImpl implements CompanyService {

    private Logger logger = Logger.getLogger(CompanyServiceImpl.class);

    public List<CompanyDTO> listCompanyData() {
        logger.debug("Execute Method listCompany...");

        return sqlSessionTemplate.getMapper(CompanyMapper.class).listCompanyData();
    }

    public void saveCompany(CompanyDTO companyDTO) {
        logger.debug("Execute Method saveCompany...");

        sqlSessionTemplate.getMapper(CompanyMapper.class).saveCompany(companyDTO);
    }

    public Integer checkIsExistCompany(String companyName) {
        logger.debug("Execute Method checkIsExistCompany...");

        return sqlSessionTemplate.getMapper(CompanyMapper.class).checkIsExistCompany(companyName);
    }

    public void updateCompany(CompanyDTO companyDTO) {
        logger.debug("Execute Method updateCompany...");

        sqlSessionTemplate.getMapper(CompanyMapper.class).updateCompany(companyDTO);
    }

    public void deleteCompany(Integer companyId) {
        logger.debug("Execute Method deleteCompany...");

        sqlSessionTemplate.getMapper(CompanyMapper.class).deleteCompany(companyId);
        sqlSessionTemplate.getMapper(UserMapper.class).deleteUserByCompanyId(companyId);
    }
}
