package com.aicare.service.impl;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aicare.mapper.DeptIllClassTypeMapper;
import com.aicare.domain.DeptIllClassType;
import com.aicare.service.IDeptIllClassTypeService;
import com.aicare.common.core.text.Convert;

/**
 * 科室疾病子类类型Service业务层处理
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Service
public class DeptIllClassTypeServiceImpl implements IDeptIllClassTypeService 
{
    @Autowired
    private DeptIllClassTypeMapper deptIllClassTypeMapper;

    /**
     * 查询科室疾病子类类型
     * 
     * @param typeId 科室疾病子类类型主键
     * @return 科室疾病子类类型
     */
    @Override
    public DeptIllClassType selectDeptIllClassTypeByTypeId(Long typeId)
    {
        return deptIllClassTypeMapper.selectDeptIllClassTypeByTypeId(typeId);
    }

    /**
     * 查询科室疾病子类类型列表
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 科室疾病子类类型
     */
    @Override
    public List<DeptIllClassType> selectDeptIllClassTypeList(DeptIllClassType deptIllClassType)
    {
        return deptIllClassTypeMapper.selectDeptIllClassTypeList(deptIllClassType);
    }

    /**
     * 新增科室疾病子类类型
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 结果
     */
    @Override
    public int insertDeptIllClassType(DeptIllClassType deptIllClassType)
    {
        deptIllClassType.setCreateTime(DateUtils.getNowDate());
        return deptIllClassTypeMapper.insertDeptIllClassType(deptIllClassType);
    }

    /**
     * 修改科室疾病子类类型
     * 
     * @param deptIllClassType 科室疾病子类类型
     * @return 结果
     */
    @Override
    public int updateDeptIllClassType(DeptIllClassType deptIllClassType)
    {
        deptIllClassType.setUpdateTime(DateUtils.getNowDate());
        return deptIllClassTypeMapper.updateDeptIllClassType(deptIllClassType);
    }

    /**
     * 批量删除科室疾病子类类型
     * 
     * @param typeIds 需要删除的科室疾病子类类型主键
     * @return 结果
     */
    @Override
    public int deleteDeptIllClassTypeByTypeIds(String typeIds)
    {
        return deptIllClassTypeMapper.deleteDeptIllClassTypeByTypeIds(Convert.toStrArray(typeIds));
    }

    /**
     * 删除科室疾病子类类型信息
     * 
     * @param typeId 科室疾病子类类型主键
     * @return 结果
     */
    @Override
    public int deleteDeptIllClassTypeByTypeId(Long typeId)
    {
        return deptIllClassTypeMapper.deleteDeptIllClassTypeByTypeId(typeId);
    }

    /**
     * 根据父级ID查询科目疾病子类类型名称列表并排序
     *
     * @param parentId 科目疾病类型父类ID
     * @return 科目疾病子类类型名称列表
     */
    @Override
    public List<Map<String, Object>> selectDeptIllClassTypeNameByParentId(int parentId) {
        return deptIllClassTypeMapper.selectDeptIllClassTypeNameByParentId(parentId);
    }

    @Override
    public List<Map<String, Object>> selectClassTypeList(Map<String, Object> map) {
        return deptIllClassTypeMapper.selectClassTypeList(map);
    }

    @Override
    public Integer selectClassTypeListCount(Map<String, Object> map) {
        return deptIllClassTypeMapper.selectClassTypeListCount(map);
    }

    @Override
    public List<Map<String, Object>> selectDeptIllClassTypeNameByTypeId(Long typeId) {
        return deptIllClassTypeMapper.selectDeptIllClassTypeNameByTypeId(typeId);
    }

    @Override
    public List<Map<String, Object>> fuzzySearchService(String typeName, int topId) {
        return deptIllClassTypeMapper.fuzzySearchList(typeName, topId);
    }
}
