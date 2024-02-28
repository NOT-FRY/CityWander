package it.itsvil.citywanderbackend.service;

import it.itsvil.citywanderbackend.dto.TappaDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public interface TappaService {

    public TappaDto findTappaById(Long id);

    public ArrayList<TappaDto> getAllTappe();

    public TappaDto findTappaByName(String name);

    public List<TappaDto> findTappeByTourId(Long idTour);

    public List<TappaDto> findTappeNonCompletateByTourId(Long idTour);

    public boolean saveTappaTour(Long idTour, Long idTappa, boolean isCompletata);

    public boolean setTappaTourCompletata(Long idTour,Long idTappa);
}
