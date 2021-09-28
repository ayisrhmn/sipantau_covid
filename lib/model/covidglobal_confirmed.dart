import 'dart:convert';

class CovidGlobalConfirmed {
  String name;
  String confirmed;

  CovidGlobalConfirmed({
    this.name = '',
    this.confirmed = '',
  });

  factory CovidGlobalConfirmed.fromJson(Map<String, dynamic> data) {
    return CovidGlobalConfirmed(
      name: data['name'],
      confirmed: data['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'confirmed': confirmed,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{name: $name, confirmed: $confirmed';
  }
}

CovidGlobalConfirmed covidGlobalConfirmedFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return CovidGlobalConfirmed.fromJson(data);
}

String covidGlobalConfirmedToJson(CovidGlobalConfirmed data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
