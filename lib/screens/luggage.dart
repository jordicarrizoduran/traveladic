import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class Luggage extends StatefulWidget {
  const Luggage({super.key, required this.essencialsMaleta});
  final List<String> essencialsMaleta;

  @override
  State<Luggage> createState() => _LuggageState();
}

class _LuggageState extends State<Luggage> {
  Map<String, bool> checkboxValue = {};

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Essencial per la teva maleta',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              AppStyles.smallSeparator,
              for (var essencials in widget.essencialsMaleta)
                CheckboxListTile(
                  title: Text(essencials),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkboxValue[essencials] ?? false,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue[essencials] = value ?? false;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
