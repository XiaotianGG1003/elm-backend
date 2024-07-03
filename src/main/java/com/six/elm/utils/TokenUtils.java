package com.six.elm.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;

public class TokenUtils {
    private static final String SECRET_KEY = "elmabcdefg";
    //产生token
    public static String createToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setExpiration(new Date(System.currentTimeMillis() + 864000000)) // 毫秒10 days:
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                .compact();
    }
    //验证token
    public static boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(SECRET_KEY).parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
