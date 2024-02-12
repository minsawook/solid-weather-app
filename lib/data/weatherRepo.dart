import '../model/weather_data.dart';
import 'data_source.dart';

class WeatherRepository {
  final WeatherDataSource dataSource;

  WeatherRepository(this.dataSource);

  Future<WeatherData> getWeatherData(String city) =>
      dataSource.getWeatherData(city);
}