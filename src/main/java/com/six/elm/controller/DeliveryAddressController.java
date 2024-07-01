package com.six.elm.controller;

import java.util.List;

import com.six.elm.po.DeliveryAddress;
import com.six.elm.service.DeliveryAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/DeliveryAddressController")
public class DeliveryAddressController {
    @Autowired
    private DeliveryAddressService deliveryAddressService;
    @RequestMapping("/listDeliveryAddressByUserId")
    public List<DeliveryAddress> listDeliveryAddressByUserId(DeliveryAddress deliveryAddress) throws Exception{
        return deliveryAddressService.listDeliveryAddressByUserId(deliveryAddress.getUserId());
    }
    @RequestMapping("/getDeliveryAddressById")
    public DeliveryAddress getDeliveryAddressById(DeliveryAddress deliveryAddress) throws Exception{
        return deliveryAddressService.getDeliveryAddressById(deliveryAddress.getDaId());
    }
    @RequestMapping("/saveDeliveryAddress")
    public int saveDeliveryAddress(DeliveryAddress deliveryAddress) throws Exception{
        return deliveryAddressService.saveDeliveryAddress(deliveryAddress);
    }
    @RequestMapping("/updateDeliveryAddress")
    public int updateDeliveryAddress(DeliveryAddress deliveryAddress) throws Exception{
        return deliveryAddressService.updateDeliveryAddress(deliveryAddress);
    }
    @RequestMapping("/removeDeliveryAddress")
    public int removeDeliveryAddress(DeliveryAddress deliveryAddress) throws Exception{
        return deliveryAddressService.removeDeliveryAddress(deliveryAddress.getDaId());
    }
}
