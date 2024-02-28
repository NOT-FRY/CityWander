package it.itsvil.citywanderbackend.dao.impl;

import it.itsvil.citywanderbackend.dao.TourDao;
import it.itsvil.citywanderbackend.dto.TourDto;
import it.itsvil.citywanderbackend.mapper.TourMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TourDaoImpl implements TourDao {

    private final TourMapper mapper;

    @Autowired
    public TourDaoImpl(TourMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public TourDto findTourById(Long id) {
        return mapper.findTourById(id);
    }

    @Override
    public Long getNextTourId() {
        return mapper.getNextTourId();
    }

    @Override
    public List<TourDto> findTourByUsername(String username) {
        return mapper.findTourByUsername(username);
    }

    @Override
    public void saveTour(TourDto tour) {
        mapper.saveTour(tour);
    }

    @Override
    public void updateTourState(TourDto tour) {
        mapper.updateTourState(tour);
    }

    @Override
    public void deleteTour(Long id) {
        mapper.deleteTour(id);
    }
}
