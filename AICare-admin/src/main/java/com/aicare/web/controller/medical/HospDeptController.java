package com.aicare.web.controller.medical;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aicare.common.annotation.Log;
import com.aicare.common.enums.BusinessType;
import com.aicare.domain.HospDept;
import com.aicare.service.IHospDeptService;
import com.aicare.common.core.controller.BaseController;
import com.aicare.common.core.domain.AjaxResult;
import com.aicare.common.utils.poi.ExcelUtil;
import com.aicare.common.core.page.TableDataInfo;

/**
 * 医学数据科目Controller
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Controller
@RequestMapping("/medical/dept")
public class HospDeptController extends BaseController
{
    private String prefix = "medical/dept";

    @Autowired
    private IHospDeptService hospDeptService;

    @RequiresPermissions("medical:dept:view")
    @GetMapping()
    public String dept()
    {
        return prefix + "/dept";
    }

    /**
     * 查询医学数据科目列表
     */
    @RequiresPermissions("medical:dept:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(HospDept hospDept)
    {
        startPage();
        List<HospDept> list = hospDeptService.selectHospDeptList(hospDept);
        return getDataTable(list);
    }

    /**
     * 导出医学数据科目列表
     */
    @RequiresPermissions("medical:dept:export")
    @Log(title = "医学数据科目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(HospDept hospDept)
    {
        List<HospDept> list = hospDeptService.selectHospDeptList(hospDept);
        ExcelUtil<HospDept> util = new ExcelUtil<HospDept>(HospDept.class);
        return util.exportExcel(list, "医学数据科目数据");
    }

    /**
     * 新增医学数据科目
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存医学数据科目
     */
    @RequiresPermissions("medical:dept:add")
    @Log(title = "医学数据科目", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(HospDept hospDept)
    {
        return toAjax(hospDeptService.insertHospDept(hospDept));
    }

    /**
     * 修改医学数据科目
     */
    @RequiresPermissions("medical:dept:edit")
    @GetMapping("/edit/{deptId}")
    public String edit(@PathVariable("deptId") Integer deptId, ModelMap mmap)
    {
        HospDept hospDept = hospDeptService.selectHospDeptByDeptId(deptId);
        mmap.put("hospDept", hospDept);
        return prefix + "/edit";
    }

    /**
     * 修改保存医学数据科目
     */
    @RequiresPermissions("medical:dept:edit")
    @Log(title = "医学数据科目", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(HospDept hospDept)
    {
        return toAjax(hospDeptService.updateHospDept(hospDept));
    }

    /**
     * 删除医学数据科目
     */
    @RequiresPermissions("medical:dept:remove")
    @Log(title = "医学数据科目", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(hospDeptService.deleteHospDeptByDeptIds(ids));
    }

    /**
     * 查询医学数据科目名称并根据order_num排序
     * */
    @RequiresPermissions("medical:dept:deptlist")
    @PostMapping("/deptlist")
    @ResponseBody
    public List deptlist()
    {
        //startPage();
        List<Map<String, Object>> list = hospDeptService.selectHospDeptNameListOrder();
        return list;
    }
}
