package com.aicare.mapper;

import java.util.List;
import java.util.Map;

import com.aicare.domain.HospDept;
import org.springframework.stereotype.Repository;

/**
 * 医学数据科目Mapper接口
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Repository
public interface HospDeptMapper 
{
    /**
     * 查询医学数据科目
     * 
     * @param deptId 医学数据科目主键
     * @return 医学数据科目
     */
    public HospDept selectHospDeptByDeptId(Integer deptId);

    /**
     * 查询医学数据科目列表
     * 
     * @param hospDept 医学数据科目
     * @return 医学数据科目集合
     */
    public List<HospDept> selectHospDeptList(HospDept hospDept);

    /**
     * 新增医学数据科目
     * 
     * @param hospDept 医学数据科目
     * @return 结果
     */
    public int insertHospDept(HospDept hospDept);

    /**
     * 修改医学数据科目
     * 
     * @param hospDept 医学数据科目
     * @return 结果
     */
    public int updateHospDept(HospDept hospDept);

    /**
     * 删除医学数据科目
     * 
     * @param deptId 医学数据科目主键
     * @return 结果
     */
    public int deleteHospDeptByDeptId(Integer deptId);

    /**
     * 批量删除医学数据科目
     * 
     * @param deptIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHospDeptByDeptIds(String[] deptIds);

    /**
     * 查询医学数据科目名称并根据order_num排序
     *
     * @return 医学数据科目名称集合
     */
    public List<Map<String, Object>> selectHospDeptNameListOrder();
}
