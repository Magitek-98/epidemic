package com.magitek.epidemic.service;

import com.magitek.epidemic.beans.ProvinceInfo;

import java.util.List;

public interface ProvinceService {
    /**
     * 获取还未录入数据的省份列表
     * @return
     */
    List<ProvinceInfo> findNoDataProvinces(String date);
}
