package com.me.mps.service;

import com.me.mps.dto.CompanyDTO;

import java.util.List;

/**
 * Created by Me on 2017/12/5.
 */
public interface CompanyService {

    List<CompanyDTO> listCompanyData();

    void saveCompany(CompanyDTO companyDTO);

    Integer checkIsExistCompany(String companyName);

    void updateCompany(CompanyDTO companyDTO);

    void deleteCompany(Integer companyId);
}
