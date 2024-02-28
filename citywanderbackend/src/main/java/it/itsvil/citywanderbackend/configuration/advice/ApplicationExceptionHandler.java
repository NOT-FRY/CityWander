package it.itsvil.citywanderbackend.configuration.advice;

import it.itsvil.citywanderbackend.dto.common.ResultDto;
import lombok.extern.log4j.Log4j2;
import org.apache.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static it.itsvil.augmenter.util.constant.Log.*;
import static it.itsvil.citywanderbackend.util.constant.Message.OPERATION_KO;

@Log4j2
@ControllerAdvice
public class ApplicationExceptionHandler{

    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<ResultDto<String>> handleGenericException(Exception e){
        log.info(START);
        log.error(ERROR, e.getMessage());

        ResultDto<String> response = new ResultDto<>();

        response.setFailureResponse(OPERATION_KO, HttpStatus.SC_INTERNAL_SERVER_ERROR);

        log.info(END_SERVER_ERROR);
        return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body(response);
    }

}
