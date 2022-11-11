package com.aicare.web.controller.medical;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.aicare.domain.MedicalDataType;
import com.aicare.service.IMedicalDataTypeService;
import com.aicare.common.core.controller.BaseController;
import com.aicare.common.core.domain.AjaxResult;
import com.aicare.common.utils.poi.ExcelUtil;
import com.aicare.common.core.page.TableDataInfo;
import com.aicare.web.controller.tool.R;
import com.aicare.common.utils.CommUtil;
import com.aicare.common.utils.PageUtils2;
import com.aicare.common.utils.Query;
import com.aicare.form.MedicalDataTypeLastLevelForm;

/**
 * 医学数据案例类型Controller
 * 
 * @author zhyl
 * @date 2022-10-05
 */
@Controller
@RequestMapping("/medical/type")
public class MedicalDataTypeController extends BaseController
{
    private String prefix = "medical/type";

    @Autowired
    private IMedicalDataTypeService medicalDataTypeService;

    @RequiresPermissions("medical:type:view")
    @GetMapping()
    public String type()
    {
        return prefix + "/type";
    }

    /**
     * 根据type_id查询树级结构
     *
     * @param medicalDataType
     * @return
     */
    @RequiresPermissions("medical:type:treelist")
    @PostMapping("/treelist")
    @ResponseBody
    public R selectAll(MedicalDataType medicalDataType){
        startPage();
        List<Map<String, Object>> list = medicalDataTypeService.selectTreeList(medicalDataType.getTypeId());
        List<Map<String, Object>> tree = CommUtil.buildTreeMap(list, "type_id", "parent_id", "type_name", "is_final", "level_num");
        List<Map<String, Object>> children = (List<Map<String, Object>>) tree.get(0).get("children");
        return R.ok().put("treeList", children);
    };

    @RequiresPermissions("medical:type:treelist")
    @PostMapping("/selectlastlevel")
    @ResponseBody
    public PageUtils2 selectLastLevel(MedicalDataTypeLastLevelForm medicalDataTypeLastLevelForm) {
        Map<String, Object> params = new HashMap<>();
        //Id数据
        List<Long> typeIds = new ArrayList<>();
        long a = medicalDataTypeLastLevelForm.getTypeId();
        //查询当前传入id数据
        MedicalDataType detail = medicalDataTypeService.getDataType(medicalDataTypeLastLevelForm.getTypeId());
        //结果集
        List<Map<String, Object>> resultList = new ArrayList<>();
        //查询结果数量
        Integer count = 0;
        if (detail.getIsFinal() == 1) {
            typeIds.add(medicalDataTypeLastLevelForm.getTypeId());
        } else {
            List<MedicalDataType> subList = medicalDataTypeService.selectTypeByParent(medicalDataTypeLastLevelForm.getTypeId());
            typeIds = getSubjectIds(typeIds, subList);
        }
        params.put("page", medicalDataTypeLastLevelForm.getPage());
        params.put("limit", 10);
        params.put("typeIds", typeIds);
        Query query = new Query(params);
        //检查技术
        if (detail.getTopTypeId() == 1) {
            //选择的是最后一级,不组装数据
            resultList = medicalDataTypeService.selectLastLevelService(query);
            count = medicalDataTypeService.selectLastLevelCount(query);
        } else {
            resultList = medicalDataTypeService.selectDicomData(query);
            count = medicalDataTypeService.selectDicomDataCount(query);
        }
        PageUtils2 pageUtils = new PageUtils2(resultList, count);
        return pageUtils;
    }


    /**
     * 查询医学数据案例类型列表
     */
    @RequiresPermissions("medical:type:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MedicalDataType medicalDataType)
    {
        startPage();
        List<MedicalDataType> list = medicalDataTypeService.selectMedicalDataTypeList(medicalDataType);
        return getDataTable(list);
    }

    /**
     * 导出医学数据案例类型列表
     */
    @RequiresPermissions("medical:type:export")
    @Log(title = "医学数据案例类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MedicalDataType medicalDataType)
    {
        List<MedicalDataType> list = medicalDataTypeService.selectMedicalDataTypeList(medicalDataType);
        ExcelUtil<MedicalDataType> util = new ExcelUtil<MedicalDataType>(MedicalDataType.class);
        return util.exportExcel(list, "医学数据案例类型数据");
    }

    /**
     * 新增医学数据案例类型
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存医学数据案例类型
     */
    @RequiresPermissions("medical:type:add")
    @Log(title = "医学数据案例类型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MedicalDataType medicalDataType)
    {
        return toAjax(medicalDataTypeService.insertMedicalDataType(medicalDataType));
    }

    /**
     * 修改医学数据案例类型
     */
    @RequiresPermissions("medical:type:edit")
    @GetMapping("/edit/{typeId}")
    public String edit(@PathVariable("typeId") Long typeId, ModelMap mmap)
    {
        MedicalDataType medicalDataType = medicalDataTypeService.selectMedicalDataTypeByTypeId(typeId);
        mmap.put("medicalDataType", medicalDataType);
        return prefix + "/edit";
    }

    /**
     * 修改保存医学数据案例类型
     */
    @RequiresPermissions("medical:type:edit")
    @Log(title = "医学数据案例类型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MedicalDataType medicalDataType)
    {
        return toAjax(medicalDataTypeService.updateMedicalDataType(medicalDataType));
    }

    /**
     * 删除医学数据案例类型
     */
    @RequiresPermissions("medical:type:remove")
    @Log(title = "医学数据案例类型", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(medicalDataTypeService.deleteMedicalDataTypeByTypeIds(ids));
    }

    /**
     * 递归拼装类型数据Id
     *
     * @param typeIds
     * @param typeList
     * @return
     */
    public List<Long> getSubjectIds(List<Long> typeIds, List<MedicalDataType> typeList) {
        for (int i = 0; i < typeList.size(); i++) {
            if (typeList.get(i).getIsFinal() == 0) {
                List<MedicalDataType> typeListNew = medicalDataTypeService.selectTypeByParent(typeList.get(i).getTypeId());
                typeIds = getSubjectIds(typeIds, typeListNew);
            } else {
                typeIds.add(typeList.get(i).getTypeId());
            }
        }
        return typeIds;
    }
}
