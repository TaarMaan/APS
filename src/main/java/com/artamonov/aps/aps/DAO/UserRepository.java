package com.artamonov.aps.aps.DAO;

import com.artamonov.aps.aps.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findFirstByName(String name);
}
