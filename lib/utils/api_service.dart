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
}