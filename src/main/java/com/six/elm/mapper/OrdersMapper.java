package com.six.elm.mapper;

import com.six.elm.po.Orders;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrdersMapper {
    Orders getOrdersById(Integer orderId);

    List<Orders> listOrdersByUserId(String userId);

    void saveOrders(Orders orders);
}
