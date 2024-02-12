class WeatherData {
  final int humidity;
  final double tempMax;

  WeatherData({required this.humidity, required this.tempMax});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      humidity: json['main']['humidity'],
      tempMax: json['main']['temp_max'],
    );
  }
}
