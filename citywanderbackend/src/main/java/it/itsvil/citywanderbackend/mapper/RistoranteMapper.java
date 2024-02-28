package it.itsvil.citywanderbackend.mapper;
import it.itsvil.citywanderbackend.dto.ProvaDto;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RistoranteMapper {
    Long getNextId();
    RistoranteDto findRistoranteById(Long id);

    RistoranteDto findRistoranteByName(String name);

    void saveRistorante(RistoranteDto ristorante);

    List<RistoranteDto> findRistorantiByUsername(String username);

    void updateRistorante(RistoranteDto r);

    void deleteRistorante(Long id);
    List<RistoranteDto> findTopRistoranti(int limit);


}
