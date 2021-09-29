import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:sipantau_covid/model/data_vaksin.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/utils/api_service.dart';
import 'package:sipantau_covid/widgets/info_card.dart';

class Vaksin extends StatefulWidget {
  const Vaksin({Key? key}) : super(key: key);

  @override
  State<Vaksin> createState() => _VaksinState();
}

class _VaksinState extends State<Vaksin> {
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
        future: apiService.getDataVaksin(),
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
            DataVaksin dataVaksin = snapshot.data;

            Moment lastUpdate = Moment.parse(dataVaksin.lastUpdate);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vaksinasi di Indonesia',
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
                infoCardSection(dataVaksin),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget infoCardSection(DataVaksin data) {
    return Column(
      children: [
        Row(
          children: [
            InfoCard(
              iconData: Icons.track_changes,
              iconColor: blueColor,
              total: formatter
                  .format(
                    data.totalsasaran ?? 0,
                  )
                  .toString(),
              title: 'Total Sasaran',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.local_hospital,
              iconColor: successColor,
              total: formatter
                  .format(
                    data.sasaranvaksinsdmk ?? 0,
                  )
                  .toString(),
              title: 'SDM Kesehatan',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            InfoCard(
              iconData: Icons.elderly,
              iconColor: warningColor,
              total: formatter
                  .format(
                    data.sasaranvaksinlansia ?? 0,
                  )
                  .toString(),
              title: 'Lansia',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.work,
              iconColor: Colors.cyan,
              total: formatter
                  .format(
                    data.sasaranvaksinpetugaspublik ?? 0,
                  )
                  .toString(),
              title: 'Petugas Publik',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            InfoCard(
              iconData: Icons.medication,
              iconColor: primaryColor,
              total: formatter
                  .format(
                    data.vaksinasi1 ?? 0,
                  )
                  .toString(),
              title: 'Vaksinasi 1',
            ),
            const SizedBox(
              width: 15,
            ),
            InfoCard(
              iconData: Icons.medication,
              iconColor: primaryColor,
              total: formatter
                  .format(
                    data.vaksinasi2 ?? 0,
                  )
                  .toString(),
              title: 'Vaksinasi 2',
            ),
          ],
        ),
      ],
    );
  }
}
