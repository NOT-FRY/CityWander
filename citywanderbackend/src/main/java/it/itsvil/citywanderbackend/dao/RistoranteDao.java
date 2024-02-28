package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.RistoranteDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RistoranteDao {
    Long getNextId();

    RistoranteDto findRistoranteById(Long id);

    RistoranteDto findRistoranteByName(String name);
    void saveRistorante(RistoranteDto r);

    List<RistoranteDto> findRistorantiByUsername(String username);

    void updateRistorante(RistoranteDto requestDTO);

    void deleteRistorante(Long id);

    List<RistoranteDto> findTopRistoranti(int limit);

}
