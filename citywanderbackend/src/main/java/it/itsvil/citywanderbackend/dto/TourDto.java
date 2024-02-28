package it.itsvil.citywanderbackend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import java.time.LocalDate;

@Data
@JsonInclude(JsonInclude.Include.NON_ABSENT)
public class TourDto {

    private Long id;
    private String stato;
    private String username;
    private Integer numeroGiorni;
    private LocalDate dataGenerazione;

}
