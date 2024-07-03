package com.six.elm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.six.elm.po.Business;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BusinessMapper extends BaseMapper<Business>{
    @Select("select * from business where orderTypeId = #{orderTypeId} order by businessId")
    public List<Business> listBusinessByOrderTypeId(Integer orderTypeId);
    @Select("select * from business where businessId=#{businessId}")
    public Business getBusinessById(Integer businessId);
}
