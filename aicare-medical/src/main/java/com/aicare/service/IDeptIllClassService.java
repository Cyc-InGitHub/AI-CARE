package com.aicare.service;

import java.util.List;
import java.util.Map;

import com.aicare.domain.DeptIllClass;

/**
 * 科目疾病子类Service接口
 * 
 * @author zhyl
 * @date 2022-10-07
 */
public interface IDeptIllClassService 
{
    /**
     * 查询科目疾病子类
     * 
     * @param classId 科目疾病子类主键
     * @return 科目疾病子类
     */
    public DeptIllClass selectDeptIllClassByClassId(Long classId);

    /**
     * 查询科目疾病子类列表
     * 
     * @param deptIllClass 科目疾病子类
     * @return 科目疾病子类集合
     */
    public List<DeptIllClass> selectDeptIllClassList(DeptIllClass deptIllClass);

    /**
     * 新增科目疾病子类
     * 
     * @param deptIllClass 科目疾病子类
     * @return 结果
     */
    public int insertDeptIllClass(DeptIllClass deptIllClass);

    /**
     * 修改科目疾病子类
     * 
     * @param deptIllClass 科目疾病子类
     * @return 结果
     */
    public int updateDeptIllClass(DeptIllClass deptIllClass);

    /**
     * 批量删除科目疾病子类
     * 
     * @param classIds 需要删除的科目疾病子类主键集合
     * @return 结果
     */
    public int deleteDeptIllClassByClassIds(String classIds);

    /**
     * 删除科目疾病子类信息
     * 
     * @param classId 科目疾病子类主键
     * @return 结果
     */
    public int deleteDeptIllClassByClassId(Long classId);

    /**
     * 根据父级ID查询科目疾病子类名称列表并排序
     *
     * @param parentId 科目疾病父类ID
     * @return 科目疾病子类名称
     */
    public List<Map<String, Object>> selectDeptIllClassNameByParentId(int parentId);
}
