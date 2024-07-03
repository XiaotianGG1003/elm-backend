package com.six.elm.config;

import com.six.elm.utils.TokenUtils;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
@Slf4j
public class AuthenticationInterceptor implements HandlerInterceptor {
    //发请求前处理
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (HttpMethod.OPTIONS.toString().equals(request.getMethod()))
            return true;

        //1. 获取token  ，通过header ： Authorization
        String token = request.getHeader("authorization");
        //2. 验证token
        boolean flag =  TokenUtils.validateToken(token);
        if(token != null && !token.isEmpty() && flag){
            //验证通过
            return true; //继续放行，继续进行后面操作
        }
        log.error("-----token验证失败");
        //抛出异常
        response.setStatus(401);
        return false;
    }
}
