package it.itsvil.citywanderbackend.service;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RistoranteService {
    RistoranteDto findRistoranteById(Long id);

    RistoranteDto findRistoranteByName(String name);
    boolean saveRistorante(RistoranteDto r);

    List<RistoranteDto> findRistorantiByUsername(String username);

    boolean updateRistorante(Long id, RistoranteDto r);

    boolean deleteRistorante(Long id);

    List<RistoranteDto> findTopRistoranti(int limit);

    public String generateCoordinate(String indirizzoDaGeocodificare);
}
