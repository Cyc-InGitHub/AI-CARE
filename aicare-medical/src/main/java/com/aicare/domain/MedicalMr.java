package com.aicare.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.aicare.common.annotation.Excel;
import com.aicare.common.core.domain.BaseEntity;

/**
 * medical-mr对象 medical_mr
 * 
 * @author ruoyi
 * @date 2022-09-30
 */
public class MedicalMr extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private String mrId;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String mrUsrName;

    /** 所属科 */
    @Excel(name = "所属科")
    private Long mrParId;

    /** 1 */
    @Excel(name = "1")
    private String mrPatientName;

    /** 性别 */
    @Excel(name = "性别")
    private String mrPatientSex;

    /** 时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date mrAcquisitionTime;

    /** 主诉 */
    @Excel(name = "主诉")
    private String mrChiefComplaint;

    /** 现病史 */
    @Excel(name = "现病史")
    private String mrPresentIllness;

    /** 既往史 */
    @Excel(name = "既往史")
    private String mrHistoryIllness;

    /** 影像学表现 */
    @Excel(name = "影像学表现")
    private String mrImgPerformance;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date mrCreattime;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date mrModify;

    /** 物理删除 */
    @Excel(name = "物理删除")
    private String mrDelete;

    /** 1 */
    @Excel(name = "1")
    private String mrImgId;

    public void setMrId(String mrId) 
    {
        this.mrId = mrId;
    }

    public String getMrId() 
    {
        return mrId;
    }
    public void setMrUsrName(String mrUsrName) 
    {
        this.mrUsrName = mrUsrName;
    }

    public String getMrUsrName() 
    {
        return mrUsrName;
    }
    public void setMrParId(Long mrParId) 
    {
        this.mrParId = mrParId;
    }

    public Long getMrParId() 
    {
        return mrParId;
    }
    public void setMrPatientName(String mrPatientName) 
    {
        this.mrPatientName = mrPatientName;
    }

    public String getMrPatientName() 
    {
        return mrPatientName;
    }
    public void setMrPatientSex(String mrPatientSex) 
    {
        this.mrPatientSex = mrPatientSex;
    }

    public String getMrPatientSex() 
    {
        return mrPatientSex;
    }
    public void setMrAcquisitionTime(Date mrAcquisitionTime) 
    {
        this.mrAcquisitionTime = mrAcquisitionTime;
    }

    public Date getMrAcquisitionTime() 
    {
        return mrAcquisitionTime;
    }
    public void setMrChiefComplaint(String mrChiefComplaint) 
    {
        this.mrChiefComplaint = mrChiefComplaint;
    }

    public String getMrChiefComplaint() 
    {
        return mrChiefComplaint;
    }
    public void setMrPresentIllness(String mrPresentIllness) 
    {
        this.mrPresentIllness = mrPresentIllness;
    }

    public String getMrPresentIllness() 
    {
        return mrPresentIllness;
    }
    public void setMrHistoryIllness(String mrHistoryIllness) 
    {
        this.mrHistoryIllness = mrHistoryIllness;
    }

    public String getMrHistoryIllness() 
    {
        return mrHistoryIllness;
    }
    public void setMrImgPerformance(String mrImgPerformance) 
    {
        this.mrImgPerformance = mrImgPerformance;
    }

    public String getMrImgPerformance() 
    {
        return mrImgPerformance;
    }
    public void setMrCreattime(Date mrCreattime) 
    {
        this.mrCreattime = mrCreattime;
    }

    public Date getMrCreattime() 
    {
        return mrCreattime;
    }
    public void setMrModify(Date mrModify) 
    {
        this.mrModify = mrModify;
    }

    public Date getMrModify() 
    {
        return mrModify;
    }
    public void setMrDelete(String mrDelete) 
    {
        this.mrDelete = mrDelete;
    }

    public String getMrDelete() 
    {
        return mrDelete;
    }
    public void setMrImgId(String mrImgId) 
    {
        this.mrImgId = mrImgId;
    }

    public String getMrImgId() 
    {
        return mrImgId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("mrId", getMrId())
            .append("mrUsrName", getMrUsrName())
            .append("mrParId", getMrParId())
            .append("mrPatientName", getMrPatientName())
            .append("mrPatientSex", getMrPatientSex())
            .append("mrAcquisitionTime", getMrAcquisitionTime())
            .append("mrChiefComplaint", getMrChiefComplaint())
            .append("mrPresentIllness", getMrPresentIllness())
            .append("mrHistoryIllness", getMrHistoryIllness())
            .append("mrImgPerformance", getMrImgPerformance())
            .append("mrCreattime", getMrCreattime())
            .append("mrModify", getMrModify())
            .append("mrDelete", getMrDelete())
            .append("mrImgId", getMrImgId())
            .toString();
    }
}
