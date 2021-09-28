import 'dart:convert';

class CovidIndoProv {
  String provinsi;
  int confirmed;
  int recovered;
  int deaths;

  CovidIndoProv({
    this.provinsi = '',
    this.confirmed = 0,
    this.recovered = 0,
    this.deaths = 0,
  });

  factory CovidIndoProv.fromJson(Map<String, dynamic> data) {
    return CovidIndoProv(
      provinsi: data['attributes']['Provinsi'],
      confirmed: data['attributes']['Kasus_Posi'],
      recovered: data['attributes']['Kasus_Semb'],
      deaths: data['attributes']['Kasus_Meni'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provinsi': provinsi,
      'confirmed': confirmed,
      'recovered': recovered,
      'deaths': deaths,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{provinsi: $provinsi, confirmed: $confirmed, recovered: $recovered, deaths: $deaths}';
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
