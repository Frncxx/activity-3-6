import 'dart:convert';
import 'dart:io';

void main() {
  fetchWeatherData().then((weatherData) {
    if (weatherData != null) {
      displayWeatherInfo(weatherData);
    } else {
      print('Failed to fetch weather data.');
    }
  });
}

Future<Map<String, dynamic>?> fetchWeatherData() async {
  String apiKey = 'YOUR_API_KEY'; // Replace 'YOUR_API_KEY' with your API key
  String city = 'New York'; // Replace 'New York' with desired city

  String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

  HttpClient httpClient = HttpClient();
  try {
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String jsonResponse = await response.transform(utf8.decoder).join();
      Map<String, dynamic> data = json.decode(jsonResponse);
      return data;
    } else {
      print('Failed to fetch weather data. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching weather data: $e');
    return null;
  } finally {
    httpClient.close();
  }
}

void displayWeatherInfo(Map<String, dynamic> weatherData) {
  String cityName = weatherData['name'];
  Map<String, dynamic> mainInfo = weatherData['main'];
  double temperature = mainInfo['temp'];
  int humidity = mainInfo['humidity'];

  print('Weather in $cityName:');
  print('Temperature: ${temperature.toStringAsFixed(1)}°C');
  print('Humidity: $humidity%');
}
