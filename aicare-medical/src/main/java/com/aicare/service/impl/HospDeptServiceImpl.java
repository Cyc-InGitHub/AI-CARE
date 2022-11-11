package com.aicare.service.impl;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aicare.mapper.HospDeptMapper;
import com.aicare.domain.HospDept;
import com.aicare.service.IHospDeptService;
import com.aicare.common.core.text.Convert;

/**
 * 医学数据科目Service业务层处理
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Service
public class HospDeptServiceImpl implements IHospDeptService 
{
    @Autowired
    private HospDeptMapper hospDeptMapper;

    /**
     * 查询医学数据科目
     * 
     * @param deptId 医学数据科目主键
     * @return 医学数据科目
     */
    @Override
    public HospDept selectHospDeptByDeptId(Integer deptId)
    {
        return hospDeptMapper.selectHospDeptByDeptId(deptId);
    }

    /**
     * 查询医学数据科目列表
     * 
     * @param hospDept 医学数据科目
     * @return 医学数据科目
     */
    @Override
    public List<HospDept> selectHospDeptList(HospDept hospDept)
    {
        return hospDeptMapper.selectHospDeptList(hospDept);
    }

    /**
     * 新增医学数据科目
     * 
     * @param hospDept 医学数据科目
     * @return 结果
     */
    @Override
    public int insertHospDept(HospDept hospDept)
    {
        hospDept.setCreateTime(DateUtils.getNowDate());
        return hospDeptMapper.insertHospDept(hospDept);
    }

    /**
     * 修改医学数据科目
     * 
     * @param hospDept 医学数据科目
     * @return 结果
     */
    @Override
    public int updateHospDept(HospDept hospDept)
    {
        hospDept.setUpdateTime(DateUtils.getNowDate());
        return hospDeptMapper.updateHospDept(hospDept);
    }

    /**
     * 批量删除医学数据科目
     * 
     * @param deptIds 需要删除的医学数据科目主键
     * @return 结果
     */
    @Override
    public int deleteHospDeptByDeptIds(String deptIds)
    {
        return hospDeptMapper.deleteHospDeptByDeptIds(Convert.toStrArray(deptIds));
    }

    /**
     * 删除医学数据科目信息
     * 
     * @param deptId 医学数据科目主键
     * @return 结果
     */
    @Override
    public int deleteHospDeptByDeptId(Integer deptId)
    {
        return hospDeptMapper.deleteHospDeptByDeptId(deptId);
    }

    /**
     * 查询医学数据科目名称并根据order_num排序
     *
     * @return 医学数据科目名称集合
     */
    @Override
    public List<Map<String, Object>> selectHospDeptNameListOrder() {
        return hospDeptMapper.selectHospDeptNameListOrder();
    }
}
