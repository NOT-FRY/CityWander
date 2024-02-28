package it.itsvil.citywanderbackend.dao.impl;

import it.itsvil.citywanderbackend.dao.UserDao;
import it.itsvil.citywanderbackend.dto.UserDto;
import it.itsvil.citywanderbackend.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    private final UserMapper mapper;

   @Autowired
   public UserDaoImpl(UserMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void updateUser(UserDto user) {
        mapper.updateUser(user);
    }

    public UserDto findUserByEmail(String email){
        return mapper.findByEmail(email);
    }

}
