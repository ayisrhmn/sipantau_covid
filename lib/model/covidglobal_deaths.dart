import 'dart:convert';

class CovidGlobalDeaths {
  String name;
  String deaths;

  CovidGlobalDeaths({
    this.name = '',
    this.deaths = '',
  });

  factory CovidGlobalDeaths.fromJson(Map<String, dynamic> data) {
    return CovidGlobalDeaths(
      name: data['name'],
      deaths: data['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'deaths': deaths,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{name: $name, deaths: $deaths';
  }
}

CovidGlobalDeaths covidGlobalDeathsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return CovidGlobalDeaths.fromJson(data);
}

String covidGlobalDeathsToJson(CovidGlobalDeaths data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
