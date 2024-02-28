package it.itsvil.citywanderbackend.dao.impl;

import it.itsvil.citywanderbackend.dao.SezioneDao;
import it.itsvil.citywanderbackend.dto.SezioneDto;
import it.itsvil.citywanderbackend.mapper.SezioneMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SezioneDaoImpl implements SezioneDao {
    private final SezioneMapper mapper;

    @Autowired
    SezioneDaoImpl(SezioneMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<SezioneDto> findSezioniByTappaId(Long idTappa) {
        return mapper.findSezioniByTappaId(idTappa);
    }
}
