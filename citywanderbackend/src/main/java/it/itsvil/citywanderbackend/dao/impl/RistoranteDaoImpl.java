package it.itsvil.citywanderbackend.dao.impl;
import it.itsvil.citywanderbackend.dao.RistoranteDao;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import it.itsvil.citywanderbackend.mapper.RistoranteMapper;
import it.itsvil.citywanderbackend.util.StringUtils;
import org.postgresql.shaded.com.ongres.scram.common.bouncycastle.pbkdf2.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RistoranteDaoImpl implements RistoranteDao {
    private final RistoranteMapper mapper ;

    @Autowired
    public RistoranteDaoImpl(RistoranteMapper mapper){
        this.mapper = mapper ;
    }
    @Override
    public Long getNextId(){
        return mapper.getNextId();
    }
    @Override
    public RistoranteDto findRistoranteById(Long id){
        return mapper.findRistoranteById(id);
    }

    @Override
    public RistoranteDto findRistoranteByName(String name){
        return mapper.findRistoranteByName(name);
    }

    @Override
    public void saveRistorante(RistoranteDto r){
        mapper.saveRistorante(r);
    }

    @Override
    public List<RistoranteDto> findRistorantiByUsername(String username) {
        return mapper.findRistorantiByUsername(username);
    }

    @Override
    public void updateRistorante(RistoranteDto requestDTO) {
        mapper.updateRistorante(requestDTO);
    }

    @Override
    public void deleteRistorante(Long id) {
        mapper.deleteRistorante(id);
    }

    @Override
    public List<RistoranteDto> findTopRistoranti(int limit) {
        return mapper.findTopRistoranti(limit);
    }
}
