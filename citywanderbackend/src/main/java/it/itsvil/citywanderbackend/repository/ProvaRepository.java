package it.itsvil.citywanderbackend.repository;

import it.itsvil.citywanderbackend.document.JsonForMongo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvaRepository extends MongoRepository<JsonForMongo, String> {

}
