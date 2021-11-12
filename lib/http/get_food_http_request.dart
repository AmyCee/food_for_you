import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_for_you/models/recipe_response.dart';
import 'package:food_for_you/provider/food_provider.dart';
import 'package:provider/provider.dart';

class GetFood{
  Future getFood(int numberOfRecipes) async{
    try {
      print("Making HTTP Call...");
      var response = await Dio().get(
        'https://random-recipes.p.rapidapi.com/ai-quotes/$numberOfRecipes',
        options: Options(
          headers: {
            'x-rapidapi-host': 'random-recipes.p.rapidapi.com',
            'x-rapidapi-key': 'b33fbb332emsh0eb6606de1a59fbp142e48jsn0dff19f538e3'
          }
        )
      );
      List<RecipeResponse> tempRecipeResponse = [];

      for (int i = 0; i < response.data.length; i++){
        RecipeResponse tempRecipe = RecipeResponse.fromJson(response.data[i]);
        tempRecipeResponse.add(tempRecipe);
      }

      return tempRecipeResponse;

    } catch (e) {
      print(e);
      print("Closing HTTP Call...");
    }
  }
}

GetFood getFoodCall = GetFood();