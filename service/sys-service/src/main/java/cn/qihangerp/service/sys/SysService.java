package cn.qihangerp.service.sys;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@ComponentScan("cn.qihangerp")
@SpringBootApplication
public class SysService
{
    public static void main( String[] args )
    {
        System.out.println( "Hello Sys-Service!" );
        SpringApplication.run(SysService.class, args);
    }
}
