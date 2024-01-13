import 'package:flutter/material.dart';
import 'package:traveladic_app/screens/day_to_day.dart';
import 'package:traveladic_app/screens/pre_viatge.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Title(
                color: AppStyles.principal,
                child: Text(trips.viatge, style: const TextStyle(fontSize: 24),textAlign: TextAlign.center,),
              ),
        
              Text(
                '${trips.dates} / ${trips.pais}',
                style: const TextStyle(fontSize: 16),
              ),
              AppStyles.separator,
              const Text('Itinerari', style: TextStyle(fontSize: 30),),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var dia in trips.itinerari)
                      SizedBox(
                        width: 130,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DayToDay(dia: dia))
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppStyles.principal),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dia${dia.dia}',
                                    style: const TextStyle(fontSize: 20,),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    dia.titol,
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              AppStyles.separator,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Abans de viatjar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PreViatge(trips.abansDeViatjar))
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: AppStyles.principal),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.travel_explore,
                                )
                              ],
                            )
                          )

                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Essencial de maleta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      InkWell(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppStyles.principal),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.luggage
                                    )
                                  ],
                                )
                            )

                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Pàgina principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_on), label: 'El teu viatge'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), label: "Contacta'ns"),

        ],
      ),
    );
  }
}