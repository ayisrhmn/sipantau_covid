import 'dart:convert';

class CovidIndo {
  String country;
  String confirmed;
  String active;
  String recovered;
  String deaths;

  CovidIndo({
    this.country = '',
    this.confirmed = '',
    this.active = '',
    this.recovered = '',
    this.deaths = '',
  });

  factory CovidIndo.fromJson(Map<String, dynamic> data) {
    return CovidIndo(
      country: data['name'],
      confirmed: data['positif'],
      active: data['dirawat'],
      recovered: data['sembuh'],
      deaths: data['meninggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'confirmed': confirmed,
      'active': active,
      'recovered': recovered,
      'deaths': deaths,
    };
  }

  @override
  String toString() {
    return 'CovidIndo{country: $country, confirmed: $confirmed, active: $active, recovered: $recovered, deaths: $deaths}';
  }
}

List<CovidIndo> covidIndoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<CovidIndo>.from(data.map((item) => CovidIndo.fromJson(item)));
}

String covidIndoToJson(CovidIndo data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
