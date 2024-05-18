package cn.qihangerp.service.ship;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@ComponentScan("cn.qihangerp")
@EnableDubbo
@SpringBootApplication
public class ShipService
{
    public static void main( String[] args )
    {
        System.out.println( "Hello Ship-Service!" );
        SpringApplication.run(ShipService.class, args);
    }
}
