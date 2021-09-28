import 'dart:convert';

class CovidGlobalRecovered {
  String name;
  String recovered;

  CovidGlobalRecovered({
    this.name = '',
    this.recovered = '',
  });

  factory CovidGlobalRecovered.fromJson(Map<String, dynamic> data) {
    return CovidGlobalRecovered(
      name: data['name'],
      recovered: data['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'recovered': recovered,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{name: $name, recovered: $recovered';
  }
}

CovidGlobalRecovered covidGlobalRecoveredFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return CovidGlobalRecovered.fromJson(data);
}

String covidGlobalRecoveredToJson(CovidGlobalRecovered data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
