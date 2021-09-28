import 'package:flutter/material.dart';
import 'package:sipantau_covid/model/covidindo.dart';
import 'package:sipantau_covid/model/covidindo_prov.dart';
import 'package:sipantau_covid/utils/api_service.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/widgets/info_card.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ApiService apiService;
  var formatter = NumberFormat('#,##0');

  @override
  void initState() {
    apiService = ApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: FutureBuilder(
        future: Future.wait(
          [
            apiService.getCovidIndo(),
            apiService.getCovidIndoProv(),
          ],
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                  width: 50,
                  height: 50,
                ),
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Covid-19 di Indonesia',
                  style: titleText.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                infoCardSection(snapshot.data[0]),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Covid-19 di Indonesia\nberdasarkan Provinsi',
                  style: titleText.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                dataTableSection(snapshot.data[1]),
              ],
            );
          }
        },
      ),
    );
  }

  Widget infoCardSection(List<CovidIndo> dataCovidIndo) {
    CovidIndo data = dataCovidIndo[0];

    return Column(
      children: [
        Row(
          children: [
            InfoCard(
              iconData: Icons.add_circle,
              iconColor: blueColor,
              total: data.confirmed,
              title: 'Terkonfirmasi',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.healing,
              iconColor: warningColor,
              total: data.active,
              title: 'Kasus Aktif',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            InfoCard(
              iconData: Icons.health_and_safety,
              iconColor: successColor,
              total: data.recovered,
              title: 'Sembuh',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.remove_circle,
              iconColor: dangerColor,
              total: data.deaths,
              title: 'Meninggal',
            ),
          ],
        ),
      ],
    );
  }

  Widget dataTableSection(List<CovidIndoProv> listCovidIndoProv) {
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowHeight: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            columns: <DataColumn>[
              DataColumn(
                label: Text(
                  'Provinsi',
                  style: titleText.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Terkonfirmasi',
                  style: titleText.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Sembuh',
                  style: titleText.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Meninggal',
                  style: titleText.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
            rows: listCovidIndoProv
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 120,
                          child: Text(
                            e.provinsi,
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter.format(e.confirmed ?? 0).toString(),
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter.format(e.recovered ?? 0).toString(),
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter.format(e.deaths ?? 0).toString(),
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
