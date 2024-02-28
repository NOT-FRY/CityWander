package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    UserDto findByEmail(String email);

    UserDto findByUsername(String username);

    void insert(UserDto user);
    void insertEsercente(UserDto user);

    void updateUser(UserDto user);
}
