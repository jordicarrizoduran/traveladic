import 'package:flutter/material.dart';
import 'package:traveladic_app/styles/app_styles.dart';

class PreTrip extends StatelessWidget {
  const PreTrip({
    Key? key,
    required this.abansDeViatjar,
  }) : super(key: key);
  final List<String> abansDeViatjar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text('Travelàdic'),
            ]),
            Column(children: [
              Hero(
                tag: 'avatarTag',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://traveladic.com/wp-content/uploads/2022/06/cropped-LogoEarth-Big.png'),
                  radius: 20,
                ),
              )
            ]),
          ],
        ),
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
            ListView(shrinkWrap: true, children: [
              for (var dada in abansDeViatjar) Text(dada),
            ]),
          ],
        ),
      ),
    );
  }
}
