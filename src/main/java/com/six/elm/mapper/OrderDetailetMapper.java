package com.six.elm.mapper;

import java.util.List;

import com.six.elm.po.OrderDetailet;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface OrderDetailetMapper {
    public int saveOrderDetailetBatch(List<OrderDetailet> list);
    public List<OrderDetailet> listOrderDetailetByOrderId(Integer orderOd);
}
