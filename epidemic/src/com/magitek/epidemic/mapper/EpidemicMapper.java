package com.magitek.epidemic.mapper;

import com.magitek.epidemic.beans.EpidemicDetailInfo;
import com.magitek.epidemic.beans.EpidemicInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface EpidemicMapper {

    /**
     * 保存疫情记录
     * @param epidemicInfo
     * @return
     */
    @Insert(value = "INSERT into epidemic(province_id,data_year,data_month,data_day,affirmed,suspected,isolated,dead,cured,user_id,input_date) " +
            "VALUES(#{provinceId},#{dataYear},#{dataMonth},#{dataDay},#{affirmed},#{suspected},#{isolated},#{dead},#{cured},#{userId},#{inputDate})")
    int saveInfo(EpidemicInfo epidemicInfo);


    @Select(value = "SELECT e1.province_id,temp.province_name,e1.data_year,e1.data_month,e1.data_day, " +
            " temp.affirmed_total,temp.suspected_total,temp.isolated_total,temp.cured_total,temp.dead_total,  " +
            " e1.affirmed,e1.suspected,e1.isolated,e1.cured,e1.dead  from epidemic e1 RIGHT JOIN( " +
            " SELECT e.province_id,province_name, " +
            " SUM(e.affirmed) affirmed_total, " +
            " SUM(e.suspected) suspected_total, " +
            " SUM(e.isolated) isolated_total, " +
            " SUM(e.cured) cured_total, " +
            " SUM(e.dead) dead_total from epidemic e  " +
            " RIGHT JOIN provinces p on e.province_id=p.province_id  " +
            " GROUP BY e.province_id,province_name  " +
            ") temp on e1.province_id=temp.province_id  " +
            "where e1.data_year = 2020 and e1.data_month=10 and e1.data_day = 18;")
    List<EpidemicDetailInfo> findLastData(Map<String, Integer> condition);
}
