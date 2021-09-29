import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:sipantau_covid/widgets/hotline_card.dart';

class Hotline extends StatelessWidget {
  const Hotline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Covid-19 Hotline Indonesia',
              style: titleText.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/kemenkes.png',
              phoneCopied: '0215210411',
              phone: '021-5210-411',
              name: 'Kementrian Kesehatan',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/kemenkes.png',
              phoneCopied: '081212123119',
              phone: '0812-1212-3119',
              name: 'Kementrian Kesehatan',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/dki_jakarta.png',
              phoneCopied: '112',
              phone: '112',
              name: 'Pemprov DKI Jakarta',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/dki_jakarta.png',
              phoneCopied: '081388376955',
              phone: '0813-8837-6955',
              name: 'Pemprov DKI Jakarta',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jateng.png',
              phoneCopied: '0243580713',
              phone: '024-358-0713',
              name: 'Pemprov Jawa Tengah',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jateng.png',
              phoneCopied: '082313600560',
              phone: '0823-1360-0560',
              name: 'Pemprov Jawa Tengah',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jatim.png',
              phoneCopied: '0318430313',
              phone: '031-843-0313',
              name: 'Pemprov Jawa Timur',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jatim.png',
              phoneCopied: '081334367800',
              phone: '0813-3436-7800',
              name: 'Pemprov Jawa Timur',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jabar.png',
              phoneCopied: '119',
              phone: '119',
              name: 'Pemprov Jawa Barat',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/jabar.png',
              phoneCopied: '08112093306',
              phone: '0811-209-3306',
              name: 'Pemprov Jawa Barat',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/diy.png',
              phoneCopied: '0274555585',
              phone: '0274-555-585',
              name: 'Pemprov D.I. Yogyakarta',
            ),
            const SizedBox(
              height: 15,
            ),
            const HotlineCard(
              urlImage: 'assets/images/diy.png',
              phoneCopied: '08112764800',
              phone: '0811-2764-800',
              name: 'Pemprov D.I. Yogyakarta',
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
  //   return ListView(
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.only(
  //           top: 30,
  //           left: 15,
  //           right: 15,
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               'Covid-19 Hotline Indonesia',
  //               style: titleText.copyWith(
  //                 fontSize: 18,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             const HotlineCard(),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             const HotlineCard(),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
