package com.artamonov.aps.aps;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class ApsApplication {

    public static void main(String[] args) {
        //SpringApplication.run(ApsApplication.class, args);
        ConfigurableApplicationContext context = SpringApplication.run(ApsApplication.class, args);
        PasswordEncoder encoder = context.getBean(PasswordEncoder.class);
        System.out.println(encoder.encode("pass"));
    }

}
