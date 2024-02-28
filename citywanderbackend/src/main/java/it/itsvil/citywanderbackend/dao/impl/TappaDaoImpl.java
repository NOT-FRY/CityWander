package it.itsvil.citywanderbackend.dao.impl;

import it.itsvil.citywanderbackend.dao.TappaDao;
import it.itsvil.citywanderbackend.dto.TappaDto;
import it.itsvil.citywanderbackend.mapper.TappaMapper;
import it.itsvil.citywanderbackend.mapper.TappaTourMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TappaDaoImpl implements TappaDao {
    private final TappaMapper tappaMapper;
    private final TappaTourMapper tappaTourMapper;


    @Autowired
    public TappaDaoImpl(TappaMapper tappaMapper, TappaTourMapper tappaTourMapper) {
        this.tappaMapper = tappaMapper;
        this.tappaTourMapper = tappaTourMapper;
    }

    @Override
    public TappaDto findTappaById(Long id) {
        return tappaMapper.findTappaById(id);
    }

    @Override
    public TappaDto findTappaByName(String name) {
        return tappaMapper.findTappaByName(name);
    }

    @Override
    public ArrayList<TappaDto> getAllTappe() {
        return tappaMapper.getAllTappe();
    }

    @Override
    public List<TappaDto> findTappeByTourId(Long idTour) {
        return tappaTourMapper.findTappeByTourId(idTour);
    }

    public List<TappaDto> findTappeNonCompletateByTourId(Long idTour) {
        return tappaTourMapper.findTappeNonCompletateByTourId(idTour);
    }

    @Override
    public void setTappaTourCompletata(Long idTour, Long idTappa) {
        tappaTourMapper.setTappaTourCompletata(idTour,idTappa);
    }

    @Override
    public void saveTappaTour(Long idTour, Long idTappa, boolean isCompletata) {
        tappaTourMapper.saveTappaTour(idTour,idTappa,isCompletata);
    }
}
