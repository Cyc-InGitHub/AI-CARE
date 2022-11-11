package com.aicare.service;

import java.util.List;
import java.util.Map;

import com.aicare.domain.MedicalDataType;

/**
 * 医学数据案例类型Service接口
 * 
 * @author zhyl
 * @date 2022-10-05
 */
public interface IMedicalDataTypeService 
{
    MedicalDataType getDataType(Long typeId);

    List<Map<String, Object>> selectTreeList(Long typeId);

    List<MedicalDataType> selectTypeByParent(Long parentId);

    List selectLastLevelService(Map<String, Object> map);

    int selectLastLevelCount(Map<String,Object> map);

    List<Map<String, Object>> selectDicomData(Map<String, Object> map);

    int selectDicomDataCount(Map<String,Object> map);
    /**
     * 查询医学数据案例类型
     * 
     * @param typeId 医学数据案例类型主键
     * @return 医学数据案例类型
     */
    public MedicalDataType selectMedicalDataTypeByTypeId(Long typeId);

    /**
     * 查询医学数据案例类型列表
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 医学数据案例类型集合
     */
    public List<MedicalDataType> selectMedicalDataTypeList(MedicalDataType medicalDataType);

    /**
     * 新增医学数据案例类型
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 结果
     */
    public int insertMedicalDataType(MedicalDataType medicalDataType);

    /**
     * 修改医学数据案例类型
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 结果
     */
    public int updateMedicalDataType(MedicalDataType medicalDataType);

    /**
     * 批量删除医学数据案例类型
     * 
     * @param typeIds 需要删除的医学数据案例类型主键集合
     * @return 结果
     */
    public int deleteMedicalDataTypeByTypeIds(String typeIds);

    /**
     * 删除医学数据案例类型信息
     * 
     * @param typeId 医学数据案例类型主键
     * @return 结果
     */
    public int deleteMedicalDataTypeByTypeId(Long typeId);
}
