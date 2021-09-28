import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipantau_covid/model/covidglobal.dart';
import 'package:sipantau_covid/model/covidglobal_confirmed.dart';
import 'package:sipantau_covid/model/covidglobal_deaths.dart';
import 'package:sipantau_covid/model/covidglobal_recovered.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/utils/api_service.dart';
import 'package:sipantau_covid/widgets/info_card.dart';

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
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
            apiService.getCovidGlobalConfirmed(),
            apiService.getCovidGlobalRecovered(),
            apiService.getCovidGlobalDeaths(),
            apiService.getCovidGlobal(),
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
                  'Covid-19 Global',
                  style: titleText.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                infoCardSection(
                    snapshot.data[0], snapshot.data[1], snapshot.data[2]),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Covid-19 Global tiap Negara',
                  style: titleText.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                dataTableSection(snapshot.data[3]),
              ],
            );
          }
        },
      ),
    );
  }

  Widget infoCardSection(
    CovidGlobalConfirmed dataConf,
    CovidGlobalRecovered dataRec,
    CovidGlobalDeaths dataDie,
  ) {
    return Column(
      children: [
        Row(
          children: [
            InfoCard(
              iconData: Icons.add_circle,
              iconColor: blueColor,
              total: dataConf.confirmed,
              title: 'Terkonfirmasi',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.health_and_safety,
              iconColor: successColor,
              total: dataRec.recovered,
              title: 'Sembuh',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            InfoCard(
              iconData: Icons.remove_circle,
              iconColor: dangerColor,
              total: dataDie.deaths,
              title: 'Meninggal',
            ),
          ],
        ),
      ],
    );
  }

  Widget dataTableSection(List<CovidGlobal> listCovidGlobal) {
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
            rows: listCovidGlobal
                .map(
                  (e) => DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 120,
                          child: Text(
                            e.country,
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
                          formatter.format(e.deaths).toString(),
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
