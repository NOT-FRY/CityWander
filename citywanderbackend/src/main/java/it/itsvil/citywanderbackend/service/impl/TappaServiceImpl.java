package it.itsvil.citywanderbackend.service.impl;

import it.itsvil.citywanderbackend.dao.TappaDao;
import it.itsvil.citywanderbackend.dto.TappaDto;
import it.itsvil.citywanderbackend.service.TappaService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Service(value = "TappaServiceImpl")
public class TappaServiceImpl implements TappaService {

    private final TappaDao tappaDao;

    @Autowired
    TappaServiceImpl(TappaDao tappaDao) {
        this.tappaDao = tappaDao;
    }

    @Override
    public TappaDto findTappaById(Long id) {
        return tappaDao.findTappaById(id);
    }

    @Override
    public TappaDto findTappaByName(String name) {
        return tappaDao.findTappaByName(name);
    }

    @Override
    public ArrayList<TappaDto> getAllTappe() {
        return tappaDao.getAllTappe();
    }

    @Override
    public List<TappaDto> findTappeByTourId(Long idTour) {
        return tappaDao.findTappeByTourId(idTour);
    }

    @Override
    public boolean saveTappaTour(Long idTour, Long idTappa, boolean isCompletata) {
        //TODO controlli
        if(idTour==null || idTappa==null)
            return false;
        tappaDao.saveTappaTour(idTour,idTappa,isCompletata);
        return true;
    }

    @Override
    public boolean setTappaTourCompletata(Long idTour, Long idTappa) {
        List<TappaDto> tappaList = findTappeByTourId(idTour);
        if(tappaList == null)
            return false;
        boolean idFound = false;
        for(TappaDto tappa : tappaList){
            if(tappa.getId().equals(idTappa)) {
                idFound = true;
                break;
            }
        }
        if(!idFound)
            return false;
        tappaDao.setTappaTourCompletata(idTour,idTappa);
        return true;
    }

    public List<TappaDto> findTappeNonCompletateByTourId(Long idTour) {
        return tappaDao.findTappeNonCompletateByTourId(idTour);
    }


}
