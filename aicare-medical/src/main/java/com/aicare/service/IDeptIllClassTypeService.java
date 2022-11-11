package com.aicare.service;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.Query;
import com.aicare.domain.DeptIllClassType;

/**
 * 科室疾病子类类型Service接口
 * 
 * @author zhyl
 * @date 2022-10-07
 */
public interface IDeptIllClassTypeService 
{
    /**
     * 查询科室疾病子类类型
     * 
     * @param typeId 科室疾病子类类型主键
     * @return 科室疾病子类类型
     */
    public DeptIllClassType selectDeptIllClassTypeByTypeId(Long typeId);

    /**
     * 查询科室疾病子类类型列表
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 科室疾病子类类型集合
     */
    public List<DeptIllClassType> selectDeptIllClassTypeList(DeptIllClassType deptIllClassType);

    /**
     * 新增科室疾病子类类型
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 结果
     */
    public int insertDeptIllClassType(DeptIllClassType deptIllClassType);

    /**
     * 修改科室疾病子类类型
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 结果
     */
    public int updateDeptIllClassType(DeptIllClassType deptIllClassType);

    /**
     * 批量删除科室疾病子类类型
     * 
     * @param typeIds 需要删除的科室疾病子类类型主键集合
     * @return 结果
     */
    public int deleteDeptIllClassTypeByTypeIds(String typeIds);

    /**
     * 删除科室疾病子类类型信息
     * 
     * @param typeId 科室疾病子类类型主键
     * @return 结果
     */
    public int deleteDeptIllClassTypeByTypeId(Long typeId);

    /**
     * 根据父级ID查询科目疾病子类类型名称列表并排序
     *
     * @param parentId 科目疾病类型父类ID
     * @return 科目疾病子类类型名称列表
     */
    public List<Map<String, Object>> selectDeptIllClassTypeNameByParentId(int parentId);

    public List<Map<String, Object>> selectClassTypeList(Map<String, Object> map);

    public Integer selectClassTypeListCount(Map<String,Object> map);

    public List<Map<String, Object>> selectDeptIllClassTypeNameByTypeId(Long typeId);

    public List<Map<String, Object>> fuzzySearchService(String typeName, int topId);
}
