import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../styles/app_styles.dart';

final Uri _urlWhatsapp =
    Uri.parse('https://api.whatsapp.com/send?phone=+34644699972');

final Uri _urlWeb = Uri.parse('https://traveladic.com');

final Uri _urlTel = Uri(scheme: 'tel', path: '+34644699972');

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Travelàdic',
          textAlign: TextAlign.center,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'avatarTag',
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://traveladic.com/wp-content/uploads/2022/06/cropped-LogoEarth-Big.png',
                    ),
                    radius: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            children: [
              const Text(
                "Contacta'ns",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text('Tens 4 vies per contactar-nos:'),
              AppStyles.separator,
              GestureDetector(
                onTap: _launchUrlTel,
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Pots trucar-nos',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              AppStyles.smallSeparator,
              GestureDetector(
                onTap: _launchUrlWhatsapp,
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.message,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Pots enviar-nos un whatsapp',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              AppStyles.smallSeparator,
              GestureDetector(
                onTap: _launchUrlEmail,
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.mail,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Pots enviar-nos un correu electrònic',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              AppStyles.smallSeparator,
              GestureDetector(
                onTap: _launchUrlWeb,
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.web_rounded,
                                size: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                'Pots visitar la nostra web',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppStyles.footerText,
        unselectedItemColor: AppStyles.principal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Pàgina principal',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), label: "Contacta'ns"),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Contact(),
              ),
            );
          }
        },

        // Per fer CALLS --> https://www.youtube.com/watch?v=ui4oF6qzAE8
      ),
    );
  }

  Future<void> _launchUrlWeb() async {
    if (!await launchUrl(_urlWeb)) {
      throw Exception('Could not launch $_urlWeb');
    }
  }

  Future<void> _launchUrlWhatsapp() async {
    if (!await launchUrl(_urlWhatsapp)) {
      throw Exception('Could not launch $_urlWhatsapp');
    }
  }

  Future<void> _launchUrlTel() async {
    if (!await launchUrl(_urlTel)) {
      throw Exception('Could not launch $_urlTel');
    }
  }

  Future<void> _launchUrlEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'info@traveladic.com',
      queryParameters: {'subject': 'Hello from Flutter!'},
    );

    // final String emailUrl = emailUri.toString();

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      await launchUrl(emailUri);
    }
  }
}
