package cn.qihangerp.vms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

//@EnableDiscoveryClient
@EnableFeignClients(basePackages = "cn.qihangerp.vms")
//@MapperScan("cn.qihangerp.openApi.mapper")
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class vmsApi {
    public static void main( String[] args )
    {
        System.out.println( "Hello vms-api!" );
        SpringApplication.run(vmsApi.class, args);
    }

}
