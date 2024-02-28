package it.itsvil.citywanderbackend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.time.LocalDate;

@Data
@JsonInclude(JsonInclude.Include.NON_ABSENT)
public class ProvaDto {
    private Long n_id;
    private String t_example_code;
    private LocalDate d_data;
    private String b_validate;
}
