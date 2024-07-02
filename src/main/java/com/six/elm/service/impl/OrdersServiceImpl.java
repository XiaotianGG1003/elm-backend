package com.six.elm.service.impl;

import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.six.elm.mapper.CartMapper;
import com.six.elm.mapper.OrderDetailetMapper;
import com.six.elm.mapper.OrdersMapper;
import com.six.elm.po.Cart;
import com.six.elm.po.OrderDetailet;
import com.six.elm.po.Orders;
import com.six.elm.service.OrdersService;
import io.github.ljwlgl.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderDetailetMapper orderDetailetMapper;
    @Override
    @Transactional
    public int createOrders(Orders orders) {
        //1、查询当前用户购物车中当前商家的所有食品
        Cart cart = new Cart();
        cart.setUserId(orders.getUserId());
        cart.setBusinessId(orders.getBusinessId());
        List<Cart> cartList = cartMapper.listCart(cart);
        //2、创建订单（返回生成的订单编号）
        orders.setOrderDate(DateUtil.dateToString(new Date(), DateUtil.YYYYMMDDHHMMSS));
//        ordersMapper.saveOrders(orders);
        ordersMapper.insert(orders);
        int orderId = orders.getOrderId();
                //3、批量添加订单明细
        List<OrderDetailet> list = new ArrayList<>();
        for(Cart c : cartList) {
            OrderDetailet od = new OrderDetailet();
            od.setOrderId(orderId);
            od.setFoodId(c.getFoodId());
            od.setQuantity(c.getQuantity());
            list.add(od);
        }
        orderDetailetMapper.saveOrderDetailetBatch(list);
        //4、从购物车表中删除相关食品信息
        cartMapper.removeCart(cart);
        return orderId;
    }
    @Override
    public Orders getOrdersById(Integer orderId) {
        return ordersMapper.getOrdersById(orderId);
    }
    @Override
    public List<Orders> listOrdersByUserId(String userId){
        return ordersMapper.listOrdersByUserId(userId);
    }
}