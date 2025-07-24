package cn.qihangerp.store;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class StoreApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello store-api!" );
        SpringApplication.run(StoreApi.class, args);
    }
}
