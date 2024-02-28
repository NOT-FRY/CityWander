package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.TourDto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TourDao {

    TourDto findTourById(Long id);

    Long getNextTourId();

    List<TourDto> findTourByUsername(String username);

    void saveTour(TourDto tour);

    void updateTourState(TourDto tour);

    void deleteTour(Long id);
}
