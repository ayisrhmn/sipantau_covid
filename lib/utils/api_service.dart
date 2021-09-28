import 'package:sipantau_covid/model/covidglobal.dart';
import 'package:sipantau_covid/model/covidglobal_confirmed.dart';
import 'package:sipantau_covid/model/covidglobal_recovered.dart';
import 'package:sipantau_covid/model/covidglobal_deaths.dart';
import 'package:sipantau_covid/model/covidindo.dart';
import 'package:sipantau_covid/model/covidindo_prov.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = 'https://api.kawalcorona.com';
  Client client = Client();

  Future<List<CovidIndo>?> getCovidIndo() async {
    final response = await client.get(Uri.parse('$baseUrl/indonesia'));
    if (response.statusCode == 200) {
      return covidIndoFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<CovidIndoProv>?> getCovidIndoProv() async {
    final response = await client.get(Uri.parse('$baseUrl/indonesia/provinsi'));
    if (response.statusCode == 200) {
      return covidIndoProvFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<CovidGlobal>?> getCovidGlobal() async {
    final response = await client.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return covidGlobalFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalConfirmed?> getCovidGlobalConfirmed() async {
    final response = await client.get(Uri.parse('$baseUrl/positif'));
    if (response.statusCode == 200) {
      return covidGlobalConfirmedFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalRecovered?> getCovidGlobalRecovered() async {
    final response = await client.get(Uri.parse('$baseUrl/sembuh'));
    if (response.statusCode == 200) {
      return covidGlobalRecoveredFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalDeaths?> getCovidGlobalDeaths() async {
    final response = await client.get(Uri.parse('$baseUrl/meninggal'));
    if (response.statusCode == 200) {
      return covidGlobalDeathsFromJson(response.body);
    } else {
      return null;
    }
  }
}
