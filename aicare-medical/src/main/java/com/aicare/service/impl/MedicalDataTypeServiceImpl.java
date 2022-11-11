package com.aicare.service.impl;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aicare.mapper.MedicalDataTypeMapper;
import com.aicare.domain.MedicalDataType;
import com.aicare.service.IMedicalDataTypeService;
import com.aicare.common.core.text.Convert;

/**
 * 医学数据案例类型Service业务层处理
 * 
 * @author zhyl
 * @date 2022-10-05
 */
@Service()
public class MedicalDataTypeServiceImpl implements IMedicalDataTypeService 
{
    @Autowired
    private MedicalDataTypeMapper medicalDataTypeMapper;

    @Override
    public MedicalDataType getDataType(Long typeId) {
        return medicalDataTypeMapper.getDataType(typeId);
    }

    @Override
    public List<Map<String, Object>> selectTreeList(Long typeId) {
        return medicalDataTypeMapper.selectTreeList(typeId);
    }

    @Override
    public List<MedicalDataType> selectTypeByParent(Long parentId) {
        return medicalDataTypeMapper.selectTypeByParentId(parentId);
    }

    @Override
    public List selectLastLevelService(Map<String, Object> map) {
        return medicalDataTypeMapper.selectLastLevel(map);
    }

    @Override
    public int selectLastLevelCount(Map<String, Object> map) {
        return medicalDataTypeMapper.selectLastLevelCount(map);
    }

    @Override
    public List selectDicomData(Map<String, Object> map) {
        return medicalDataTypeMapper.selectDicomData(map);
    }

    @Override
    public int selectDicomDataCount(Map<String, Object> map) {
        return medicalDataTypeMapper.selectDicomDataCount(map);
    }



    /**
     * 查询医学数据案例类型
     * 
     * @param typeId 医学数据案例类型主键
     * @return 医学数据案例类型
     */
    @Override
    public MedicalDataType selectMedicalDataTypeByTypeId(Long typeId)
    {
        return medicalDataTypeMapper.selectMedicalDataTypeByTypeId(typeId);
    }

    /**
     * 查询医学数据案例类型列表
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 医学数据案例类型
     */
    @Override
    public List<MedicalDataType> selectMedicalDataTypeList(MedicalDataType medicalDataType)
    {
        return medicalDataTypeMapper.selectMedicalDataTypeList(medicalDataType);
    }

    /**
     * 新增医学数据案例类型
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 结果
     */
    @Override
    public int insertMedicalDataType(MedicalDataType medicalDataType)
    {
        medicalDataType.setCreateTime(DateUtils.getNowDate());
        return medicalDataTypeMapper.insertMedicalDataType(medicalDataType);
    }

    /**
     * 修改医学数据案例类型
     * 
     * @param medicalDataType 医学数据案例类型
     * @return 结果
     */
    @Override
    public int updateMedicalDataType(MedicalDataType medicalDataType)
    {
        medicalDataType.setUpdateTime(DateUtils.getNowDate());
        return medicalDataTypeMapper.updateMedicalDataType(medicalDataType);
    }

    /**
     * 批量删除医学数据案例类型
     * 
     * @param typeIds 需要删除的医学数据案例类型主键
     * @return 结果
     */
    @Override
    public int deleteMedicalDataTypeByTypeIds(String typeIds)
    {
        return medicalDataTypeMapper.deleteMedicalDataTypeByTypeIds(Convert.toStrArray(typeIds));
    }

    /**
     * 删除医学数据案例类型信息
     * 
     * @param typeId 医学数据案例类型主键
     * @return 结果
     */
    @Override
    public int deleteMedicalDataTypeByTypeId(Long typeId)
    {
        return medicalDataTypeMapper.deleteMedicalDataTypeByTypeId(typeId);
    }
}
