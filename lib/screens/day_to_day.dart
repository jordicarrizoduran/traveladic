import 'package:flutter/material.dart';
import 'package:traveladic_app/models/trips_model.dart';
import 'package:traveladic_app/styles/app_styles.dart';

class DayToDay extends StatelessWidget {
  const DayToDay({super.key, required, required this.dia});
  final Itinerari dia;

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
              Text(
                'Dia ${dia.dia} - ${dia.titol}',
                style: const TextStyle(fontSize: 20),
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
        ));
  }
}
