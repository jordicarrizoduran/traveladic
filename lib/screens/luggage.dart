import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/trips_model.dart';
import '../providers/preferences_provider.dart';
import '../styles/app_styles.dart';

class Luggage extends StatefulWidget {
  const Luggage({super.key, required this.trip});
  final Trips trip;

  @override
  State<Luggage> createState() => _LuggageState();
}

class _LuggageState extends State<Luggage> {
  // Map<String, bool> checkboxValue = {};
  late String tripKey;

  @override
  void initState() {
    super.initState();
    tripKey = widget.trip.id;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
        builder: (context, luggageCheckList, child) {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Essencial per la teva maleta',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                AppStyles.smallSeparator,
                for (var essencials in widget.trip.essencialsMaleta)
                  CheckboxListTile(
                    title: Text(essencials),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: luggageCheckList.isChecked(tripKey, essencials),
                    onChanged: (bool? value) {
                      luggageCheckList.setIsChecked(
                          tripKey, essencials, value ?? false);
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
