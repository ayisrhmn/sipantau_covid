import 'package:sipantau_covid/model/covidglobal.dart';
import 'package:sipantau_covid/model/covidglobal_confirmed.dart';
import 'package:sipantau_covid/model/covidglobal_recovered.dart';
import 'package:sipantau_covid/model/covidglobal_deaths.dart';
import 'package:sipantau_covid/model/covidindo.dart';
import 'package:sipantau_covid/model/covidindo_prov.dart';
import 'package:sipantau_covid/model/data_vaksin.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String urlCovidIndo = 'https://apicovid19indonesia-v2.vercel.app/api';
  final String urlCovidGlobal = 'https://api.kawalcorona.com';
  final String urlVaksin = 'https://vaksincovid19-api.vercel.app/api';
  Client client = Client();

  Future<CovidIndo?> getCovidIndo() async {
    final response = await client.get(
      Uri.parse('$urlCovidIndo/indonesia'),
    );
    if (response.statusCode == 200) {
      return covidIndoFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<CovidIndoProv>?> getCovidIndoProv() async {
    final response = await client.get(
      Uri.parse('$urlCovidIndo/indonesia/provinsi'),
    );
    if (response.statusCode == 200) {
      return covidIndoProvFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalConfirmed?> getCovidGlobalConfirmed() async {
    final response = await client.get(
      Uri.parse('$urlCovidGlobal/positif'),
    );
    if (response.statusCode == 200) {
      return covidGlobalConfirmedFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalRecovered?> getCovidGlobalRecovered() async {
    final response = await client.get(
      Uri.parse('$urlCovidGlobal/sembuh'),
    );
    if (response.statusCode == 200) {
      return covidGlobalRecoveredFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<CovidGlobalDeaths?> getCovidGlobalDeaths() async {
    final response = await client.get(
      Uri.parse('$urlCovidGlobal/meninggal'),
    );
    if (response.statusCode == 200) {
      return covidGlobalDeathsFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<CovidGlobal>?> getCovidGlobal() async {
    final response = await client.get(
      Uri.parse(urlCovidGlobal),
    );
    if (response.statusCode == 200) {
      return covidGlobalFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<DataVaksin?> getDataVaksin() async {
    final response = await client.get(
      Uri.parse('$urlVaksin/vaksin'),
    );
    if (response.statusCode == 200) {
      return dataVaksinFromJson(response.body);
    } else {
      return null;
    }
  }
}
