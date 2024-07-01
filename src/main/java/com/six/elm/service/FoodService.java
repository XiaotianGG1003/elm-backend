package com.six.elm.service;

import com.six.elm.po.Food;
import java.util.List;

public interface FoodService {
    public List<Food> listFoodByBusinessId(Integer businessId);
}