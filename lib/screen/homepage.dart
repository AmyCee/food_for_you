import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_for_you/models/recipe_response.dart';
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

  Map<String, String> foodMap = {
    "Soup recipes" : "assets/images/soup_recipes.jpg",
    "Rice recipes" : "assets/images/rice_recipes.jpg",
  };


  List<RecipeResponse> myRecipeResponse = [];

  void initState(){
    super.initState();
  }

  void getHttp() async {
    try {
      print("Making HTTP Call...");
      var response = await Dio().get(
        'https://random-recipes.p.rapidapi.com/ai-quotes/12', options: Options(
          headers: {
          'x-rapidapi-host': 'random-recipes.p.rapidapi.com',
          'x-rapidapi-key': 'b33fbb332emsh0eb6606de1a59fbp142e48jsn0dff19f538e3'
          }
        )
      );
      // print(response);
      for (int i = 0; i < response.data.length; i++){
        RecipeResponse tempRecipe = RecipeResponse.fromJson(response.data[i]);
        myRecipeResponse.add(tempRecipe);
      }
      print(myRecipeResponse[0].title);
      print(myRecipeResponse[1].title);
      print(myRecipeResponse[2].title);
      print("Closing HTTP Call...");
    } catch (e) {
      print(e);
      print("Closing HTTP Call...");
    }
  }

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
                        itemCount: foodMap.length,
                        itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: (){
                          getHttp();
                          setState(() {
                          });
                        },
                        child: FoodContainer(name: nameOfFoods[index], picture: foodMap[nameOfFoods[index]],)
                      );
                    })
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
