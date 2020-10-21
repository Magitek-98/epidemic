package com.magitek.epidemic.serviceimpl;

import com.magitek.epidemic.beans.ProvinceInfo;
import com.magitek.epidemic.mapper.ProvinceMapper;
import com.magitek.epidemic.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> findNoDataProvinces(String date) {
        int year = 0, month = 0, day = 0;
        String[] array = date.split("-");
        List<ProvinceInfo> list = null;
        if (array.length >= 3) {
            year = Integer.parseInt(array[0]);
            month = Integer.parseInt(array[1]);
            day = Integer.parseInt(array[2]);
            list = provinceMapper.findNoDataProvinces(year, month, day);
        }
        return list;
    }
}
