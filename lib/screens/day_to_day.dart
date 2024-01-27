import 'package:flutter/material.dart';
import 'package:traveladic_app/models/trips_model.dart';
import 'package:traveladic_app/styles/app_styles.dart';

class DayToDay extends StatelessWidget {
  const DayToDay({super.key, required, required this.trips, required this.dia});
  final Trips trips;
  final Itinerari dia;

  @override
  Widget build(BuildContext context) {
    final int currentIndex = trips.itinerari.indexOf(dia);
    final bool hasPrevious = currentIndex > 0;
    final bool hasNext = currentIndex < trips.itinerari.length - 1;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        if (hasPrevious)
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DayToDay(
                                    dia: trips.itinerari[currentIndex - 1],
                                    trips: trips,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_back_ios),
                          )
                        else
                          Container(),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Wrap(children: [
                            Text(
                              'Dia ${dia.dia} - ${dia.titol}',
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        if (hasNext)
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DayToDay(
                                    dia: trips.itinerari[currentIndex + 1],
                                    trips: trips,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_forward_ios),
                          )
                        else
                          Container(),
                      ],
                    )
                  ],
                ),
                if (dia.cover != null) AppStyles.separator,
                dia.cover != null
                    ? Image.network(
                        dia.cover!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, _, __) {
                          return Container();
                        },
                      )
                    : Container(),
                AppStyles.separator,
                Text(dia.descripcio),
              ],
            ),
          ),
        ));
  }
}
