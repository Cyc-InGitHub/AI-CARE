package com.aicare.mapper;

import com.aicare.common.core.domain.entity.SysUser;
import com.aicare.domain.MedicalMr;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * medical-mrMapper接口
 * 
 * @author ruoyi
 * @date 2022-09-30
 */

@Repository
public interface MedicalMrMapper
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
     * 删除medical-mr
     * 
     * @param mrId medical-mr主键
     * @return 结果
     */
    public int deleteMedicalMrByMrId(String mrId);

    /**
     * 批量删除medical-mr
     * 
     * @param mrIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicalMrByMrIds(String[] mrIds);

    public  List<SysUser> selectU();

}
