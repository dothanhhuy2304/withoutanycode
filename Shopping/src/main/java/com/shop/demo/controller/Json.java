package com.shop.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Component
public class Json {
    //chuyển đổi giữa class model và JSON
    static ObjectMapper mapper = new ObjectMapper();

    public static void writeObject(HttpServletResponse response, Object object) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        try {
            mapper.writeValue(response.getOutputStream(), object);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void writePairs(HttpServletResponse response, Object... pairs) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        for (int i = 0; i < pairs.length; i += 2) {
            map.put(pairs[i], pairs[i + 1]);
        }
        Json.writeObject(response, map);
    }
}
