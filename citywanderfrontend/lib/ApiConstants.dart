class ApiConstants {
  static String IP_ADDRESS = '82.59.246.151';
  static String baseUrl = 'http://${IP_ADDRESS}:13004/citywanderbackend';
  static String imageRecognitionUploadURL = 'http://${IP_ADDRESS}:5000/uploadImage';
  static String imageRecognitionURL = 'http://${IP_ADDRESS}:5000/imageRecognition';

  static String loginEndpoint = '/auth/login';
  static String registerEndpoint = '/auth/register';
  static String registerEsercenteEndpoint = '/auth/registerEsercente';
  static String isUsernameTakenEndpoint = '/auth/isUsernameTaken';
  static String isEmailTakenEndpoint = '/auth/isEmailTaken';
  static String findUserByEmailEndpoint = '/auth/findUserByEmail';
  static String getAllTappeEndpoint = '/citywander/tappa/getAllTappe';
  static String findTappeByTourIdEndpoint = '/citywander/tappa/findTappeByTourId';
  static String findTopRistorantiEndpoint = '/citywander/ristorante/findTopRistoranti';
  static String findRistoranteByNameEndpoint = '/citywander/ristorante/findRistoranteByName';
  static String findRistoranteByUsernameEndpoint = '/citywander/ristorante/findRistorantiByUsername';
  static String getTappeNotCompleteEndpoint= '/citywander/tappa/findTappeNonCompletateByTourId';
  static String findSezioniByTappaIdEndpoint= '/citywander/sezione/findSezioniByTappaId';
  static String setTappaTourCompletataEndpoint= '/citywander/tappa/setTappaTourCompletata';
  static String addPointsToUserEndpoint= '/citywander/user/addPointsToUser';
  static int  LIMITE_RISTORANTI = 10;
  static String updateUserProfilingEndpoint = '/citywander/user/updateUserProfiling';
  static String findTourByUsernameEndpoint = '/citywander/tour/findTourByUsername';
  static String generateTourEndpoint = '/citywander/tour/generateTour';
  static String updateTourStateEndpoint = '/citywander/tour/updateTourState';
  static String deleteTourEndpoint = '/citywander/tour/deleteTour';
  static String geocodingEndpoint = '/citywander/ristorante/generateCoordinate';
  
}