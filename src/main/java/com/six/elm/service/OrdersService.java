package com.six.elm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.six.elm.po.Orders;
import java.util.List;

public interface OrdersService extends IService<Orders> {
    public int createOrders(Orders orders);
    public Orders getOrdersById(Integer orderId);
    public List<Orders> listOrdersByUserId(String userId);
}