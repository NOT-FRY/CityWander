package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.document.JsonForMongo;
import it.itsvil.citywanderbackend.dto.ProvaDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.ProvaService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

import static it.itsvil.augmenter.util.constant.Log.*;
import static it.itsvil.citywanderbackend.util.constant.Message.NO_ITEMS;
import static it.itsvil.citywanderbackend.util.constant.Message.OPERATION_OK;

@Log4j2
@CrossOrigin
@RestController
@RequestMapping(value = "/prova")
public class ProvaRest {

    private final ProvaService provaService;

    @Autowired
    public ProvaRest (ProvaService provaService){
        this.provaService = provaService;
    }
    @Operation(method = "GET",
            summary = "Recupero  tramite identificativo",
            description = "Questo servizio permette di recuperare un flow completo tramite il suo identificativo.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "- n_id_json: identificativo")
    @GetMapping(value = "/1.0/getjsonFromMongo", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<JsonForMongo>> getDocumentById(
            @Parameter(description = "Identificativo") @RequestParam(value = "n_id_json", required = true) @NotNull String n_id) {

        log.info(START);
        log.info(REQUEST, n_id);

        var response = new ResultDto<JsonForMongo>();
        var result = provaService.getProvaDocumentById(n_id);

        log.info(RESPONSE, result);

        if(null == result){
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
            summary = "Recupero  tramite identificativo",
            description = "Questo servizio permette di recuperare un flow completo tramite il suo identificativo.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "- n_id_json: identificativo")
    @GetMapping(value = "/1.0/getProva", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<ProvaDto>> getDataById(
            @Parameter(description = "Identificativo") @RequestParam(value = "n_id", required = true) @NotNull String n_id) {

        log.info(START);
        log.info(REQUEST, n_id);

        var response = new ResultDto<ProvaDto>();
        var result = provaService.getProvaById(n_id);

        log.info(RESPONSE, result);

        if(null == result){
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
