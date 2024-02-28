package it.itsvil.citywanderbackend.rest;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import it.itsvil.citywanderbackend.dto.SezioneDto;
import it.itsvil.citywanderbackend.dto.common.ResultDto;
import it.itsvil.citywanderbackend.service.SezioneService;
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
@RequestMapping(value = "citywander/sezione")
public class SezioneRest {

    private final SezioneService sezioneService;

    @Autowired
    public SezioneRest(SezioneService sezioneService) {
        this.sezioneService = sezioneService;
    }

    @Operation(method = "GET",
            summary = "Recupera tutte le sezioni di una tappa",
            description = "Questo servizio permette di recuperare tutte le sezioni di una tappa.\n"
                    + "Fornire i seguenti paramentri:\n"
                    + "-idTappa : id della tappa\n"
    )
    @GetMapping(value = "/findSezioniByTappaId", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ResultDto<List<SezioneDto>>> findSezioniByTappaId(
            @Parameter(description = "id tappa") @RequestParam(value = "id", required = true) @NotNull Long id
    ) {

        log.info(START);
        log.info(REQUEST, id);

        var response = new ResultDto<List<SezioneDto>>();
        var result = sezioneService.findSezioniByTappaId(id);

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
}
