import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:flutter/services.dart';

class HotlineCard extends StatelessWidget {
  final String urlImage;
  final String phoneCopied;
  final String phone;
  final String name;

  const HotlineCard({
    Key? key,
    required this.urlImage,
    required this.phoneCopied,
    required this.phone,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(
          ClipboardData(
            text: phoneCopied,
          ),
        );

        final snackBar = SnackBar(
          content: Text(
            '$name ($phone)\nCopy to clipboard',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  urlImage,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phone,
                      style: titleText.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      name,
                      style: subtitleText.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
