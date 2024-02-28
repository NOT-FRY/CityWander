package it.itsvil.citywanderbackend.service.impl;

import it.itsvil.citywanderbackend.dao.RistoranteDao;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import it.itsvil.citywanderbackend.service.RistoranteService;
import it.itsvil.citywanderbackend.util.StringUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;

@Log4j2
@Service(value = "RistoranteServiceImpl")
public class RistoranteServiceImpl implements RistoranteService {
    private final RistoranteDao ristoranteDao;

    @Autowired
    public RistoranteServiceImpl(RistoranteDao ristoranteDao) {
        this.ristoranteDao = ristoranteDao;
    }

    @Override
    public boolean saveRistorante(RistoranteDto r) {
        if(r==null)
            return false;
        //TODO Altri controlli?
        ristoranteDao.saveRistorante(r);
        return true;
    }

    @Override
    public RistoranteDto findRistoranteById(Long id) {
        return ristoranteDao.findRistoranteById(id);
    }

    @Override
    public RistoranteDto findRistoranteByName(String name) {
        return ristoranteDao.findRistoranteByName(name);
    }

    @Override
    public List<RistoranteDto> findRistorantiByUsername(String username) {
        return ristoranteDao.findRistorantiByUsername(username);
    }

    @Override
    public boolean updateRistorante(Long id, RistoranteDto requestDTO) {
        RistoranteDto ristorante = this.findRistoranteById(id);
        if(ristorante==null || requestDTO==null)
            return false;
        //Aggiorno i campi, ma mantengo quelli vecchi se non presenti nel nuovo DTO
        if(!StringUtils.isNullOrEmpty(requestDTO.getNome()))
            ristorante.setNome(requestDTO.getNome());
        if(!StringUtils.isNullOrEmpty(requestDTO.getDescrizione()))
            ristorante.setDescrizione(requestDTO.getDescrizione());
        if(!StringUtils.isNullOrEmpty(requestDTO.getIndirizzo()))
            ristorante.setIndirizzo(requestDTO.getIndirizzo());
        if(requestDTO.getPunteggio()!=0)
            ristorante.setPunteggio(requestDTO.getPunteggio());
        if(requestDTO.getMenu()!=null)
            ristorante.setMenu(requestDTO.getMenu());

        ristoranteDao.updateRistorante(ristorante);
        return true;
    }

    @Override
    public boolean deleteRistorante(Long id)
    {
        RistoranteDto r = this.findRistoranteById(id);
        if(r==null)
            return false;
        ristoranteDao.deleteRistorante(id);
        return true;
    }

    @Override
    public List<RistoranteDto> findTopRistoranti(int limit) {
        return ristoranteDao.findTopRistoranti(limit);
    }

    public String generateCoordinate(String indirizzoDaGeocodificare){
        Geocoding g=new Geocoding();
        String coo = null;
        try {
            coo = g.geocoding(indirizzoDaGeocodificare);
            coo = coo.replace(".","");
            if(coo.equals("40669898, 14792211"))//Coordinate della città di Salerno(forse) individuate dall'API, quindi indirizzo non della città di Salerno e non valido
                return null;
            else
                return coo;
        } catch (IOException e) {
            log.info("ERRORE");
            log.info(e.getMessage());
            return null;
        }
    }
}
