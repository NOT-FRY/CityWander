package it.itsvil.citywanderbackend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_ABSENT)
public class SezioneDto {
    private Long id;
    private String descrizione;
    private String foto;
    private Long idTappa;
    private String titolo;
    private Integer numero;
}
