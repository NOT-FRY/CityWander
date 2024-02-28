package it.itsvil.citywanderbackend.dao.impl;


import it.itsvil.citywanderbackend.dao.ProvaDao;
import it.itsvil.citywanderbackend.dto.ProvaDto;
import it.itsvil.citywanderbackend.mapper.ProvaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProvaDaoImpl implements ProvaDao {
    private final ProvaMapper mapper ;

    @Autowired
    public ProvaDaoImpl(ProvaMapper mapper){
        this.mapper = mapper ;
    }
    @Override
    public Long getIdNextVal() {
        return null;
    }

    @Override
    public ProvaDto findSomenthingByCode(String t_example_code) {
        return mapper.getProvaById(t_example_code);
    }
}
