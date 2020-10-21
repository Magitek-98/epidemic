package com.magitek.epidemic.serviceimpl;

import com.magitek.epidemic.beans.DailyEpidemicInfo;
import com.magitek.epidemic.beans.EpidemicDetailInfo;
import com.magitek.epidemic.beans.EpidemicInfo;
import com.magitek.epidemic.beans.ProvinceInfo;
import com.magitek.epidemic.mapper.EpidemicMapper;
import com.magitek.epidemic.mapper.ProvinceMapper;
import com.magitek.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicMapper epidemicMapper;

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> saveData(DailyEpidemicInfo dailyEpidemicInfo, Integer userId) {
        Date current = new Date();
        String[] ymd = dailyEpidemicInfo.getDate().split("-");
        int year = 0,month=0,day=0;
        year = Integer.parseInt(ymd[0]);
        month=Integer.parseInt(ymd[1]);
        day=Integer.parseInt(ymd[2]);
        for (EpidemicInfo epidemicInfo:dailyEpidemicInfo.getArray()) {
            //设置录入该数据的用户编号
            epidemicInfo.setUserId(userId);
            //设置数据的录入日期
            epidemicInfo.setDataYear(year);
            epidemicInfo.setDataMonth(month);
            epidemicInfo.setDataDay(day);
            epidemicInfo.setInputDate(current);
            epidemicMapper.saveInfo(epidemicInfo);
        }
        return provinceMapper.findNoDataProvinces(year,month,day);
    }

    @Override
    public List<EpidemicDetailInfo> findLastData() {
        //查询每个省份的累计数量和当日新增数量
        Calendar calendar  = new GregorianCalendar();
        int year=0,month=0,day=0;
        year = (int)calendar.get(Calendar.YEAR);
        month = (int)(calendar.get(Calendar.MONTH)+1);
        day = (int)calendar.get(Calendar.DATE);
        Map<String,Integer> condition = new HashMap<>();
        condition.put("year",year);
        condition.put("month",month);
        condition.put("day",day);
        List<EpidemicDetailInfo> list = epidemicMapper.findLastData(condition);
        return list;
    }
}
