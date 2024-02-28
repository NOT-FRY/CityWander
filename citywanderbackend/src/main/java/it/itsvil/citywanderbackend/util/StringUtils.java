package it.itsvil.citywanderbackend.util;

public class StringUtils {
    /**
     *
     * @param str
     * @return true se la stringa str è vuota, null o contiene solo whitespaces
     */
    public static boolean isNullOrEmpty(String str){
        return (str == null || str.isBlank());
    }
}
