package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.UserDto;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    public void updateUser(UserDto user);

    public UserDto findUserByEmail(String email);

}
