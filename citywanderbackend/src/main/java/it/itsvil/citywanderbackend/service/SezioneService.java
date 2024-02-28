package it.itsvil.citywanderbackend.service;

import it.itsvil.citywanderbackend.dto.SezioneDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SezioneService {
    List<SezioneDto> findSezioniByTappaId(Long idTappa);
}
