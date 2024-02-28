package it.itsvil.citywanderbackend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_ABSENT)
public class TappaDto {
    private Long id;
    private String descrizione;
    private String nome;
    private String coordinate;
    private String foto;
}
