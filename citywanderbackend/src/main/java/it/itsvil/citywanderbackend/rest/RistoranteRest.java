package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.RistoranteService;
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
@RequestMapping(value = "citywander/ristorante")
public class RistoranteRest {

    private final RistoranteService ristoranteService;

    @Autowired
    public RistoranteRest(RistoranteService ristoranteService) {
        this.ristoranteService = ristoranteService;
    }

    @Operation(method = "POST",
            summary = "Salva ristorante",
            description = "Questo servizio permette di salvare un nuovo ristorante dati i parametri in input.\n"
    )
    @PostMapping(value = "/salvaRistorante", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> salvaRistorante(
        @RequestBody RistoranteDto newRistorante
    ) {

        log.info(START);
        log.info(REQUEST, newRistorante.getNome());

        var response = new ResultDto<Boolean>();
        var result = ristoranteService.saveRistorante(newRistorante);

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

    @Operation(method = "GET",
            summary = "Recupera ristorante",
            description = "Questo servizio permette di recuperare il ristorante dato il suo id.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id ristorante : id ristorante\n"
    )
    @GetMapping(value = "/findRistoranteById", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<RistoranteDto>> findRistoranteById(
            @Parameter(description = "id ristorante") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<RistoranteDto>();
        var result = ristoranteService.findRistoranteById(id);

        log.info(RESPONSE, result);

        if(result==null){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "GET",
            summary = "Recupera ristorante",
            description = "Questo servizio permette di recuperare il ristorante dato il suo nome.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-nome ristorante : nome ristorante\n"
    )
    @GetMapping(value = "/findRistoranteByName", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<RistoranteDto>> findRistoranteByName(
            @Parameter(description = "nome ristorante") @RequestParam(value = "nome", required = true) @NotNull String nomeRistorante
    ) {

        log.info(START);
        log.info(REQUEST, nomeRistorante);

        var response = new ResultDto<RistoranteDto>();
        var result = ristoranteService.findRistoranteByName(nomeRistorante);

        log.info(RESPONSE, result);

        if(result==null){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "GET",
            summary = "Recupera tutti i ristoranti di un esercente",
            description = "Questo servizio permette di recuperare i ristoranti di un esercente.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-username : username esercente\n"
    )
    @GetMapping(value = "/findRistorantiByUsername", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<RistoranteDto>>> findRistorantiByUsername(
            @Parameter(description = "username esercente") @RequestParam(value = "username", required = true) @NotNull String username
    ) {

        log.info(START);
        log.info(REQUEST, username);

        var response = new ResultDto<List<RistoranteDto>>();
        var result = ristoranteService.findRistorantiByUsername(username);

        log.info(RESPONSE, result);

        if(result==null){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "DELETE",
            summary = "Cancella un ristorante dato un id",
            description = "Questo servizio permette di cancellare un ristorante.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id : id ristorante \n"
    )
    @DeleteMapping(value = "/deleteRistorante", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> deleteRistorante(
            @Parameter(description = "id") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<Boolean>();
        var result = ristoranteService.deleteRistorante(id);

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
            summary = "Aggiorna un ristorante.",
            description = "Questo servizio permette di aggiornare le informazioni di un ristorante.\n"
    )
    @PutMapping(value = "/updateRistorante", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> updateRistorante(
        RistoranteDto ristorante
    ) {

        log.info(START);
        log.info(REQUEST, ristorante.getNome());

        var response = new ResultDto<Boolean>();
        var result = ristoranteService.updateRistorante(ristorante.getId_ristorante(),ristorante);

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

    @Operation(method = "GET",
            summary = "Recupera i migliori ristoranti",
            description = "Questo servizio permette di recuperare i migliori ristoranti, ordinamento eseguito in base al punteggio.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-limite : limite di ristoranti che si vuole \n"
    )
    @GetMapping(value = "/findTopRistoranti", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<RistoranteDto>>> findTopRistoranti(
            @Parameter(description = "limite") @RequestParam(value = "limite", required = true) @NotNull int limite
    ) {

        log.info(START);
        log.info(REQUEST, limite);

        var response = new ResultDto<List<RistoranteDto>>();
        var result = ristoranteService.findTopRistoranti(limite);

        log.info(RESPONSE, result);

        if(result==null){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else{
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "GET",
            summary = "Genera le coordinate",
            description = "Questo servizio permette di generare le coordinate a partire da un indirizzo.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-indirizzo : via da convertire \n"
    )
    @GetMapping(value = "/generateCoordinate", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<String>> generateCoordinate(
            @Parameter(description = "indirizzo") @RequestParam(value = "indirizzo", required = true) @NotNull String indirizzo
    ) {

        log.info(START);
        log.info(REQUEST, indirizzo);

        var response = new ResultDto<String>();
        String result = ristoranteService.generateCoordinate(indirizzo);

        log.info(RESPONSE, result);

        if(result==null){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else{
            response.setSuccessTrueResponse(OPERATION_OK);
            response.setData(result);
        }

        log.info(END);
        return ResponseEntity.ok(response);
    }

}
