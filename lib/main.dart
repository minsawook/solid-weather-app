import 'package:flutter/material.dart';
import 'package:untitled/weather_display.dart';

import 'data/data_source.dart';
import 'data/weatherRepo.dart';
import 'model/weather_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherDataSource weatherDataSource = WeatherService(apiKey: '2db2f66ff4c3c59a8ede85ea41cecfb6');
  late Future<WeatherData> _futureWeatherData;
  late WeatherRepository repository = WeatherRepository(weatherDataSource);
  final WeatherDisplay humidDisplay = HumidityDisplay();

  @override
  void initState() {
    super.initState();
    _futureWeatherData = repository.getWeatherData('Seoul');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in seoul'),
      ),
      body: Center(
        child: FutureBuilder<WeatherData>(
          future: _futureWeatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return humidDisplay.build(context, snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
