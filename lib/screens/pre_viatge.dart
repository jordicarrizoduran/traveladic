import 'package:flutter/material.dart';

class PreViatge extends StatelessWidget {
  final List<String> abansDeViatjar;

  const PreViatge({Key? key, required this.abansDeViatjar}) : super(key: key);

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
              for (var i = 0; i < abansDeViatjar.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallsAbansViatjar(abansDeViatjar: abansDeViatjar, index: i),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(abansDeViatjar[i]),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}