package it.itsvil.citywanderbackend.service.impl;

import it.itsvil.citywanderbackend.dao.SezioneDao;
import it.itsvil.citywanderbackend.dto.SezioneDto;
import it.itsvil.citywanderbackend.service.SezioneService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service(value = "SezioneServiceImpl")
public class SezioneServiceImpl implements SezioneService {

    private final SezioneDao sezioneDao;

    @Autowired
    SezioneServiceImpl(SezioneDao sezioneDao) {
        this.sezioneDao = sezioneDao;
    }

    @Override
    public List<SezioneDto> findSezioniByTappaId(Long idTappa) {
        return sezioneDao.findSezioniByTappaId(idTappa);
    }
}
