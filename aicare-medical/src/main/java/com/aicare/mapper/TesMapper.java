package com.aicare.mapper;

import com.aicare.common.core.domain.entity.SysUser;
import com.aicare.domain.MedicalMr;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * medical-mrMapper接口
 *
 * @author ruoyi
 * @date 2022-09-30
 */
@Repository
public interface TesMapper {
    public List<SysUser> selectU();

}
