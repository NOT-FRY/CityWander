package it.itsvil.citywanderbackend.mapper;

import it.itsvil.citywanderbackend.dto.ProvaDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProvaMapper {
    ProvaDto getProvaById(String n_id);
}
