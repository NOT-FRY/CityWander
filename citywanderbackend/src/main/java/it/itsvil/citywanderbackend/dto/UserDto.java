package it.itsvil.citywanderbackend.dto;

import it.itsvil.citywanderbackend.security.model.Ruolo;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDto implements UserDetails {

    private String username;
    private String nome;
    private String cognome;
    private String email;
    private String password;
    private String lingua;
    private Ruolo ruolo;
    private int numeroGiorni;
    private String mezzoTrasporto;
    private int punti;
    private LocalDate dataNascita;
    private String genere;
    private String telefono;
    private String partitaIva;
    private String viaAlloggio;
    private String coordinateAlloggio;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(ruolo.name()));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}
