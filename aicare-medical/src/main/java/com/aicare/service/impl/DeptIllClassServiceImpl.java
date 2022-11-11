package com.aicare.service.impl;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aicare.mapper.DeptIllClassMapper;
import com.aicare.domain.DeptIllClass;
import com.aicare.service.IDeptIllClassService;
import com.aicare.common.core.text.Convert;

/**
 * 科目疾病子类Service业务层处理
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Service
public class DeptIllClassServiceImpl implements IDeptIllClassService 
{
    @Autowired
    private DeptIllClassMapper deptIllClassMapper;

    /**
     * 查询科目疾病子类
     * 
     * @param classId 科目疾病子类主键
     * @return 科目疾病子类
     */
    @Override
    public DeptIllClass selectDeptIllClassByClassId(Long classId)
    {
        return deptIllClassMapper.selectDeptIllClassByClassId(classId);
    }

    /**
     * 查询科目疾病子类列表
     * 
     * @param deptIllClass 科目疾病子类
     * @return 科目疾病子类
     */
    @Override
    public List<DeptIllClass> selectDeptIllClassList(DeptIllClass deptIllClass)
    {
        return deptIllClassMapper.selectDeptIllClassList(deptIllClass);
    }

    /**
     * 新增科目疾病子类
     * 
     * @param deptIllClass 科目疾病子类
     * @return 结果
     */
    @Override
    public int insertDeptIllClass(DeptIllClass deptIllClass)
    {
        deptIllClass.setCreateTime(DateUtils.getNowDate());
        return deptIllClassMapper.insertDeptIllClass(deptIllClass);
    }

    /**
     * 修改科目疾病子类
     * 
     * @param deptIllClass 科目疾病子类
     * @return 结果
     */
    @Override
    public int updateDeptIllClass(DeptIllClass deptIllClass)
    {
        deptIllClass.setUpdateTime(DateUtils.getNowDate());
        return deptIllClassMapper.updateDeptIllClass(deptIllClass);
    }

    /**
     * 批量删除科目疾病子类
     * 
     * @param classIds 需要删除的科目疾病子类主键
     * @return 结果
     */
    @Override
    public int deleteDeptIllClassByClassIds(String classIds)
    {
        return deptIllClassMapper.deleteDeptIllClassByClassIds(Convert.toStrArray(classIds));
    }

    /**
     * 删除科目疾病子类信息
     * 
     * @param classId 科目疾病子类主键
     * @return 结果
     */
    @Override
    public int deleteDeptIllClassByClassId(Long classId)
    {
        return deptIllClassMapper.deleteDeptIllClassByClassId(classId);
    }

    /**
     * 根据父级ID查询科目疾病子类名称列表并排序
     *
     * @param parentId 科目疾病父类ID
     * @return 科目疾病子类名称
     */
    @Override
    public List<Map<String, Object>> selectDeptIllClassNameByParentId(int parentId) {
        return deptIllClassMapper.selectDeptIllClassNameByParentId(parentId);
    }
}
