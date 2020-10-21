package com.magitek.epidemic.controller;

import com.magitek.epidemic.beans.*;
import com.magitek.epidemic.service.EpidemicService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {
    private Logger logger = Logger.getLogger(EpidemicController.class);

    @Autowired
    private EpidemicService epidemicService;

    @PostMapping("/ajax/input")
    @ResponseBody
    public AjaxResponseInfo inputData(@RequestBody DailyEpidemicInfo dailyEpidemicInfo, Model model, HttpSession session) {
        logger.debug(dailyEpidemicInfo.getDate().toString() + "-" + dailyEpidemicInfo.getArray().size());
        AjaxResponseInfo responseInfo = new AjaxResponseInfo();
        //从session中取得当前登录系统用户的信息
        UserInfo user = (UserInfo) session.getAttribute("loginedUser");
        if (user == null) {
            responseInfo.setCode(-2); //没有权限
            responseInfo.setMsg("你还没有登录！");
        } else {
            //保存数据
            List<ProvinceInfo> list = epidemicService.saveData(dailyEpidemicInfo, user.getUserId());
            responseInfo.setData(list);
        }
        return responseInfo;
    }

    @RequestMapping("/ajax/lastData")
    @ResponseBody
    public AjaxResponseInfo findLastData(){
        AjaxResponseInfo responseInfo = new AjaxResponseInfo();
        List<EpidemicDetailInfo> list = epidemicService.findLastData();
        responseInfo.setData(list);
        return responseInfo;
    }
}
