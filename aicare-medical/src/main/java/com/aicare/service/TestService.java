package com.aicare.service;


import com.aicare.common.core.domain.entity.SysUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestService {
    List<SysUser> selcet();

}
