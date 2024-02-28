package it.itsvil.citywanderbackend.service.impl;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Geocoding {

    private static final String API_KEY = "66d388d8cbb24004b0c5dd2a334c35b8";

    public static String geocoding(String location) throws IOException {
        // Define the address to geocode
        String address = location;
        if(!location.contains("salerno") && !location.contains("Salerno")){
            address = address + ", Salerno";
        }
        // Build the API URL
        String url = "https://api.geoapify.com/v1/geocode/search?text=" + address + "&limit=1&apiKey=" + API_KEY;

        // Open a connection to the URL
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        // Set the request method to GET
        connection.setRequestMethod("GET");

        // Get the response code
        int responseCode = connection.getResponseCode();

        if (responseCode == 200) {
            // Read the response data
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // Close the reader
            reader.close();

            // Parse the JSON data from the response
            String jsonResponse = response.toString();
            //System.out.println(jsonResponse);

            // Extract the latitude and longitude from the JSON response
            String[] coordinates = extractCoordinates(jsonResponse);

            // Return the formatted result
            if(Double.parseDouble(coordinates[1])<40.5 || Double.parseDouble(coordinates[1])>40.75 || Double.parseDouble(coordinates[0])<14.5 || Double.parseDouble(coordinates[0])>15)
                return null;
            return coordinates[1] + ", " + coordinates[0];
        } else {
            // Handle the error case
            return null;
        }
    }

    private static String[] extractCoordinates(String jsonResponse) {
        String[] coordinates = new String[2];
        coordinates=jsonResponse.split("coordinates\":");
        coordinates=coordinates[1].split("}");
        coordinates=coordinates[0].split(",");
        coordinates[0]=coordinates[0].substring(1);
        coordinates[1]=coordinates[1].substring(0, coordinates[1].length()-1);

        return coordinates;
    }

    public static void main(String[] args) {
        try {
            // Get the address to geocode from command line arguments
            String addressToGeocode = args[0];

            // Call the geocoding function
            String geocodingResult = geocoding(addressToGeocode);

            // Print the result
            System.out.println(geocodingResult);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
