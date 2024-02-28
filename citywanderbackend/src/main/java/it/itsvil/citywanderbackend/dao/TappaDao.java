package it.itsvil.citywanderbackend.dao;

import it.itsvil.citywanderbackend.dto.TappaDto;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface TappaDao {

    public TappaDto findTappaById(Long id);

    public TappaDto findTappaByName(String name);

    public List<TappaDto> findTappeByTourId(Long idTour);

    public void saveTappaTour(Long idTour, Long idTappa, boolean isCompletata);

    ArrayList<TappaDto> getAllTappe();

    public List<TappaDto> findTappeNonCompletateByTourId(Long idTour);

    public void setTappaTourCompletata(Long idTour,Long idTappa);
}
