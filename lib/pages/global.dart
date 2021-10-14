import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_moment/simple_moment.dart';
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return shimmerLoading();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              CovidGlobalConfirmed confirmed = snapshot.data[0];
              CovidGlobalRecovered recovered = snapshot.data[1];
              CovidGlobalDeaths deaths = snapshot.data[2];
              List<CovidGlobal> listCovidGlobal = snapshot.data[3];

              var converTimestamp = DateTime.fromMillisecondsSinceEpoch(
                listCovidGlobal[0].lastUpdate,
              );

              Moment lastUpdate = Moment.parse(converTimestamp.toString());

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid-19 Global',
                    style: titleText.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Update terakhir: ' + lastUpdate.format('dd MMMM yyyy'),
                    style: subtitleText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  infoCardSection(
                    confirmed,
                    recovered,
                    deaths,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Covid-19 Global tiap Negara',
                    style: titleText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Update terakhir: ' + lastUpdate.format('dd MMMM yyyy'),
                    style: subtitleText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  dataTableSection(listCovidGlobal),
                ],
              );
            } else {
              return const Text('Empty Data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Widget shimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 148,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 220,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 232,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 220,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Flexible(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ],
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

  Widget dataTableSection(List<CovidGlobal> listData) {
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
            rows: listData
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 120,
                          child: Text(
                            data.country.toUpperCase(),
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter
                              .format(
                                data.confirmed ?? 0,
                              )
                              .toString(),
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter
                              .format(
                                data.recovered ?? 0,
                              )
                              .toString(),
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          formatter
                              .format(
                                data.deaths ?? 0,
                              )
                              .toString(),
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
