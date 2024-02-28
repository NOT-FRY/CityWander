package it.itsvil.citywanderbackend.service;

import it.itsvil.citywanderbackend.dto.UserDto;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    boolean updateUser(UserDto user);

    public UserDto findUserByEmail(String email);

    boolean updateUserProfiling(String email, int numeroGiorni, String viaAlloggio, String coordinateAlloggio);

    public boolean addPointsToUser(String email, int pointsToAdd);

}
