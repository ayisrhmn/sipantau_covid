import 'dart:convert';

class CovidIndo {
  dynamic confirmed;
  dynamic active;
  dynamic recovered;
  dynamic deaths;
  dynamic lastUpdate;

  CovidIndo({
    this.confirmed,
    this.active,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  factory CovidIndo.fromJson(Map<String, dynamic> data) {
    return CovidIndo(
      confirmed: data['positif'],
      active: data['dirawat'],
      recovered: data['sembuh'],
      deaths: data['meninggal'],
      lastUpdate: data['lastUpdate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'confirmed': confirmed,
      'active': active,
      'recovered': recovered,
      'deaths': deaths,
      'lastUpdate': lastUpdate,
    };
  }

  @override
  String toString() {
    return 'CovidIndo{confirmed: $confirmed, active: $active, recovered: $recovered, deaths: $deaths, lastUpdate: $lastUpdate}';
  }
}

CovidIndo covidIndoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return CovidIndo.fromJson(data);
}

String covidIndoToJson(CovidIndo data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
