package com.artamonov.aps.aps.service;

import com.artamonov.aps.aps.DTO.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService{
        //security logic
        boolean save(UserDTO userDTO);
}