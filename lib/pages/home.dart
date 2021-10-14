import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sipantau_covid/model/covidindo.dart';
import 'package:sipantau_covid/model/covidindo_prov.dart';
import 'package:sipantau_covid/utils/api_service.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/widgets/info_card.dart';
import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';

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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return shimmerLoading();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              CovidIndo dataCovidIndo = snapshot.data[0];
              List<CovidIndoProv> listCovidIndoProv = snapshot.data[1];

              Moment lastUpdate = Moment.parse(dataCovidIndo.lastUpdate);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid-19 di Indonesia',
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
                  infoCardSection(dataCovidIndo),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Covid-19 di Indonesia tiap Provinsi',
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
                  dataTableSection(listCovidIndoProv),
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
            width: 198,
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
          Column(
            children: List.generate(2, (index) {
              return Column(
                children: [
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
                ],
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 282,
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

  Widget infoCardSection(CovidIndo data) {
    return Column(
      children: [
        Row(
          children: [
            InfoCard(
              iconData: Icons.add_circle,
              iconColor: blueColor,
              total: formatter
                  .format(
                    data.confirmed ?? 0,
                  )
                  .toString(),
              title: 'Terkonfirmasi',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.healing,
              iconColor: warningColor,
              total: formatter
                  .format(
                    data.active ?? 0,
                  )
                  .toString(),
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
              total: formatter
                  .format(
                    data.recovered ?? 0,
                  )
                  .toString(),
              title: 'Sembuh',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.remove_circle,
              iconColor: dangerColor,
              total: formatter
                  .format(
                    data.deaths ?? 0,
                  )
                  .toString(),
              title: 'Meninggal',
            ),
          ],
        ),
      ],
    );
  }

  Widget dataTableSection(List<CovidIndoProv> listData) {
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
                  'Kasus Aktif',
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
                            data.provinsi.toUpperCase(),
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
                                data.active ?? 0,
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
