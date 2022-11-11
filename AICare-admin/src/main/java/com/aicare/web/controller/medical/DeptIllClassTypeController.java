package com.aicare.web.controller.medical;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aicare.common.utils.PageUtils2;
import com.aicare.common.utils.Query;
import com.aicare.domain.MedicalDataType;
import com.aicare.form.DeptIllClassForm;
import com.aicare.form.DeptIllClassTypeForm;
import com.aicare.form.MedicalDataTypeLastLevelForm;
import io.swagger.annotations.ApiOperation;
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
import com.aicare.domain.DeptIllClassType;
import com.aicare.service.IDeptIllClassTypeService;
import com.aicare.common.core.controller.BaseController;
import com.aicare.common.core.domain.AjaxResult;
import com.aicare.common.utils.poi.ExcelUtil;
import com.aicare.common.core.page.TableDataInfo;
import com.aicare.web.controller.tool.R;

/**
 * 科室疾病子类类型Controller
 * 
 * @author zhyl
 * @date 2022-10-07
 */
@Controller
@RequestMapping("/medical/classtype")
public class DeptIllClassTypeController extends BaseController
{
    private String prefix = "medical/classtype";

    @Autowired
    private IDeptIllClassTypeService deptIllClassTypeService;

    @RequiresPermissions("medical:classtype:view")
    @GetMapping()
    public String classtype()
    {
        return prefix + "/classtype";
    }

    /**
     * 查询科室疾病子类类型列表
     */
    @RequiresPermissions("medical:classtype:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(DeptIllClassType deptIllClassType)
    {
        startPage();
        List<DeptIllClassType> list = deptIllClassTypeService.selectDeptIllClassTypeList(deptIllClassType);
        return getDataTable(list);
    }

    /**
     * 导出科室疾病子类类型列表
     */
    @RequiresPermissions("medical:classtype:export")
    @Log(title = "科室疾病子类类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(DeptIllClassType deptIllClassType)
    {
        List<DeptIllClassType> list = deptIllClassTypeService.selectDeptIllClassTypeList(deptIllClassType);
        ExcelUtil<DeptIllClassType> util = new ExcelUtil<DeptIllClassType>(DeptIllClassType.class);
        return util.exportExcel(list, "科室疾病子类类型数据");
    }

    /**
     * 新增科室疾病子类类型
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存科室疾病子类类型
     */
    @RequiresPermissions("medical:classtype:add")
    @Log(title = "科室疾病子类类型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(DeptIllClassType deptIllClassType)
    {
        return toAjax(deptIllClassTypeService.insertDeptIllClassType(deptIllClassType));
    }

    /**
     * 修改科室疾病子类类型
     */
    @RequiresPermissions("medical:classtype:edit")
    @GetMapping("/edit/{typeId}")
    public String edit(@PathVariable("typeId") Long typeId, ModelMap mmap)
    {
        DeptIllClassType deptIllClassType = deptIllClassTypeService.selectDeptIllClassTypeByTypeId(typeId);
        mmap.put("deptIllClassType", deptIllClassType);
        return prefix + "/edit";
    }

    /**
     * 修改保存科室疾病子类类型
     */
    @RequiresPermissions("medical:classtype:edit")
    @Log(title = "科室疾病子类类型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(DeptIllClassType deptIllClassType)
    {
        return toAjax(deptIllClassTypeService.updateDeptIllClassType(deptIllClassType));
    }

    /**
     * 删除科室疾病子类类型
     */
    @RequiresPermissions("medical:classtype:remove")
    @Log(title = "科室疾病子类类型", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(deptIllClassTypeService.deleteDeptIllClassTypeByTypeIds(ids));
    }

    /**
     * 根据父级ID查询科目疾病子类类型名称列表并排序
     */
    @RequiresPermissions("medical:classtype:typeList")
    @PostMapping("/typeList")
    @ResponseBody
    public List classTypeList(DeptIllClassTypeForm deptIllClassTypeForm)
    {
        //startPage();
        List<Map<String, Object>> list =
                deptIllClassTypeService.selectDeptIllClassTypeNameByParentId(deptIllClassTypeForm.getParentId());
        return list;
    }

    @RequiresPermissions("medical:classtype:TypeListPage")
    @PostMapping("/TypeListPage")
    @ResponseBody
    public PageUtils2 classTypeListPage(DeptIllClassTypeForm deptIllClassTypeForm) {
        Map<String, Object> params = new HashMap<>();
        //Id数据
        List<Integer> parentIds = new ArrayList<>();
        int a = deptIllClassTypeForm.getParentId();
        //查询当前传入id数据
        List<Map<String, Object>> list = deptIllClassTypeService.selectDeptIllClassTypeNameByParentId(deptIllClassTypeForm.getParentId());
        //结果集
        List<Map<String, Object>> resultList = new ArrayList<>();
        //查询结果数量
        Integer count = 0;

        parentIds.add(deptIllClassTypeForm.getParentId());

        params.put("page", deptIllClassTypeForm.getPage());
        params.put("limit", 10);
        params.put("parentIds", parentIds);
        Query query = new Query(params);

        resultList = deptIllClassTypeService.selectClassTypeList(query);
        count = deptIllClassTypeService.selectClassTypeListCount(query);

        PageUtils2 pageUtils = new PageUtils2(resultList, count);
        return pageUtils;
    }

    /**
     * 根据ID查询科目疾病子类类型名称
     */
    @RequiresPermissions("medical:classtype:typeLast")
    @PostMapping("/typeLast")
    @ResponseBody
    public List classTypeLast(DeptIllClassTypeForm deptIllClassTypeForm)
    {
        List<Map<String, Object>> list =
                deptIllClassTypeService.selectDeptIllClassTypeNameByTypeId(deptIllClassTypeForm.getTypeId());
        return list;
    }

    /**
     * 根据type_name对列表进行模糊查询
     *
     * @param deptIllClassTypeForm
     * @return
     */
    @RequiresPermissions("medical:classtype:fuzzysearch")
    @PostMapping("/fuzzysearch")
    @ResponseBody
    public R fuzzySearch(DeptIllClassTypeForm deptIllClassTypeForm) {
        List<Map<String, Object>> list = deptIllClassTypeService.fuzzySearchService(deptIllClassTypeForm.getTypeName(), deptIllClassTypeForm.getTopId());
        return R.ok().put("searchList", list);
    }
}
