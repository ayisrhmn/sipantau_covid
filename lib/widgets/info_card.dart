import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';

class InfoCard extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String total;
  final String title;

  const InfoCard({
    Key? key,
    required this.iconData,
    required this.iconColor,
    required this.total,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(16),
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
                Icon(
                  iconData,
                  size: 24,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  total,
                  style: titleText.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: subtitleText.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
