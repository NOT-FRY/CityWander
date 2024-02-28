package it.itsvil.citywanderbackend.service.impl;


import it.itsvil.citywanderbackend.dao.ProvaDao;
import it.itsvil.citywanderbackend.document.JsonForMongo;
import it.itsvil.citywanderbackend.dto.ProvaDto;
import it.itsvil.citywanderbackend.repository.ProvaRepository;
import it.itsvil.citywanderbackend.service.ProvaService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service(value = "ProvaServiceImpl")
public class ProvaServiceImpl implements ProvaService {
    private final ProvaDao provaDao;
    private final ProvaRepository provaRepository;

    @Autowired
    public ProvaServiceImpl(ProvaDao provaDao, ProvaRepository provaRepository){
        this.provaDao = provaDao;
        this.provaRepository = provaRepository;
    }
    public ProvaDto getProvaById(String n_id_json){
        return provaDao.findSomenthingByCode(n_id_json);
    }

    @Override
    public JsonForMongo getProvaDocumentById(String n_id_json) {
        return provaRepository.findById(n_id_json).orElseThrow();
    }
}

