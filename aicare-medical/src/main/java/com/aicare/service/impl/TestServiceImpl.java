package com.aicare.service.impl;

import com.aicare.common.core.domain.entity.SysUser;
import com.aicare.mapper.MedicalMrMapper;
import com.aicare.mapper.TesMapper;
import com.aicare.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TesMapper tesMapper;
    @Override
    public List<SysUser> selcet()
    {
        return tesMapper.selectU();
    }

}