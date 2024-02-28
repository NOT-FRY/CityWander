package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.dto.TappaDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.TappaService;
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
@RequestMapping(value = "citywander/tappa")
public class TappaRest {

    private final TappaService tappaService;

    @Autowired
    public TappaRest(TappaService tappaService) {
        this.tappaService = tappaService;
    }

    @Operation(method = "GET",
            summary = "Recupera tappa",
            description = "Questo servizio permette di recuperare una tappa dato il suo id.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id tappa : id tappa\n"
    )
    @GetMapping(value = "/findTappaById", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<TappaDto>> findTappaById(
            @Parameter(description = "id tappa") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<TappaDto>();
        var result = tappaService.findTappaById(id);

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
            summary = "Recupera tappa",
            description = "Questo servizio permette di recuperare una tappa dato il suo nome.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-nome tappa : nome tappa\n"
    )
    @GetMapping(value = "/findTappaByName", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<TappaDto>> findTappaByName(
            @Parameter(description = "nome tappa") @RequestParam(value = "nome", required = true) @NotNull String nome
    ) {

        log.info(START);
        log.info(REQUEST, nome);

        var response = new ResultDto<TappaDto>();
        var result = tappaService.findTappaByName(nome);

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
            summary = "Recupera tutte le tappe di un tour",
            description = "Questo servizio permette di recuperare tutte le tappe di un tour.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id : id del tour\n"
    )
    @GetMapping(value = "/findTappeByTourId", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<TappaDto>>> findTappeByTourId(
            @Parameter(description = "id tappa") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<List<TappaDto>>();
        var result = tappaService.findTappeByTourId(id);

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
            summary = "Recupera tutte le tappe non completate di un tour",
            description = "Questo servizio permette di recuperare tutte le tappe non completate di un tour.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-id : id del tour\n"
    )
    @GetMapping(value = "/findTappeNonCompletateByTourId", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<TappaDto>>> findTappeNonCompletateByTourId(
            @Parameter(description = "id tappa") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<List<TappaDto>>();
        var result = tappaService.findTappeNonCompletateByTourId(id);

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
            summary = "Salvataggio di una tappa del tour",
            description = "Questo servizio permette di salvare una tappa relativa ad un tour.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-idTour : id del tour\n"
                    + "-idTappa : id della tappa\n"
                    + "-isCompletata : Se la tappa del tour è stata completata\n"
    )
    @GetMapping(value = "/saveTappaTour", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> saveTappaTour(
            @Parameter(description = "idTour") @RequestParam(value = "idTour", required = true) @NotNull Long idTour,
            @Parameter(description = "idTappa") @RequestParam(value = "idTappa", required = true) @NotNull Long idTappa,
            @Parameter(description = "isCompletata") @RequestParam(value = "isCompletata", required = true) @NotNull boolean isCompletata
    ) {

        log.info(START);
        log.info(REQUEST, ""+idTappa+""+idTour+""+isCompletata);

        var response = new ResultDto<Boolean>();
        var result = tappaService.saveTappaTour(idTour,idTappa,isCompletata);

        log.info(RESPONSE, result);

        if(result==false){
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
            summary = "Recupera tutte le tappe",
            description = "Questo servizio permette di recuperare tutte le tappe.\n"
    )
    @GetMapping(value = "/getAllTappe", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<TappaDto>>> getAllTappe() {

        log.info(START);

        var response = new ResultDto<List<TappaDto>>();
        var result = tappaService.getAllTappe();

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

    @Operation(method = "UPDATE",
            summary = "Aggiorna lo stato di una tappa a completato",
            description = "Questo servizio permette di aggiornare lo stato di una tappa a completato.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-idTour : id del tour \n"
                    + "-idTappa : id della tappa \n"
    )
    @PutMapping(value = "/setTappaTourCompletata", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<Boolean>> setTappaTourCompletata(
            @Parameter(description = "idTour") @RequestParam(value = "idTour", required = true) @NotNull Long idTour,
            @Parameter(description = "idTappa") @RequestParam(value = "idTappa", required = true) @NotNull Long idTappa
    ) {

        log.info(START);
        log.info(REQUEST, "id del tour:"+idTour+", id della tappa:"+idTappa );

        var response = new ResultDto<Boolean>();
        var result = tappaService.setTappaTourCompletata(idTour,idTappa);

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
