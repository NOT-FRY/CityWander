package it.itsvil.citywanderbackend.service.impl;


import it.itsvil.citywanderbackend.dao.UserDao;
import it.itsvil.citywanderbackend.dto.RistoranteDto;
import it.itsvil.citywanderbackend.dto.UserDto;
import it.itsvil.citywanderbackend.service.UserService;
import it.itsvil.citywanderbackend.util.StringUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

@Log4j2
@Service(value = "UserServiceImpl")
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public boolean updateUser(UserDto userRequest) {
        UserDto oldUser = this.findUserByEmail(userRequest.getEmail());
        if(oldUser==null)
            return false;
        //Aggiorno i campi, ma mantengo quelli vecchi se non presenti nel nuovo DTO
        if(!StringUtils.isNullOrEmpty(userRequest.getNome()))
            oldUser.setNome(userRequest.getNome());
        if(!StringUtils.isNullOrEmpty(userRequest.getUsername()))
            oldUser.setUsername(userRequest.getUsername());
        if(!StringUtils.isNullOrEmpty(userRequest.getCognome()))
            oldUser.setCognome(userRequest.getCognome());
        if(!StringUtils.isNullOrEmpty(userRequest.getLingua()))
            oldUser.setLingua(userRequest.getLingua());
        if(userRequest.getRuolo()!=null)
            oldUser.setRuolo(userRequest.getRuolo());
        if(userRequest.getNumeroGiorni() > 0)
            oldUser.setNumeroGiorni(userRequest.getNumeroGiorni());
        if(!StringUtils.isNullOrEmpty(userRequest.getMezzoTrasporto()))
            oldUser.setMezzoTrasporto(userRequest.getMezzoTrasporto());
        if(userRequest.getPunti()>0)
            oldUser.setPunti(userRequest.getPunti());
        if(!StringUtils.isNullOrEmpty(userRequest.getPartitaIva()))
            oldUser.setPartitaIva(userRequest.getPartitaIva());
        if(!StringUtils.isNullOrEmpty(userRequest.getViaAlloggio()))
            oldUser.setViaAlloggio(userRequest.getViaAlloggio());
        if(!StringUtils.isNullOrEmpty(userRequest.getCoordinateAlloggio()))
            oldUser.setCoordinateAlloggio(userRequest.getCoordinateAlloggio());

        userDao.updateUser(oldUser);
        return true;
    }



    @Override
    public UserDto findUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    @Override
    public boolean updateUserProfiling(String email, int numeroGiorni, String viaAlloggio,String coordinateAlloggio) {
        UserDto user = new UserDto();
        user.setEmail(email);
        user.setNumeroGiorni(numeroGiorni);
        user.setViaAlloggio(viaAlloggio);
        user.setCoordinateAlloggio(coordinateAlloggio);
        return this.updateUser(user);
    }

    @Override
    public boolean addPointsToUser(String email, int pointsToAdd) {
        UserDto user = new UserDto();
        user.setEmail(email);
        UserDto oldPointsUser = this.findUserByEmail(email);
        if(oldPointsUser == null)
            return false;
        user.setPunti(oldPointsUser.getPunti()+pointsToAdd);
        return this.updateUser(user);
    }
}
