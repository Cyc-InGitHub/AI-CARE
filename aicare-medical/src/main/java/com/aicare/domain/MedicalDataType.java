package com.aicare.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.aicare.common.annotation.Excel;
import com.aicare.common.core.domain.BaseEntity;

/**
 * 医学数据案例类型对象 medical_data_type
 * 
 * @author zhyl
 * @date 2022-10-05
 */
public class MedicalDataType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 类型ID */
    private Long typeId;

    /** 类型名称 */
    @Excel(name = "类型名称")
    private String typeName;

    /** 顶层类型ID */
    @Excel(name = "顶层类型ID")
    private Long topTypeId;

    /** 父级类型ID */
    @Excel(name = "父级类型ID")
    private Long parentId;

    /** 级别 */
    @Excel(name = "级别")
    private Integer levelNum;

    /** 是否末级 */
    @Excel(name = "是否末级")
    private Integer isFinal;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 删除标志（0代表存在 2代表删除） */
    @Excel(name = "删除标志", readConverterExp = "0=代表存在,2=代表删除")
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
    public void setTopTypeId(Long topTypeId) 
    {
        this.topTypeId = topTypeId;
    }

    public Long getTopTypeId() 
    {
        return topTypeId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setLevelNum(Integer levelNum) 
    {
        this.levelNum = levelNum;
    }

    public Integer getLevelNum() 
    {
        return levelNum;
    }
    public void setIsFinal(Integer isFinal) 
    {
        this.isFinal = isFinal;
    }

    public Integer getIsFinal() 
    {
        return isFinal;
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
            .append("topTypeId", getTopTypeId())
            .append("parentId", getParentId())
            .append("levelNum", getLevelNum())
            .append("isFinal", getIsFinal())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
