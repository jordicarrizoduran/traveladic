import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveladic_app/providers/preferences_provider.dart';
import 'package:traveladic_app/providers/trips_data.dart';
import 'package:traveladic_app/screens/individual_trip.dart';
import 'package:traveladic_app/styles/app_styles.dart';

import 'contact.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TripsData>(builder: (context, tripsData, child) {
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
        body: Consumer<PreferencesProvider>(
            builder: (context, preferenceProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(children: [
              Builder(
                builder: (context) {
                  if (tripsData.trips != null) {
                    return Expanded(
                      child: ListView(
                        children: [
                          Title(
                            color: AppStyles.principal,
                            child: const Text(
                              'Viatges',
                              style: AppStyles.bigTitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          AppStyles.smallSeparator,
                          for (var trip in tripsData.trips!)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IndividualTrip(
                                                trips: trip,
                                              )));
                                },
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              trip.viatge,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: [
                                                Text(trip.dates),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  trip.pais,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // codi per favorite
                                            preferenceProvider
                                                .toggleFavorite(trip.id);
                                          },
                                          child: Icon(
                                            (preferenceProvider
                                                    .isFavorite(trip.id))
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: AppStyles.principal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ]),
          );
        }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: AppStyles.principal,
          unselectedItemColor: AppStyles.footerText,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppStyles.principal,
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
    });
  }
}
