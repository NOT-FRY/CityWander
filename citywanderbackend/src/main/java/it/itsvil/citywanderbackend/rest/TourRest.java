package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.dto.TourDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.TourService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.List;

import static it.itsvil.augmenter.util.constant.Log.*;
import static it.itsvil.citywanderbackend.util.constant.Message.NO_ITEMS;
import static it.itsvil.citywanderbackend.util.constant.Message.OPERATION_OK;

@Log4j2
@CrossOrigin
@RestController
@RequestMapping(value = "citywander/tour")
public class TourRest {

    private final TourService tourService;

    @Autowired
    public TourRest(TourService tourService) {
        this.tourService = tourService;
    }

    @Operation(method = "POST",
            summary = "Salva tour",
            description = "Questo servizio permette di salvare un nuovo tour.\n"
    )
    @PostMapping(value = "/salvaTour", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> salvaTour(
        @RequestBody TourDto newTour
    ) {

        log.info(START);
        log.info(REQUEST);

        var response = new ResultDto<Boolean>();
        var result = tourService.saveTour(newTour);

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
            summary = "Recupera tour",
            description = "Questo servizio permette di recuperare il tour dato il suo id.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id tour : id tour\n"
    )
    @GetMapping(value = "/findTourById", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<TourDto>> findTourById(
            @Parameter(description = "id tour") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<TourDto>();
        var result = tourService.findTourById(id);

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
            summary = "Recupera tutti i tour di un turista",
            description = "Questo servizio permette di recuperare i tour di un turista.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-username : username turista\n"
    )
    @GetMapping(value = "/findTourByUsername", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<TourDto>>> findTourByUsername(
            @Parameter(description = "username turista") @RequestParam(value = "username", required = true) @NotNull String username
    ) {

        log.info(START);
        log.info(REQUEST, username);

        var response = new ResultDto<List<TourDto>>();
        var result = tourService.findTourByUsername(username);

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
            summary = "Genera tour personale",
            description = "Questo servizio genera un tour a partire dall'email del turista.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-email : email turista\n"
    )
    @GetMapping(value = "/generateTour", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> generateTour(
            @Parameter(description = "email turista") @RequestParam(value = "email", required = true) @NotNull String email
    ) {

        log.info(START);
        log.info(REQUEST, email);

        var response = new ResultDto<Boolean>();
        var result = tourService.generateTour(email);

        log.info(RESPONSE, result);

        if(!result){
            log.info(EMPTY_RESPONSE);
            response.setSuccessFalseResponse(NO_ITEMS);
        }else {
            response.setSuccessTrueResponse(OPERATION_OK);
        }
        log.info(END);
        return ResponseEntity.ok(response);
    }

    @Operation(method = "UPDATE",
            summary = "Aggiorna lo stato di un tour ",
            description = "Questo servizio permette di aggiornare lo stato di un tour esistente.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id : id del tour che si vuole aggiornare \n"
                    + "-stato : stato che si vuole impostare (tra 'PROGRAMMA','CORSO' e 'ARCHIVIATO') \n"
    )
    @PutMapping(value = "/updateTourState", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> updateTourState(
            @Parameter(description = "idTour") @RequestParam(value = "idTour", required = true) @NotNull Long idTour,
            @Parameter(description = "stato") @RequestParam(value = "stato", required = true) @NotNull String stato
    ) {

        log.info(START);
        log.info(REQUEST, idTour +" stato:"+ stato);

        var response = new ResultDto<Boolean>();
        var result = tourService.updateTourState(idTour,stato);

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

    @Operation(method = "DELETE",
            summary = "Cancella un tour dato un id",
            description = "Questo servizio permette di cancellare un tour.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id : id del tour \n"
    )
    @DeleteMapping(value = "/deleteTour", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> deleteRistorante(
            @Parameter(description = "id") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<Boolean>();
        var result = tourService.deleteTour(id);

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
