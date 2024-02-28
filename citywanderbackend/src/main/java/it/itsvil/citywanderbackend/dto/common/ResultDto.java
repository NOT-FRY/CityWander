package it.itsvil.citywanderbackend.dto.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.google.gson.annotations.JsonAdapter;
import it.itsvil.augmenter.util.adapter.LocalDateTimeAdapter;
import lombok.Data;
import org.apache.http.HttpStatus;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@JsonInclude(Include.NON_ABSENT)
public class ResultDto<T> implements Serializable {

    private static final long serialVersionUID = 8903038957866003289L;

    protected boolean success;

    protected int code;

    protected String description;

    protected T data;

    @JsonAdapter(LocalDateTimeAdapter.class)
    private LocalDateTime dateTime;

    /**
     * Costruttore
     */
    public ResultDto(){
        clear();
    }

    /**
     * Metodo utile a resettare i campi dell'oggetto ResultDto
     */
    public void clear(){
        this.success = false;
        this.code = 0;
        this.data = null;
        this.description = null;
        this.dateTime = LocalDateTime.now();
    }

    /**
     * Metodo per ottenere l'esito dell'operazione
     * @return true nel caso in cui l'operazione e' andata a buon fine, false altrimenti
     */
    public boolean isSuccess() {
        return success;
    }

    /**
     * Metodo utile a valorizzare i campi dell'oggetto ResultDto nel caso in cui
     * l'operazione va a buon fine ma non si è ottenuto cio' che si voleva.
     * Ad esempio quando si vuole recuperare uno o più record e questi non vengono trovati.
     * @param description stringa contenente il messaggio da visualizzare
     */
    public void setSuccessFalseResponse(String description){
        this.description = description;
        this.dateTime = LocalDateTime.now();
        this.success = Boolean.FALSE;
        this.code = HttpStatus.SC_OK;
    }

    /**
     * Metodo utile a valorizzare i campi dell'oggetto ResultDto nel caso in cui
     * l'operazione va a buon fine.
     * @param description stringa contenente il messaggio da visualizzare
     */
    public void setSuccessTrueResponse(String description){
        this.description = description;
        this.dateTime = LocalDateTime.now();
        this.success = Boolean.TRUE;
        this.code = HttpStatus.SC_OK;
    }

    /**
     * Metodo utile a valorizzare i campi dell'oggetto ResultDto nel caso in cui
     * l'operazione non vada a buon fine
     * @param description stringa contenente il messaggio da visualizzare
     * @param code intero contenente il codice HTTP
     */
    public void setFailureResponse(String description, int code){
        this.description = description;
        this.dateTime = LocalDateTime.now();
        this.success = Boolean.FALSE;
        this.code = code;
        this.data = null;
    }

}
