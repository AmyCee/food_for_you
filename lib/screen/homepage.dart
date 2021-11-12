import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_for_you/http/get_food_http_request.dart';
import 'package:food_for_you/mixin/food_mixin.dart';
import 'package:food_for_you/models/recipe_response.dart';
import 'package:food_for_you/provider/food_provider.dart';
import 'package:food_for_you/widget/food_container.dart';
import 'package:food_for_you/widget/recipe_view.dart';
import 'package:provider/provider.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => FoodProvider(),
      child: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FoodMixin{
  List<String> nameOfFoods = [
    "Rice recipes",
    "Soup recipes",
    "Rice recipes",
    "Rice recipes",
  ];

  Map<String, String> foodMap = {
    "Soup recipes" : "assets/images/soup_recipes.jpg",
    "Rice recipes" : "assets/images/rice_recipes.jpg",
  };

  void initState(){
    getFoodRecipe(context, 10, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GestureDetector(
                  onTap: (){
                    getFoodRecipe(context, 10, true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.refresh),
                  )
                )
              ],
              title: Text('Food Recipes', textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            // extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/home_page_background.jpeg"),
                  //   fit: BoxFit.cover,
                  //   //colorFilter: ColorFilter.mode(Colors.bla, BlendMode.darken)
                  // ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.9,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: provider.doneLoading ?
                        ListView.builder(
                            itemCount: provider.providerRecipe!.length,
                            itemBuilder: (context, int index) {
                              return FoodContainer(
                                name: provider.providerRecipe![index].title,
                                picture: provider.providerRecipe![index].image,
                                networkImage: true,
                                widgetClick: () {
                                  print("Trying to work");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        RecipeView(response: provider
                                            .providerRecipe![index])),
                                  );
                                },
                              );
                            })
                            :
                        Center(child: CircularProgressIndicator())
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
