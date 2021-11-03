import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_for_you/widget/food_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nameOfFoods = [
    "Rice recipes",
    "Soup recipes",
    "Rice recipes",
    "Rice recipes",
  ];
  List<String> pictureOfFoods = [
    "assets/images/rice_recipes.jpg",
    "assets/images/soup_recipes.jpg",
    "assets/images/rice_recipes.jpg",
    "assets/images/rice_recipes.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Food Categories', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54),),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_page_background.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: nameOfFoods.length,
                        itemBuilder: (context, int index) {
                      return FoodContainer(name: nameOfFoods[index], picture: pictureOfFoods[index],);
                    })
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
