package it.itsvil.citywanderbackend.security.restcontroller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import it.itsvil.citywanderbackend.dto.UserDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.security.model.AuthResponseDto;
import it.itsvil.citywanderbackend.security.model.LoginRequestDto;
import it.itsvil.citywanderbackend.security.model.RegisterRequestDto;
import it.itsvil.citywanderbackend.security.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

import static it.itsvil.augmenter.util.constant.Log.*;
import static it.itsvil.citywanderbackend.util.constant.Message.NO_ITEMS;
import static it.itsvil.citywanderbackend.util.constant.Message.OPERATION_OK;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@Tag(name = "Auth", description = "Authentication API")
public class AuthController {
  private static final Logger log = LoggerFactory.getLogger(AuthController.class);

  private final AuthService authService;
  @Operation(method = "POST",
          summary = "Login",
          description = "Questo servizio permette di effettuare il login.\n"
                  + "Fornire i seguenti paramentri:\n"
                  + "-email : email \n"
                  + "-password : password \n"
  )
  @PostMapping("/login")
  public ResponseEntity<ResultDto<AuthResponseDto>> login(@RequestBody LoginRequestDto loginRequestDto) {
    ResultDto<AuthResponseDto> result = new ResultDto<AuthResponseDto>();
    try {
      log.info(START);
      log.info(REQUEST, loginRequestDto);
      AuthResponseDto authResponseDto = authService.login(loginRequestDto);
      if(authResponseDto!=null && !authResponseDto.getToken().isBlank()) {
        result.setSuccessTrueResponse("User logged");
        result.setData(authResponseDto);
        log.info(RESPONSE,result);
      }
    }
    catch (BadCredentialsException | InternalAuthenticationServiceException b ){
      log.warn("BadCredentialsException");
      result.setFailureResponse("User not valid",HttpStatus.BAD_REQUEST.value());
      result.setCode(HttpStatus.BAD_REQUEST.value());
      return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
    }
    catch (Exception e){
      log.error("Error on login user: ",e);
      result.setFailureResponse("Internal Error",HttpStatus.INTERNAL_SERVER_ERROR.value());
      result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    log.info(END);
    return new ResponseEntity<>(result, HttpStatus.OK);
  }


  @Operation(method = "POST",
          summary = "Registrazione turista",
          description = "Questo servizio permette di effettuare la registrazione di un turista.\n"
  )
  @PostMapping("/register")
    public ResponseEntity<ResultDto<AuthResponseDto>> register(@RequestBody RegisterRequestDto registerRequestDto) {
    ResultDto<AuthResponseDto> result = new ResultDto<AuthResponseDto>();
    log.info(START);
    log.info(REQUEST, registerRequestDto);
    try {
      AuthResponseDto authResponseDto = authService.register(registerRequestDto);
      if (authResponseDto != null && !authResponseDto.getToken().isBlank()) {
        result.setSuccessTrueResponse("User registered");
        result.setData(authResponseDto);
        log.info(RESPONSE,result);
      }
    } catch (Exception e) {
      log.error("Error on register user: ", e);
      result.setFailureResponse("Internal Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
      result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    log.info(END);
    return new ResponseEntity<>(result, HttpStatus.OK);
  }
  @Operation(method = "POST",
          summary = "Registrazione esercente",
          description = "Questo servizio permette di effettuare la registrazione di un esercente.\n"
  )
  @PostMapping("/registerEsercente")
  public ResponseEntity<ResultDto<AuthResponseDto>> registerEsercente(@RequestBody RegisterRequestDto registerRequestDto) {
    ResultDto<AuthResponseDto> result = new ResultDto<AuthResponseDto>();
    log.info(START);
    log.info(REQUEST,registerRequestDto);
    try {
      AuthResponseDto authResponseDto = authService.registerEsercente(registerRequestDto);
      if (authResponseDto != null && !authResponseDto.getToken().isBlank()) {
        result.setSuccessTrueResponse("User registered");
        result.setData(authResponseDto);
      }
      log.info(RESPONSE,result);
    } catch (Exception e) {
      log.error("Error on register user: ", e);
      result.setFailureResponse("Internal Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
      result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    log.info(END);
    return new ResponseEntity<>(result, HttpStatus.OK);
  }

  @Operation(method = "GET",
          summary = "Controllo se email già presente",
          description = "Questo servizio permette di controllare se l'indirizzo mail è già registrato sulla piattaforma.\n"
  )
  @GetMapping("/isEmailTaken")
  public ResponseEntity<ResultDto<Boolean>> isEmailTaken(
          @Parameter(description = "email requested") @RequestParam(value = "email", required = true) @NotNull String emailRequested
  ) {
    ResultDto<Boolean> result = new ResultDto<Boolean>();
    try {
      log.info(START);
      log.info(REQUEST, emailRequested);
      boolean isEmailTaken = authService.isEmailTaken(emailRequested);
      result.setSuccessTrueResponse("success");
      result.setData(isEmailTaken);
      log.info(RESPONSE,result);
    } catch (Exception e) {
      log.error("Error on isEmailTaken: ", e);
      result.setFailureResponse("Internal Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
      result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      log.info(END);
      return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    log.info(END);
    return new ResponseEntity<>(result, HttpStatus.OK);
  }

  @Operation(method = "GET",
          summary = "Controllo se username già presente",
          description = "Questo servizio permette di controllare se l'username è già registrato sulla piattaforma.\n"
  )
  @GetMapping("/isUsernameTaken")
  public ResponseEntity<ResultDto<Boolean>> isUsernameTaken(
          @Parameter(description = "username requested") @RequestParam(value = "username", required = true) @NotNull String usernameRequested
  ) {
    ResultDto<Boolean> result = new ResultDto<Boolean>();
    try {
      log.info(START);
      log.info(REQUEST,usernameRequested);
      boolean isEmailTaken = authService.isUsernameTaken(usernameRequested);
      result.setSuccessTrueResponse("success");
      result.setData(isEmailTaken);
      log.info(RESPONSE,result);
    } catch (Exception e) {
      log.error("Error on isUsernameTaken: ", e);
      result.setFailureResponse("Internal Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
      result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      log.info(END);
      return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    log.info(END);
    return new ResponseEntity<>(result, HttpStatus.OK);
  }

  @Operation(method = "GET",
          summary = "Recupera i dati di un utente data la mail",
          description = "Questo servizio permette di recuperare i dati di un utente data la sua mail.\n"
  )
  @GetMapping("/findUserByEmail")
  public ResponseEntity<ResultDto<UserDto>> findUserByEmail(
          @Parameter(description = "email") @RequestParam(value = "email", required = true) @NotNull String email
  ) {
    var response = new ResultDto<UserDto>();

    try {
      log.info(START);
      log.info(REQUEST, email);
      UserDto user = authService.findUserByEmail(email);
      if(user==null){
        log.info(EMPTY_RESPONSE);
        response.setSuccessFalseResponse(NO_ITEMS);
      }else{
        response.setSuccessTrueResponse(OPERATION_OK);
        response.setData(user);
      }
      log.info(RESPONSE,response);
    } catch (Exception e) {
      log.error("Error on findUserByEmail: ", e);
      response.setFailureResponse("Internal Error", HttpStatus.INTERNAL_SERVER_ERROR.value());
      response.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
    }

    log.info(END);
    return ResponseEntity.ok(response);
  }
}
