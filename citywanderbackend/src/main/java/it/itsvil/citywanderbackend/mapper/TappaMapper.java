package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.TappaDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface TappaMapper {
    TappaDto findTappaById(Long id);

    TappaDto findTappaByName(String name);

    ArrayList<TappaDto> getAllTappe();
}
