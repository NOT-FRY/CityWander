package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.SezioneDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SezioneMapper {
    List<SezioneDto> findSezioniByTappaId(Long idTappa);
}
