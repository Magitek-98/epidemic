package com.magitek.epidemic.mapper;

import com.magitek.epidemic.beans.ProvinceInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProvinceMapper {

    @Select(value = "select p.province_id,p.province_name,p.province_py from provinces p where  p.province_id not in ( " +
            " select e.province_id from epidemic e where e.data_year = #{arg0} AND e.data_month=#{arg1} and data_day = #{arg2} " +
            ") ORDER BY p.province_id LIMIT 0,6;")
    List<ProvinceInfo> findNoDataProvinces(int year, int month, int day);
}
