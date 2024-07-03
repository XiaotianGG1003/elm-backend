package com.six.elm.controller;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.six.elm.po.Orders;
import com.six.elm.service.OrdersService;
import com.six.elm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/OrdersController")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;
    @RequestMapping("/createOrders")
    public int createOrders(Orders orders) throws Exception{
        return ordersService.createOrders(orders);
    }
    @RequestMapping("/getOrdersById")
    public Orders getOrdersById(Orders orders) throws Exception{
        return ordersService.getOrdersById(orders.getOrderId());
    }
    @RequestMapping("/listOrdersByUserId")
    public List<Orders> listOrdersByUserId(Orders orders) throws Exception{
        return ordersService.listOrdersByUserId(orders.getUserId());
    }

    @RequestMapping("/paymentByOrderId")
    public Boolean paymentByOrderId(Integer orderId) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setOrderState(1);
        return ordersService.updateById(orders);
    }

    @RequestMapping("/removeOrder")
    public Boolean removeOrder(Integer orderId){
        return ordersService.removeById(orderId);
    }
}
