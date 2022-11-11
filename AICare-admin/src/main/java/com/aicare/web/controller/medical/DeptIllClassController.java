package com.aicare.web.controller.medical;

import java.util.List;
import java.util.Map;

import com.aicare.common.utils.CommUtil;
import com.aicare.form.DeptIllClassForm;
import com.aicare.web.controller.tool.R;
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
import com.aicare.domain.DeptIllClass;
import com.aicare.service.IDeptIllClassService;
import com.aicare.common.core.controller.BaseController;
import com.aicare.common.core.domain.AjaxResult;
import com.aicare.common.utils.poi.ExcelUtil;
import com.aicare.common.core.page.TableDataInfo;

/**
 * 科目疾病子类Controller
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Controller
@RequestMapping("/medical/classes")
public class DeptIllClassController extends BaseController
{
    private String prefix = "medical/classes";

    @Autowired
    private IDeptIllClassService deptIllClassService;

    @RequiresPermissions("medical:classes:view")
    @GetMapping()
    public String classes()
    {
        return prefix + "/classes";
    }

    /**
     * 查询科目疾病子类列表
     */
    @RequiresPermissions("medical:classes:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(DeptIllClass deptIllClass)
    {
        startPage();
        List<DeptIllClass> list = deptIllClassService.selectDeptIllClassList(deptIllClass);
        return getDataTable(list);
    }

    /**
     * 导出科目疾病子类列表
     */
    @RequiresPermissions("medical:classes:export")
    @Log(title = "科目疾病子类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DeptIllClass deptIllClass)
    {
        List<DeptIllClass> list = deptIllClassService.selectDeptIllClassList(deptIllClass);
        ExcelUtil<DeptIllClass> util = new ExcelUtil<DeptIllClass>(DeptIllClass.class);
        return util.exportExcel(list, "科目疾病子类数据");
    }

    /**
     * 新增科目疾病子类
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存科目疾病子类
     */
    @RequiresPermissions("medical:classes:add")
    @Log(title = "科目疾病子类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DeptIllClass deptIllClass)
    {
        return toAjax(deptIllClassService.insertDeptIllClass(deptIllClass));
    }

    /**
     * 修改科目疾病子类
     */
    @RequiresPermissions("medical:classes:edit")
    @GetMapping("/edit/{classId}")
    public String edit(@PathVariable("classId") Long classId, ModelMap mmap)
    {
        DeptIllClass deptIllClass = deptIllClassService.selectDeptIllClassByClassId(classId);
        mmap.put("deptIllClass", deptIllClass);
        return prefix + "/edit";
    }

    /**
     * 修改保存科目疾病子类
     */
    @RequiresPermissions("medical:classes:edit")
    @Log(title = "科目疾病子类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DeptIllClass deptIllClass)
    {
        return toAjax(deptIllClassService.updateDeptIllClass(deptIllClass));
    }

    /**
     * 删除科目疾病子类
     */
    @RequiresPermissions("medical:classes:remove")
    @Log(title = "科目疾病子类", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(deptIllClassService.deleteDeptIllClassByClassIds(ids));
    }

    /**
     * 根据父级ID查询科目疾病子类名称列表并排序
     */
    @RequiresPermissions("medical:classes:classesList")
    @PostMapping("/classesList")
    @ResponseBody
    public List classesList(DeptIllClassForm deptIllClassForm)
    {
        //startPage();
        List<Map<String, Object>> list = deptIllClassService.selectDeptIllClassNameByParentId(deptIllClassForm.getParentId());
        //List<Map<String, Object>> tree = CommUtil.buildTreeMap(list, "type_id", "parent_id", "type_name", "is_final", "level_num");
        //List<Map<String, Object>> children = (List<Map<String, Object>>) tree.get(0).get("children");
        //return R.ok().put("treeList", children);
        return list;
    }
}
