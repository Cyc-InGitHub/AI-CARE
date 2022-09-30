package com.aicare.service;

import com.aicare.domain.MedicalMr;

import java.util.List;

/**
 * medical-mrService接口
 * 
 * @author ruoyi
 * @date 2022-09-30
 */
public interface IMedicalMrService 
{
    /**
     * 查询medical-mr
     * 
     * @param mrId medical-mr主键
     * @return medical-mr
     */
    public MedicalMr selectMedicalMrByMrId(String mrId);

    /**
     * 查询medical-mr列表
     * 
     * @param medicalMr medical-mr
     * @return medical-mr集合
     */
    public List<MedicalMr> selectMedicalMrList(MedicalMr medicalMr);

    /**
     * 新增medical-mr
     * 
     * @param medicalMr medical-mr
     * @return 结果
     */
    public int insertMedicalMr(MedicalMr medicalMr);

    /**
     * 修改medical-mr
     * 
     * @param medicalMr medical-mr
     * @return 结果
     */
    public int updateMedicalMr(MedicalMr medicalMr);

    /**
     * 批量删除medical-mr
     * 
     * @param mrIds 需要删除的medical-mr主键集合
     * @return 结果
     */
    public int deleteMedicalMrByMrIds(String mrIds);

    /**
     * 删除medical-mr信息
     * 
     * @param mrId medical-mr主键
     * @return 结果
     */
    public int deleteMedicalMrByMrId(String mrId);
}
