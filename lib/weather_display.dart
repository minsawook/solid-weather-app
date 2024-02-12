import 'package:flutter/material.dart';

import 'model/weather_data.dart';

abstract class WeatherDisplay {
  Widget build(BuildContext context, WeatherData data);
}

class TemperatureDisplay extends WeatherDisplay {
  @override
  Widget build(BuildContext context, WeatherData data) {
    final temperature = data.tempMax;
    return Text(
      '${temperature.toStringAsFixed(1)}\u00B0C',
      style: TextStyle(fontSize: 20),
    );
  }
}

class HumidityDisplay extends WeatherDisplay {
  @override
  Widget build(BuildContext context, WeatherData data) {
    final humidity = data.humidity;
    return Text(
      'Humidity: ${humidity.toStringAsFixed(1)}%',
      style: TextStyle(fontSize: 20),
    );
  }
}