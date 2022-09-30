package com.aicare.service.impl;

import com.aicare.common.core.text.Convert;
import com.aicare.domain.MedicalMr;
import com.aicare.mapper.MedicalMrMapper;
import com.aicare.service.IMedicalMrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * medical-mrService业务层处理
 * 
 * @author ruoyi
 * @date 2022-09-30
 */
@Service
public class MedicalMrServiceImpl implements IMedicalMrService
{
    @Autowired
    private MedicalMrMapper medicalMrMapper;

    /**
     * 查询medical-mr
     * 
     * @param mrId medical-mr主键
     * @return medical-mr
     */
    @Override
    public MedicalMr selectMedicalMrByMrId(String mrId)
    {
        return medicalMrMapper.selectMedicalMrByMrId(mrId);
    }

    /**
     * 查询medical-mr列表
     * 
     * @param medicalMr medical-mr
     * @return medical-mr
     */
    @Override
    public List<MedicalMr> selectMedicalMrList(MedicalMr medicalMr)
    {
        return medicalMrMapper.selectMedicalMrList(medicalMr);
    }

    /**
     * 新增medical-mr
     * 
     * @param medicalMr medical-mr
     * @return 结果
     */
    @Override
    public int insertMedicalMr(MedicalMr medicalMr)
    {
        return medicalMrMapper.insertMedicalMr(medicalMr);
    }

    /**
     * 修改medical-mr
     * 
     * @param medicalMr medical-mr
     * @return 结果
     */
    @Override
    public int updateMedicalMr(MedicalMr medicalMr)
    {
        return medicalMrMapper.updateMedicalMr(medicalMr);
    }

    /**
     * 批量删除medical-mr
     * 
     * @param mrIds 需要删除的medical-mr主键
     * @return 结果
     */
    @Override
    public int deleteMedicalMrByMrIds(String mrIds)
    {
        return medicalMrMapper.deleteMedicalMrByMrIds(Convert.toStrArray(mrIds));
    }

    /**
     * 删除medical-mr信息
     * 
     * @param mrId medical-mr主键
     * @return 结果
     */
    @Override
    public int deleteMedicalMrByMrId(String mrId)
    {
        return medicalMrMapper.deleteMedicalMrByMrId(mrId);
    }
}
