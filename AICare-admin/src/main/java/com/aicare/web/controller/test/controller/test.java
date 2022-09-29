package com.aicare.web.controller.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/index")
public class test {

    private String prefix = "test" ;

    /**
     * 跳转一个页面
     */
    @GetMapping("/test")
    public String test() {

        return prefix + "/test" ;

    }

}

