package it.itsvil.citywanderbackend.service.impl;

import it.itsvil.citywanderbackend.dao.TourDao;
import it.itsvil.citywanderbackend.dto.TappaDto;
import it.itsvil.citywanderbackend.dto.TourDto;
import it.itsvil.citywanderbackend.dto.UserDto;
import it.itsvil.citywanderbackend.mapper.UserMapper;
import it.itsvil.citywanderbackend.service.TappaService;
import it.itsvil.citywanderbackend.service.TourService;
import it.itsvil.citywanderbackend.util.constant.StatiTour;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Service(value = "TourServiceImpl")
public class TourServiceImpl implements TourService {
    private final TourDao tourDao;
    private final UserMapper userMapper;

    private final TappaService tappaService;

    @Autowired
    public TourServiceImpl(TourDao tourDao, UserMapper userMapper, TappaService tappaService) {
        this.tourDao = tourDao;
        this.userMapper = userMapper;
        this.tappaService = tappaService;
    }

    @Override
    public TourDto findTourById(Long id) {
        return tourDao.findTourById(id);
    }

    @Override
    public Long getNextTourId() {
        return tourDao.getNextTourId();
    }

    @Override
    public List<TourDto> findTourByUsername(String username) {
        return tourDao.findTourByUsername(username);
    }

    @Override
    public boolean saveTour(TourDto tour) {
        if(tour==null)
            return false;
        tourDao.saveTour(tour);
        return true;
    }
    public boolean generateTour(String email) {
        UserDto user=userMapper.findByEmail(email);
        TourDto tour=new TourDto(); //DA VEDERE SE BISOGNA AGGIUNGERE CAMPI COME USERNAME
        tour.setStato(StatiTour.IN_PROGRAMMA);
        tour.setUsername(user.getUsername());
        ArrayList<String> attractions=new ArrayList<String>();
        attractions.add("partenza");
        ArrayList<String> coordinates=new ArrayList<String>();
        coordinates.add(user.getCoordinateAlloggio());
        ArrayList<TappaDto> tappe=tappaService.getAllTappe();
        for (TappaDto t: tappe) {
            attractions.add(t.getNome());
            coordinates.add(t.getCoordinate());
                                }
        int[][] arraycoord = new int[coordinates.size()][2];
        for(int i=0; i<coordinates.size(); i++) {
            String[] numeriStringa = coordinates.get(i).split(", ");
            arraycoord[i][0] = Integer.parseInt(numeriStringa[0]);
            arraycoord[i][1] = Integer.parseInt(numeriStringa[1]);
        }
        List<String> bestPath = solveTSP(attractions, arraycoord);
        int n=bestPath.size();
        int ng=user.getNumeroGiorni()*4;
        if(n>ng) {
            n = ng+1;
        }
        tour.setNumeroGiorni(user.getNumeroGiorni());
        tour.setDataGenerazione(LocalDate.now());
        saveTour(tour);

        Long lastTourSavedId = getNextTourId() - 1;
        TourDto savedTour = findTourById(lastTourSavedId);

        //Prima tappa: partenza
        for(int i=1; i<n; i++){
            TappaDto tap=tappaService.findTappaByName(bestPath.get(i));
            tappaService.saveTappaTour(savedTour.getId(), tap.getId(), false);
        }
        return true;

    }

    @Override
    public boolean updateTourState(Long id,String stato) {
        TourDto currentTour = this.findTourById(id);
        if(currentTour==null)
            return false;
        if(!stato.equals(StatiTour.ARCHIVIATO) && !stato.equals(StatiTour.IN_CORSO) && !stato.equals(StatiTour.IN_PROGRAMMA) )
            return false;
        currentTour.setStato(stato);
        tourDao.updateTourState(currentTour);
        return true;
    }

    @Override
    public boolean deleteTour(Long id) {
        if(tourDao.findTourById(id)==null)
            return false;
        tourDao.deleteTour(id);
        return true;
    }

    //@Override
    /*public boolean generateTour(String email) {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection c = DriverManager.getConnection(
                    "jdbc:postgresql://127.0.0.1:13000/citywander",
                    "postgres",
                    "citywander")) {
                //MODIFICARE CON GETALLTAPPE!!!!!!!!!!!!!!!!!!!!!
                try (Statement stmt = c.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM tappa")) {
                    UserDto user=userMapper.findByEmail(email);
                    String username=user.getUsername();
                    TourDto tour=new TourDto(); //DA VEDERE SE BISOGNA AGGIUNGERE CAMPI COME USERNAME
                    saveTour(tour);
                    ArrayList<String> attractions=new ArrayList<String>();
                    attractions.add("partenza");
                    ArrayList<String> coordinates=new ArrayList<String>();
                    coordinates.add(user.getCoordinateAlloggio());
                    while (rs.next()) {
                        attractions.add(rs.getString("nome"));
                        coordinates.add(rs.getString("coordinate"));
                        //int[] cor = Integer.parseInt(rs.getString("coordinate").split(", "));
                    }
                    int[][] arraycoord = new int[coordinates.size()][2];
                    for(int i=0; i<coordinates.size(); i++) {
                        String[] numeriStringa = coordinates.get(i).split(", ");
                        arraycoord[i][0] = Integer.parseInt(numeriStringa[0]);
                        arraycoord[i][1] = Integer.parseInt(numeriStringa[1]);
                    }
                    List<String> bestPath = solveTSP(attractions, arraycoord);
                    //System.out.println("Miglior percorso: " + bestPath);
                    int n=bestPath.size();
                    int ng=user.getNumeroGiorni()*4;
                    if(n>ng)
                        n=ng;
                    for(int i=0; i<n; i++){
                        TappaDto tap=tappaService.findTappaByName(bestPath.get(i));
                        tappaService.saveTappaTour(tour.getId(), tap.getId(), false);
                    }
                }
            }
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            return false;
        }

    }*/
    public static List<String> solveTSP(ArrayList<String> attractions, int[][] coordinates) {
        int n = attractions.size();
        boolean[] visited = new boolean[n];
        Arrays.fill(visited, false);

        List<String> path = new ArrayList<>();
        int currentAttraction = 0; // Partenza dalla prima attrazione
        path.add(attractions.get(currentAttraction));
        visited[currentAttraction] = true;

        for (int i = 1; i < n; i++) {
            int nearestAttraction = findNearestAttraction(currentAttraction, visited, coordinates);
            path.add(attractions.get(nearestAttraction));
            visited[nearestAttraction] = true;
            currentAttraction = nearestAttraction;
        }

        return path;
    }

    private static int findNearestAttraction(int currentAttraction, boolean[] visited, int[][] coordinates) {
        int n = visited.length;
        int nearestAttraction = -1;
        double minDistance = Double.MAX_VALUE;

        for (int i = 0; i < n; i++) {
            if (!visited[i] && i != currentAttraction) {
                double distance = calculateDistance(coordinates[currentAttraction][0], coordinates[currentAttraction][1],
                        coordinates[i][0], coordinates[i][1]);
                if (distance < minDistance) {
                    minDistance = distance;
                    nearestAttraction = i;
                }
            }
        }

        return nearestAttraction;
    }

    //DISTANZA EUCLIDEA
    private static double calculateDistance(int x1, int y1, int x2, int y2) {
        return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
    }
}
