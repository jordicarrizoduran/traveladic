import 'package:flutter/material.dart';
import 'package:traveladic_app/models/trips_model.dart';

class DayToDay extends StatelessWidget {
  const DayToDay({super.key, required, required this.dia});
  final Itinerari dia;

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
            Text('Dia${dia.dia}'),
            Text(dia.titol),
            Text(dia.descripcio),
          ],
        ),
    )
    );
  }
}

