package com.six.elm.controller;

import com.six.elm.po.Food;
import com.six.elm.service.FoodService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/FoodController")
public class FoodController {
    @Autowired
    private FoodService foodService;
    @RequestMapping("/listFoodByBusinessId")
    public List<Food> listFoodByBusinessId(Food food) throws Exception{
        return foodService.listFoodByBusinessId(food.getBusinessId());
    }
}
