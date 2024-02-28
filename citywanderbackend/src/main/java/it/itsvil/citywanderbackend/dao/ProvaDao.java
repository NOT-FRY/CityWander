package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.ProvaDto;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvaDao {
    Long getIdNextVal(); // qui si stacca la sequence per generare gli id. Sono delle tabelle ad hoc in postgresql
    ProvaDto findSomenthingByCode(String t_example_code);
}
