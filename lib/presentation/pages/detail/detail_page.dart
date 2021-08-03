import 'package:flutter/material.dart';
import 'package:pokemon_app/domain/entities/pokemon_entity.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    PokemonEntity args =
        ModalRoute.of(context)!.settings.arguments as PokemonEntity;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                args.imageURL,
                height: 250.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    spreadRadius: 3.0,
                    color: Colors.black26,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(args.name),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text('Abilities:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: args.abilities
                        .map((e) => Text(e['ability']?['name']))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
