package cn.qihangerp.api;

import com.alibaba.nacos.common.model.RestResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;
@Configuration
public class TokenFilter implements GlobalFilter, Ordered {
    private static final String TOKEN_HEADER = "Authorization";
    private static final String TOKEN_PREFIX = "Bearer ";
    private static final String SECRET_KEY = "mysecretkey235200303325adjjeddd";
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        // 先验证
        String token = exchange.getRequest().getHeaders().getFirst(TOKEN_HEADER);
//        System.out.println("Token:"+token);
        String url = exchange.getRequest().getURI().getPath();
//        System.out.println("intercept " + url);
        if(url.equals("/api/sys-api/login") || url.equals("/api/sys-api/getInfo") || url.equals("/api/sys-api/logout")
                || url.contains("/api/oms-api/images/preview")
                || url.contains("/order/get_detail")
                || url.contains("/refund/get_detail")
                || url.contains("/license/getLicense")
                || url.contains("/help/")
                || url.contains("/open/")
                || url.contains("/system/config")
                || url.contains("/captchaImage")
                || url.contains("/login")
                || url.contains("dou/msg")
                || url.contains("wei/msg")
        ){
//            System.out.println("====放行===="+url);
            // 登录页面 放行
            return chain.filter(exchange);
        }
        // TODO: 统一鉴权处理
        if(!StringUtils.hasText(token)){
            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
            ServerHttpResponse response = exchange.getResponse();
            DataBufferFactory bufferFactory = response.bufferFactory();
            ObjectMapper objectMapper = new ObjectMapper();
            // 要写入的数据对象，会自动转为json格式
            DataBuffer wrap = null;
            try {
                wrap = bufferFactory.wrap(objectMapper.writeValueAsBytes(new RestResult<>(401, "没有Authorization")));
                DataBuffer finalWrap = wrap;
                return response.writeWith(Mono.fromSupplier(() -> finalWrap));
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
//            return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return -10000;
    }
}
