package com.six.elm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.six.elm.po.Orders;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {
    Orders getOrdersById(Integer orderId);

    List<Orders> listOrdersByUserId(String userId);


    @Select("insert into orders(userId, businessId, orderDate, orderTotal, daId, orderState) " +
            "values (#{orders.userId}, #{orders.businessId}, #{orders.orderDate}, #{orders.orderTotal}, #{orders.daId}, #{orders.orderState}   )")
    void saveOrders(Orders orders);
}
