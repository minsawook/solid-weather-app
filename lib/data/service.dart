import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_data.dart';

class WeatherService {
  final String _apiKey;
  final http.Client _client;

  WeatherService({required String apiKey, http.Client? client})
      : _apiKey = apiKey,
        _client = client ?? http.Client();

  Future<WeatherData> getWeatherData(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey';
    final response = await _client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}

