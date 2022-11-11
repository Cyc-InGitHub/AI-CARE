package com.aicare.web.controller.medical;

import com.aicare.common.core.domain.entity.SysUser;
import com.aicare.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test/index")
public class test {

    private String prefix = "medical" ;

    /**
     * 跳转一个页面
     */
    @GetMapping("/medical")
    public String test() {

        return prefix + "/diagnostic-reasoning" ;

    }
    /**
     * 跳转一个页面
     */
    @GetMapping("/medicalSub")
    public String test2() {

        return prefix + "/medical-subjects" ;

    }
    /**
     * 跳转一个页面
     */
    @GetMapping("/medicalView")
    public String test3() {

        return "imageView/view_image_H" ;

    }

    /**
     * 与数据库交互
     */
    @Autowired
    private TestService testService;
    @GetMapping("/selecet")
    public  void selcet() {
        System.out.println("1111111111");
        List<SysUser> userList = testService.selcet();
        System.out.println("userList");
    }

}

