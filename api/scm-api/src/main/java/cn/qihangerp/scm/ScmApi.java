package cn.qihangerp.scm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * Hello world!
 *
 */
@ComponentScan(basePackages={"cn.qihangerp"})
@SpringBootApplication
public class ScmApi {
    public static void main( String[] args )
    {
        SpringApplication.run(ScmApi.class, args);
    }
}
