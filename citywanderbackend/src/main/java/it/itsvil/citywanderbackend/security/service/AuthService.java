package it.itsvil.citywanderbackend.security.service;

import it.itsvil.citywanderbackend.mapper.UserMapper;
import it.itsvil.citywanderbackend.security.model.*;
import it.itsvil.citywanderbackend.dto.UserDto;
import it.itsvil.citywanderbackend.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

  private final UserMapper userMapper;
  private final PasswordEncoder passwordEncoder;
  private final JwtService jwtService;
  private final AuthenticationManager authenticationManager;

  public AuthResponseDto login(LoginRequestDto request) {
    authenticationManager.authenticate(
      new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
    );
    var user = userMapper.findByEmail(request.getEmail());
    var jwt = jwtService.generateToken(user);
    return AuthResponseDto.builder()
      .token(jwt)
      .build();
  }

  public String currentUserName() {
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    if (principal instanceof UserDetails) {
      return ((UserDetails)principal).getUsername();
    } else {
      return principal.toString();
    }
  }

  public AuthResponseDto register(RegisterRequestDto request) {
    var user = UserDto.builder()
      .nome(request.getNome())
      .cognome(request.getCognome())
            .username(request.getUsername())
      .email(request.getEmail())
      .password(passwordEncoder.encode(request.getPassword()))
      .ruolo(Ruolo.TURISTA)
            .punti(0)
            .lingua(request.getLingua())
            .dataNascita(request.getDataNascita())
            .genere(request.getGenere())
            .telefono(request.getTelefono())
      .build();
    userMapper.insert(user);
    var jwt = jwtService.generateToken(user);
    return AuthResponseDto.builder()
      .token(jwt)
      .build();
  }

  public AuthResponseDto registerEsercente(RegisterRequestDto request) {
    var user = UserDto.builder()
            .nome(request.getNome())
            .cognome(request.getCognome())
            .username(request.getUsername())
            .email(request.getEmail())
            .password(passwordEncoder.encode(request.getPassword()))
            .ruolo(Ruolo.ESERCENTE)
            .lingua(request.getLingua())
            .dataNascita(request.getDataNascita())
            .telefono(request.getTelefono())
            .partitaIva(request.getPartitaIva())
            .build();
    userMapper.insertEsercente(user);
    var jwt = jwtService.generateToken(user);
    return AuthResponseDto.builder()
            .token(jwt)
            .build();
  }

  public boolean isEmailTaken(String emailRequested){

    UserDto user = userMapper.findByEmail(emailRequested);
    if(user == null || StringUtils.isNullOrEmpty(user.getEmail()))
      return false;
    else
      return true;

  }

  public boolean isUsernameTaken(String usernameRequested){

    UserDto user = userMapper.findByUsername(usernameRequested);
    if(user == null || StringUtils.isNullOrEmpty(user.getUsername()))
      return false;
    else
      return true;

  }

  public UserDto findUserByEmail(String email){
    return userMapper.findByEmail(email);
  }

}
