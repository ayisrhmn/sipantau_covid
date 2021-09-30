import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sipantau_covid/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoApl extends StatefulWidget {
  const InfoApl({Key? key}) : super(key: key);

  @override
  State<InfoApl> createState() => _InfoAplState();
}

class _InfoAplState extends State<InfoApl> {
  // ignore: unused_field
  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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
              'Info Aplikasi',
              style: titleText.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Data seputar COVID-19 yang tertera pada aplikasi ini bersumber dari :\n',
              style: subtitleText.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
            Container(
              transform: Matrix4.translationValues(0, -18, 0),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      '\u2022',
                      style: titleText.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    minLeadingWidth: 5,
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                    ),
                    title: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'data.covid19.go.id/public/api',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                        'https://data.covid19.go.id/public/api/update.json',
                                      );
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' yang diakses melalui Application Programming Interface (API) yang disediakan oleh ',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Reynaldi531',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                        'https://github.com/Reynadi531/api-covid19-indonesia-v2',
                                      );
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' secara open source untuk Data Covid-19 di Indonesia.',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      '\u2022',
                      style: titleText.copyWith(fontSize: 18),
                    ),
                    minLeadingWidth: 5,
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                    ),
                    title: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'api.kawalcorona.com',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                        'https://api.kawalcorona.com',
                                      );
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' yang diakses melalui Application Programming Interface (API) yang disediakan oleh ',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'kawalcorona.com',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                        'https://kawalcorona.com',
                                      );
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' secara open source untuk Data Covid-19 Global.',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      '\u2022',
                      style: titleText.copyWith(fontSize: 18),
                    ),
                    minLeadingWidth: 5,
                    contentPadding: const EdgeInsets.only(
                      top: 0,
                      left: 15,
                    ),
                    title: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'www.kemkes.go.id',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                          'https://www.kemkes.go.id');
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' yang diakses melalui Application Programming Interface (API) yang disediakan oleh ',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Reynaldi531',
                            style: titleText.copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      _launched = _launchInBrowser(
                                        'https://github.com/Reynadi531/vaksincovid19-api',
                                      );
                                    },
                                  ),
                          ),
                          TextSpan(
                            text:
                                ' secara open source untuk Data Vaksinasi di Indonesia.',
                            style: subtitleText.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Aplikasi yang sedang Anda gunakan ini dibuat dengan tujuan untuk mempermudah dalam pengaksesan data.\n',
              style: subtitleText.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              'Namun, jika ada kesalahan yang disebabkan oleh kekeliruan pada data tersebut bukan merupakan tanggung jawab pengembang.\n',
              style: subtitleText.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Github: ',
                    style: titleText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'ayisrhmn/sipantau_covid\n',
                    style: titleText.copyWith(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => setState(
                            () {
                              _launched = _launchInBrowser(
                                'https://github.com/ayisrhmn/sipantau_covid',
                              );
                            },
                          ),
                  ),
                  TextSpan(
                    text: 'Email: ',
                    style: titleText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'farizrahman30@gmail.com',
                    style: titleText.copyWith(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => setState(
                            () {
                              _launched = _launchInBrowser(
                                'mailto:farizrahman30@gmail.com',
                              );
                            },
                          ),
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
