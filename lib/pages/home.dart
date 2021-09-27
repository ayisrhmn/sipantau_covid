import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/widgets/info_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
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
            Row(
              children: const [
                InfoCard(
                  iconData: Icons.add_circle,
                  iconColor: blueColor,
                  total: '4,305,699',
                  title: 'Total Positif',
                ),
                SizedBox(
                  width: 15,
                ),
                InfoCard(
                  iconData: Icons.healing,
                  iconColor: warningColor,
                  total: '42,058',
                  title: 'Kasus Aktif',
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                InfoCard(
                  iconData: Icons.health_and_safety,
                  iconColor: successColor,
                  total: '42,058',
                  title: 'Total Sembuh',
                ),
                SizedBox(
                  width: 15,
                ),
                InfoCard(
                  iconData: Icons.remove_circle,
                  iconColor: dangerColor,
                  total: '42,058',
                  title: 'Total Meninggal',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Data Covid-19 di Indonesia\nberdasarkan Provinsi',
              style: titleText.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
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
                      'Positif',
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
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          'DKI Jakarta',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '406,205',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '393,166',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '6,625',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          'Jawa Barat',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '406,205',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '393,166',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '6,625',
                          style: subtitleText.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
