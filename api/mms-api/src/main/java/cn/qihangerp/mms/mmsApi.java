package cn.qihangerp.mms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class mmsApi {
    public static void main( String[] args )
    {
        SpringApplication.run(mmsApi.class, args);
    }
}
