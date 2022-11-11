package com.aicare.mapper;

import java.util.List;
import java.util.Map;

import com.aicare.domain.MedicalDataType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 医学数据案例类型Mapper接口
 * 
 * @author zhyl
 * @date 2022-10-05
 */
@Repository
public interface MedicalDataTypeMapper 
{
    MedicalDataType getDataType(Long typeId);

    List<Map<String, Object>> selectTreeList(@Param("typeId") Long typeId);

    List<MedicalDataType> selectTypeByParentId(Long parentId);

    List<Map<String, Object>> selectLastLevel(Map<String, Object> map);

    int selectLastLevelCount(Map<String, Object> map);

    List<Map<String, Object>> selectDicomData(Map<String, Object> map);

    int selectDicomDataCount(Map<String, Object> map);

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
     * 删除医学数据案例类型
     * 
     * @param typeId 医学数据案例类型主键
     * @return 结果
     */
    public int deleteMedicalDataTypeByTypeId(Long typeId);

    /**
     * 批量删除医学数据案例类型
     * 
     * @param typeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicalDataTypeByTypeIds(String[] typeIds);
}
