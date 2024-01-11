import 'package:flutter/material.dart';

import '../models/trips_model.dart';
import '../styles/app_styles.dart';

class IndividualTrip extends StatelessWidget {
  const IndividualTrip({super.key, required this.trips});
  final Trips trips;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(),
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
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Title(
              color: AppStyles.principal,
              child: Text(trips.viatge, style: const TextStyle(fontSize: 24),textAlign: TextAlign.center,),
            ),

            Text(
              trips.dates,
              style: const TextStyle(fontSize: 16),
            ),
            AppStyles.separator,
            const Text('Itinerari', style: TextStyle(fontSize: 30),),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var dia in trips.itinerari)
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppStyles.principal),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Dia ${dia.dia}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      dia.titol,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}