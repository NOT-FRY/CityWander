package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.TourDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TourMapper {

    TourDto findTourById(Long id);

    Long getNextTourId();

    List<TourDto> findTourByUsername(String username);

    void saveTour(TourDto tour);

    void updateTourState(TourDto tour);

    void deleteTour(Long id);
}
