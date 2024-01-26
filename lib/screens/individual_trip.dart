import 'package:flutter/material.dart';
import 'package:traveladic_app/screens/day_to_day.dart';
import 'package:traveladic_app/screens/pre_trip.dart';

import '../models/trips_model.dart';
import '../styles/app_styles.dart';
import 'luggage.dart';

class IndividualTrip extends StatelessWidget {
  const IndividualTrip({super.key, required this.trips});
  final Trips trips;

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(trips.banner),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ))),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Text(
                      trips.viatge,
                      style: AppStyles.bigTitle
                          .copyWith(color: AppStyles.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      trips.pais,
                      style: const TextStyle(color: AppStyles.whiteColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: [
                  AppStyles.separator,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_month),
                            Text(
                              trips.dates,
                              textAlign: TextAlign
                                  .center, // Centra el text horitzontalment
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.language),
                            Text(
                              trips.idioma,
                              textAlign: TextAlign
                                  .center, // Centra el text horitzontalment
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.restaurant),
                            Text(
                              trips.regim,
                              textAlign: TextAlign
                                  .center, // Centra el text horitzontalment
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppStyles.bigSeparator,
                  const Text(
                    'Itinerari',
                    style: AppStyles.subTitle,
                  ),
                  AppStyles.smallSeparator,
                  SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var dia in trips.itinerari)
                          SizedBox(
                            width: 170,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DayToDay(dia: dia)));
                              },
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dia ${dia.dia}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        dia.titol,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'Més info',
                                        style: AppStyles.smallText.copyWith(
                                            color: AppStyles.blueColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  AppStyles.bigSeparator,
                  const Text('Informació important', style: AppStyles.subTitle),
                  AppStyles.smallSeparator,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PreTrip(
                                        abansDeViatjar: trips.abansDeViatjar,
                                      )));
                        },
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
                                        Icons.info,
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
                                        'Dades interessants abans de viatjar',
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
                  AppStyles.smallSeparator,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Luggage(trip: trips)));
                        },
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
                                        Icons.luggage,
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
                                        'Essencials per a teva maleta',
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
                  AppStyles.bigSeparator,
                  AppStyles.smallSeparator,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Inclòs', style: AppStyles.subTitle),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var item in trips.inclos)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      item,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('No inclòs', style: AppStyles.subTitle),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var item in trips.noInclos)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    Text(item)
                                  ],
                                )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pàgina principal',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), label: "Contacta'ns"),
        ],
      ),
    );
  }
}
