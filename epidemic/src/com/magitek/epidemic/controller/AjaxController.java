package com.magitek.epidemic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {

    @RequestMapping("/ajaxdemo")
    @ResponseBody
    public String ajaxDemo(String username){
        System.out.println("username:"+username);
        return username;
    }
}
