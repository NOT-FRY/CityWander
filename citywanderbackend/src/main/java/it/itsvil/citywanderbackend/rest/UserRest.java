package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.RistoranteService;
import it.itsvil.citywanderbackend.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.constraints.NotNull;

import java.util.List;

import static it.itsvil.augmenter.util.constant.Log.*;
import static it.itsvil.citywanderbackend.util.constant.Message.NO_ITEMS;
import static it.itsvil.citywanderbackend.util.constant.Message.OPERATION_OK;

@Log4j2
@CrossOrigin
@RestController
@RequestMapping(value = "citywander/user")
public class UserRest {

    private final UserService userService;

    @Autowired
    public UserRest(UserService userService) {
        this.userService = userService;
    }

    @Operation(method = "UPDATE",
            summary = "Aggiorna un utente per il profiling.",
            description = "Questo servizio permette di aggiornare le informazioni di un utente, riguardo il profiling.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-email : email dell'utente che si vuole aggiornare \n"
                    + "-numeroGiorni : numero giorni del soggiorno dell'utente \n"
                    + "-viaAlloggio : via in cui l'utente alloggia \n"
                    + "-coordinateAlloggio : coordinate della via in cui l'utente alloggia \n"
    )
    @PutMapping(value = "/updateUserProfiling", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> updateUserProfiling(
            @Parameter(description = "email") @RequestParam(value = "email", required = true) @NotNull String email,
            @Parameter(description = "numeroGiorni") @RequestParam(value = "numeroGiorni", required = true) @NotNull int numeroGiorni,
            @Parameter(description = "viaAlloggio") @RequestParam(value = "viaAlloggio", required = true) @NotNull String viaAlloggio,
            @Parameter(description = "coordinateAlloggio") @RequestParam(value = "coordinateAlloggio", required = true) @NotNull String coordinateAlloggio
    ) {

        log.info(START);
        log.info(REQUEST, email);

        var response = new ResultDto<Boolean>();
        var result = userService.updateUserProfiling(email,numeroGiorni,viaAlloggio,coordinateAlloggio);

        log.info(RESPONSE, result);

        if(!result){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "UPDATE",
            summary = "Aggiungi punti all'utente.",
            description = "Questo servizio permette di aggiungere punti all'utente.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-email : email dell'utente che si vuole aggiornare \n"
                    + "-pointsToAdd : punti che si vogliono aggiungere all'account dell'utente \n"

    )
    @PutMapping(value = "/addPointsToUser", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> addPointsToUser(
            @Parameter(description = "email") @RequestParam(value = "email", required = true) @NotNull String email,
            @Parameter(description = "pointsToAdd") @RequestParam(value = "pointsToAdd", required = true) @NotNull int pointsToAdd
    ) {

        log.info(START);
        log.info(REQUEST, email+", points to add:"+pointsToAdd);

        var response = new ResultDto<Boolean>();
        var result = userService.addPointsToUser(email,pointsToAdd);

        log.info(RESPONSE, result);

        if(!result){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

}
