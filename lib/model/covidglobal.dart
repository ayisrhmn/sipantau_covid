import 'dart:convert';

class CovidGlobal {
  String country;
  dynamic confirmed;
  dynamic recovered;
  dynamic deaths;
  dynamic lastUpdate;

  CovidGlobal({
    this.country = '',
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  factory CovidGlobal.fromJson(Map<String, dynamic> data) {
    return CovidGlobal(
      country: data['attributes']['Country_Region'],
      confirmed: data['attributes']['Confirmed'],
      recovered: data['attributes']['Recovered'],
      deaths: data['attributes']['Deaths'],
      lastUpdate: data['attributes']['Last_Update'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'confirmed': confirmed,
      'recovered': recovered,
      'deaths': deaths,
      'lastUpdate': lastUpdate,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{country: $country, confirmed: $confirmed, recovered: $recovered}, deaths: $deaths, lastUpdate: $lastUpdate}';
  }
}

List<CovidGlobal> covidGlobalFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<CovidGlobal>.from(data.map((item) => CovidGlobal.fromJson(item)));
}

String covidGlobalToJson(CovidGlobal data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
