import 'dart:convert';

class CovidIndoProv {
  String provinsi;
  dynamic confirmed;
  dynamic active;
  dynamic recovered;
  dynamic deaths;

  CovidIndoProv({
    this.provinsi = '',
    this.confirmed,
    this.active,
    this.recovered,
    this.deaths,
  });

  factory CovidIndoProv.fromJson(Map<String, dynamic> data) {
    return CovidIndoProv(
      provinsi: data['provinsi'],
      confirmed: data['kasus'],
      active: data['dirawat'],
      recovered: data['sembuh'],
      deaths: data['meninggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provinsi': provinsi,
      'confirmed': confirmed,
      'active': active,
      'recovered': recovered,
      'deaths': deaths,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{provinsi: $provinsi, confirmed: $confirmed, active: $active, recovered: $recovered, deaths: $deaths}';
  }
}

List<CovidIndoProv> covidIndoProvFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<CovidIndoProv>.from(data.map((item) => CovidIndoProv.fromJson(item)));
}

String covidIndoProvToJson(CovidIndoProv data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
