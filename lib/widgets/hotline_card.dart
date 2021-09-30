import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineCard extends StatefulWidget {
  final String urlImage;
  final String phoneUrl;
  final String phone;
  final String name;

  const HotlineCard({
    Key? key,
    required this.urlImage,
    required this.phoneUrl,
    required this.phone,
    required this.name,
  }) : super(key: key);

  @override
  State<HotlineCard> createState() => _HotlineCardState();
}

class _HotlineCardState extends State<HotlineCard> {
  // ignore: unused_field
  Future<void>? _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => setState(() {
        _launched = _makePhoneCall('tel:${widget.phoneUrl}');
      }),
      padding: const EdgeInsets.all(0),
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
                  widget.urlImage,
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
                      widget.phone,
                      style: titleText.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.name,
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
