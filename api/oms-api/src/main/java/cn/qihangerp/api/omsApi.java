package cn.qihangerp.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class omsApi {
    public static void main( String[] args )
    {
        SpringApplication.run(omsApi.class, args);
    }
}
