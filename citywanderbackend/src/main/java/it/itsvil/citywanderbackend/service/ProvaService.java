package it.itsvil.citywanderbackend.service;

import it.itsvil.citywanderbackend.document.JsonForMongo;
import it.itsvil.citywanderbackend.dto.ProvaDto;
import org.springframework.stereotype.Service;

@Service
public interface ProvaService {
    ProvaDto getProvaById(String n_id_json);
    JsonForMongo getProvaDocumentById(String n_id_json);
}

