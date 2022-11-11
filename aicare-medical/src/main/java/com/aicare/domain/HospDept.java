package com.aicare.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.aicare.common.annotation.Excel;
import com.aicare.common.core.domain.BaseEntity;

/**
 * 医学数据科目对象 hosp_dept
 * 
 * @author zhyl
 * @date 2022-10-07
 */
public class HospDept extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 科目ID */
    private Integer deptId;

    /** 科目名称 */
    @Excel(name = "科目名称")
    private String deptName;

    /** 排列顺序 */
    @Excel(name = "排列顺序")
    private Integer orderNum;

    /** 删除标志 0代表存在 2代表删除 */
    private String delFlag;

    public void setDeptId(Integer deptId) 
    {
        this.deptId = deptId;
    }

    public Integer getDeptId() 
    {
        return deptId;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deptId", getDeptId())
            .append("deptName", getDeptName())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .append("remark", getRemark())
            .toString();
    }
}
