import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/presentation/pages/home/home_store.dart';
import 'package:pokemon_app/presentation/pages/home/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = GetIt.instance.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Column(
          children: [
            Divider(
              height: 60.0,
              color: Colors.transparent,
            ),
            Image.asset(
              'assets/pokemon.png',
              width: MediaQuery.of(context).size.width * 0.60,
            ),
            Expanded(
              child: FutureBuilder<List<PokemonEntity>?>(
                future: _store.onLoadedPokemons(),
                builder: (BuildContext _, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (_store.loadMore &&
                            notification.metrics.pixels ==
                                notification.metrics.maxScrollExtent) {
                          _store.onLoadedPokemons();
                          return true;
                        }

                        return false;
                      },
                      child: ListView.separated(
                        itemCount: snapshot.data?.length ?? 0,
                        separatorBuilder: (_, index) => Divider(
                          color: Colors.transparent,
                        ),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              '/detail',
                              arguments: snapshot.data?[index],
                            ),
                            child: ItemWidget(
                              margin: EdgeInsets.only(
                                top: 30.0,
                                left: MediaQuery.of(context).size.width * 0.06,
                                right: MediaQuery.of(context).size.width * 0.06,
                              ),
                              name: snapshot.data?[index].name,
                              imageUrl: snapshot.data?[index].imageURL,
                              id: snapshot.data?[index].id,
                            ),
                          );
                        },
                      ),
                    );

                  return Center(
                    child: Lottie.asset('assets/pokemon.json', height: 350.0),
                  );
                },
              ),
            ),
            Container(
              height: _store.loadMore ? 50.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
