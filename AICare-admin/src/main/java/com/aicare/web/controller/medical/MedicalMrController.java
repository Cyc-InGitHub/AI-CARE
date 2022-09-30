package com.aicare.web.controller.medical;


import com.aicare.common.annotation.Log;
import com.aicare.common.core.controller.BaseController;
import com.aicare.common.core.domain.AjaxResult;
import com.aicare.common.core.page.TableDataInfo;
import com.aicare.common.enums.BusinessType;
import com.aicare.common.utils.poi.ExcelUtil;
import com.aicare.domain.MedicalMr;
import com.aicare.service.IMedicalMrService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * medical-mrController
 * 
 * @author ruoyi
 * @date 2022-09-30
 */
@Controller
@RequestMapping("/medical/mr")
public class MedicalMrController extends BaseController
{
    private String prefix = "medical/mr";

    @Autowired
    private IMedicalMrService medicalMrService;

    @RequiresPermissions("medical:mr:view")
    @GetMapping()
    public String mr()
    {
        return prefix + "/mr";
    }

    /**
     * 查询medical-mr列表
     */
    @RequiresPermissions("medical:mr:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MedicalMr medicalMr)
    {
        startPage();
        List<MedicalMr> list = medicalMrService.selectMedicalMrList(medicalMr);
        return getDataTable(list);
    }

    /**
     * 导出medical-mr列表
     */
    @RequiresPermissions("medical:mr:export")
    @Log(title = "medical-mr", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MedicalMr medicalMr)
    {
        List<MedicalMr> list = medicalMrService.selectMedicalMrList(medicalMr);
        ExcelUtil<MedicalMr> util = new ExcelUtil<MedicalMr>(MedicalMr.class);
        return util.exportExcel(list, "medical-mr数据");
    }

    /**
     * 新增medical-mr
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存medical-mr
     */
    @RequiresPermissions("medical:mr:add")
    @Log(title = "medical-mr", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MedicalMr medicalMr)
    {
        return toAjax(medicalMrService.insertMedicalMr(medicalMr));
    }

    /**
     * 修改medical-mr
     */
    @RequiresPermissions("medical:mr:edit")
    @GetMapping("/edit/{mrId}")
    public String edit(@PathVariable("mrId") String mrId, ModelMap mmap)
    {
        MedicalMr medicalMr = medicalMrService.selectMedicalMrByMrId(mrId);
        mmap.put("medicalMr", medicalMr);
        return prefix + "/edit";
    }

    /**
     * 修改保存medical-mr
     */
    @RequiresPermissions("medical:mr:edit")
    @Log(title = "medical-mr", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MedicalMr medicalMr)
    {
        return toAjax(medicalMrService.updateMedicalMr(medicalMr));
    }

    /**
     * 删除medical-mr
     */
    @RequiresPermissions("medical:mr:remove")
    @Log(title = "medical-mr", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(medicalMrService.deleteMedicalMrByMrIds(ids));
    }
}
