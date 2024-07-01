package com.six.elm.mapper;
import com.six.elm.po.Food;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface FoodMapper {
    @Select("select * from food where businessId=#{businessId} order by foodId")
    public List<Food> listFoodByBusinessId(Integer businessId);
    @Select("select * from food where foodId=#{foodId}")
    public Food getFoodById(Integer foodId);
}
