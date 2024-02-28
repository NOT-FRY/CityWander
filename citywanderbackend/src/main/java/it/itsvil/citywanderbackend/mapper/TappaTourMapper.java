package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.TappaDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TappaTourMapper {
    List<TappaDto> findTappeByTourId(Long idTour);

    void saveTappaTour(Long idTour, Long idTappa, boolean isCompletata);

    List<TappaDto> findTappeNonCompletateByTourId(Long idTour);

    void setTappaTourCompletata(@Param("idTour")Long idTour,@Param("idTappa")Long idTappa);
}
