import 'package:flutter/material.dart';
import 'package:traveladic_app/styles/app_styles.dart';

class PreTrip extends StatelessWidget {
  const PreTrip({
    super.key,
    required this.abansDeViatjar,
  });
  final List<String> abansDeViatjar;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            const Text(
              'Dades interessants abans de viatjar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            AppStyles.smallSeparator,
            for (var dada in abansDeViatjar)
              Row(
                children: [
                  const Icon(
                    Icons.fact_check,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    dada,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
