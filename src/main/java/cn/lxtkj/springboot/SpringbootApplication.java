package cn.lxtkj.springboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 1.mybatis启动方式可以在mapper层不需要加mapper注解，但是一定要在启动类的时候加上@MapperScan
 * 2.mybatis在mybatis接口加上@Mapper注入mybatis容器，就不需要在启动类的时候加上@MapperScan
 */
@SpringBootApplication
@MapperScan(basePackages = {"cn.lxtkj.springboot.mapper"})
public class SpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootApplication.class, args);
	}

}
