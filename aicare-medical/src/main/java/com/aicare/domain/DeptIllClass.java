package com.aicare.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.aicare.common.annotation.Excel;
import com.aicare.common.core.domain.BaseEntity;

/**
 * 科目疾病子类对象 dept_ill_class
 * 
 * @author zhyl
 * @date 2022-10-07
 */
public class DeptIllClass extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 疾病子类ID */
    private Long classId;

    /** 疾病子类名称 */
    @Excel(name = "疾病子类名称")
    private String className;

    /** 父级ID，所属科目 */
    @Excel(name = "父级ID，所属科目")
    private Integer parentId;

    /** 排列顺序 */
    @Excel(name = "排列顺序")
    private Long orderNum;

    /** 删除标志 0代表存在 2代表删除 */
    private String delFlag;

    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setClassName(String className) 
    {
        this.className = className;
    }

    public String getClassName() 
    {
        return className;
    }
    public void setParentId(Integer parentId) 
    {
        this.parentId = parentId;
    }

    public Integer getParentId() 
    {
        return parentId;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
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
            .append("classId", getClassId())
            .append("className", getClassName())
            .append("parentId", getParentId())
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
