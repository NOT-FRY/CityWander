package it.itsvil.citywanderbackend.security.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequestDto {
  private String nome;
  private String cognome;
  private String username;
  private String email;
  private String password;
  private String lingua;
  private LocalDate dataNascita;
  private String genere;
  private String telefono;
  private String partitaIva;
}
