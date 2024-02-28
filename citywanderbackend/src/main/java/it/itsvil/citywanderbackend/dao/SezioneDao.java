package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.SezioneDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SezioneDao {
    List<SezioneDto> findSezioniByTappaId(Long idTappa);
}
