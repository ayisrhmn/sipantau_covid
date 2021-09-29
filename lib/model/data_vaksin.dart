import 'dart:convert';

class DataVaksin {
  dynamic totalsasaran;
  dynamic sasaranvaksinsdmk;
  dynamic sasaranvaksinlansia;
  dynamic sasaranvaksinpetugaspublik;
  dynamic vaksinasi1;
  dynamic vaksinasi2;
  dynamic lastUpdate;

  DataVaksin({
    this.totalsasaran,
    this.sasaranvaksinsdmk,
    this.sasaranvaksinlansia,
    this.sasaranvaksinpetugaspublik,
    this.vaksinasi1,
    this.vaksinasi2,
    this.lastUpdate,
  });

  factory DataVaksin.fromJson(Map<String, dynamic> data) {
    return DataVaksin(
      totalsasaran: data['totalsasaran'],
      sasaranvaksinsdmk: data['sasaranvaksinsdmk'],
      sasaranvaksinlansia: data['sasaranvaksinlansia'],
      sasaranvaksinpetugaspublik: data['sasaranvaksinpetugaspublik'],
      vaksinasi1: data['vaksinasi1'],
      vaksinasi2: data['vaksinasi2'],
      lastUpdate: data['lastUpdate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalsasaran': totalsasaran,
      'sasaranvaksinsdmk': sasaranvaksinsdmk,
      'sasaranvaksinlansia': sasaranvaksinlansia,
      'sasaranvaksinpetugaspublik': sasaranvaksinpetugaspublik,
      'vaksinasi1': vaksinasi1,
      'vaksinasi2': vaksinasi2,
      'lastUpdate': lastUpdate,
    };
  }

  @override
  String toString() {
    return 'CovidIndoProv{totalsasaran: $totalsasaran, sasaranvaksinsdmk: $sasaranvaksinsdmk, sasaranvaksinlansia: $sasaranvaksinlansia, sasaranvaksinpetugaspublik: $sasaranvaksinpetugaspublik, vaksinasi1: $vaksinasi1, vaksinasi2: $vaksinasi2, lastUpdate: $lastUpdate';
  }
}

DataVaksin dataVaksinFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return DataVaksin.fromJson(data);
}

String dataVaksinToJson(DataVaksin data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
