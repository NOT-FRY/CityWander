package it.itsvil.citywanderbackend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_ABSENT)
public class RistoranteDto {
    private Long id_ristorante;
    private String fk_esercente;
    private String nome;
    private String indirizzo;
    private String descrizione;
    private int punteggio;
    private String menu;
    private String foto;
    private String coordinate;
}

