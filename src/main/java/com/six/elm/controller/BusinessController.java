package com.six.elm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.six.elm.po.Business;
import com.six.elm.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

@RestController
@RequestMapping("/BusinessController")
public class BusinessController {
    @Autowired
    private BusinessService businessService;
    @RequestMapping("/listBusinessByOrderTypeId")
    public List<Business> listBusinessByOrderTypeId(Business business) throws Exception{
        return businessService.listBusinessByOrderTypeId(business.getOrderTypeId());
    }
    @RequestMapping("/getBusinessById")
    public Business getBusinessById(Business business) throws Exception{
        return businessService.getBusinessById(business.getBusinessId());
    }

    @GetMapping("/getBusiness")
    public List<Business> getBusiness() {
        QueryWrapper<Business> queryWrapper = new QueryWrapper<>();
        return businessService.list(queryWrapper);
    }

    @RequestMapping("/getBusinessByName")
    public List<Business> getBusinessByName(Business business){
        QueryWrapper<Business> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("businessName",business.getBusinessName());
        return businessService.list(queryWrapper);
    }
}



