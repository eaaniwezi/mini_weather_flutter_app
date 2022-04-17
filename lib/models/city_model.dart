class CityModel {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  CityModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}


List<CityModel> cityList = [
  CityModel(id: "1", name: "Кранснодар", latitude: 45.039268, longitude: 38.987221),
  CityModel(id: "2", name: "Москва", latitude: 55.751244, longitude: 37.618423),
  CityModel(id: "3", name: "Санкт-Петербург", latitude: 59.937500, longitude: 30.308611),
  CityModel(id: "4", name: "Казань", latitude: 55.796391, longitude: 49.108891),
  CityModel(id: "5", name: "Сочи", latitude: 43.588348, longitude: 39.729996),
  CityModel(id: "6", name: "Самара", latitude: 53.241505, longitude: 50.221245),
  CityModel(id: "7", name: "Воронеж", latitude: 51.67204, longitude: 39.1843),
];