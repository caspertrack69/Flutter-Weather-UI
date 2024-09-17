import 'weather_model.dart';

class WeatherRepository {
  Future<List<Weather>> fetchWeather() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Weather(
          kecamatan: 'Kecamatan Kalipuro',
          temperature: '30°C',
          weatherDescription: 'Cerah',
          humidity: '70%'),
      Weather(
          kecamatan: 'Kecamatan Banyuwangi',
          temperature: '32°C',
          weatherDescription: 'Mendung',
          humidity: '65%'),
      Weather(
          kecamatan: 'Kecamatan Giri',
          temperature: '28°C',
          weatherDescription: 'Hujan',
          humidity: '80%'),
    ];
  }
}
