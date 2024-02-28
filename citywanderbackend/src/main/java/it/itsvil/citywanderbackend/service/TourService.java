package it.itsvil.citywanderbackend.service;
import it.itsvil.citywanderbackend.dto.TourDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TourService {
    TourDto findTourById(Long id);

    Long getNextTourId();

    List<TourDto> findTourByUsername(String username);

    boolean saveTour(TourDto tour);

    boolean generateTour(String email);

    boolean updateTourState(Long id, String stato);

    boolean deleteTour(Long id);

}
