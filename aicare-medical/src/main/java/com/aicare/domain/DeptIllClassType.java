package com.aicare.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.aicare.common.annotation.Excel;
import com.aicare.common.core.domain.BaseEntity;

/**
 * 科室疾病子类类型对象 dept_ill_class_type
 * 
 * @author zhyl
 * @date 2022-10-07
 */
public class DeptIllClassType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 疾病ID */
    private Long typeId;

    /** 疾病名称 */
    @Excel(name = "疾病名称")
    private String typeName;

    /** 顶层ID，所属科目 */
    @Excel(name = "顶层ID，所属科目")
    private Integer topId;

    /** 父级ID，所属类别 */
    @Excel(name = "父级ID，所属类别")
    private Long parentId;

    /** 排列顺序 */
    @Excel(name = "排列顺序")
    private Long orderNum;

    /** 删除标志 0代表存在 2代表删除 */
    private String delFlag;

    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }
    public void setTopId(Integer topId) 
    {
        this.topId = topId;
    }

    public Integer getTopId() 
    {
        return topId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
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
            .append("typeId", getTypeId())
            .append("typeName", getTypeName())
            .append("topId", getTopId())
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
