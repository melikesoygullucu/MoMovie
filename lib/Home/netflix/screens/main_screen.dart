import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_example/Home/app.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../bloc/theme_bloc/theme_controller.dart';
import '../../bloc/theme_bloc/theme_service.dart';
import '../../repositories/movie_repository.dart';
import '../style/theme.dart' as Style;

import '../bloc/movie_bloc.dart';
import '../model/item.dart';
import 'card_back_screen.dart';
import 'card_front_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool clicked = false;
  late ItemModel _selectedGenre;
  late ItemModel _selectedScore;
  late List<ItemModel> genres;
  late List<ItemModel> scores;
  @override
  void initState() {
    scores = [
      ItemModel(title: 'Any Score', value: 0),
      ItemModel(title: '5', value: 5),
      ItemModel(title: '6', value: 6),
      ItemModel(title: '7', value: 7),
      ItemModel(title: '8', value: 8),
    ];
    genres = [
      ItemModel(title: 'All Genres', value: 0),
      ItemModel(title: 'Action', value: 5),
      ItemModel(title: 'Animation', value: 6),
      ItemModel(title: 'Anime', value: 39),
      ItemModel(title: 'Comedy', value: 9),
      ItemModel(title: 'Drama', value: 3),
      ItemModel(title: 'Horror', value: 19),
    ];
    _selectedGenre = genres[0];
    _selectedScore = scores[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }),
        backgroundColor: Style.Colors.mainColor,
        title: const Text(
          "Random Movie Generator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: FlipCard(
              flipOnTouch: false,
              key: cardKey,
              front: CardFront(),
              back: CardBackScreen()),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        padding: const EdgeInsets.all(15.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            clicked
                ? Container()
                : Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Choose Genre",
                            style: TextStyle(
                                color: Style.Colors.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5.0),
                            height: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                border: Border.all(
                                    color: Style.Colors.mainColor, width: 1.0)),
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<ItemModel>(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Style.Colors.mainColor,
                                ),
                                isExpanded: false,
                                underline: Container(),
                                hint: const Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Style.Colors.mainColor),
                                ),
                                value: _selectedGenre,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGenre = newValue!;
                                  });
                                },
                                items: genres.map((filter) {
                                  return DropdownMenuItem<ItemModel>(
                                      value: filter,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            filter.title,
                                            style: const TextStyle(
                                                color: Style.Colors.mainColor,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Choose IMDB Score",
                            style: TextStyle(
                                color: Style.Colors.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5.0),
                            height: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                border: Border.all(
                                    color: Style.Colors.mainColor, width: 1.0)),
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<ItemModel>(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Style.Colors.mainColor,
                                ),
                                isExpanded: false,
                                underline: Container(),
                                hint: const Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Style.Colors.mainColor),
                                ),
                                value: _selectedScore,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedScore = newValue!;
                                  });
                                },
                                items: scores.map((ItemModel filter) {
                                  return DropdownMenuItem<ItemModel>(
                                      value: filter,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            filter.title,
                                            style: TextStyle(
                                                color: Style.Colors.mainColor,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ));
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            clicked
                ? Container(
                    height: 40.0,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          setState(() {
                            clicked = false;
                          });
                          movieBloc.drainStream();
                          cardKey.currentState?.toggleCard();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(EvaIcons.arrowBackOutline,
                                color: Colors.black),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Back",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        )),
                  )
                : Container(
                    height: 40.0,
                    child: InkWell(

                        // shape: RoundedRectangleBorder(
                        //  borderRadius: BorderRadius.circular(8.0),
                        //),
                        onTap: () {
                          movieBloc.getMovie(
                              _selectedGenre.value, _selectedScore.value);
                          setState(() {
                            clicked = true;
                          });
                          cardKey.currentState!.toggleCard();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(EvaIcons.search, color: Colors.red),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("Suggest",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        )),
                  )
          ],
        ),
      ),
    );
  }
}
