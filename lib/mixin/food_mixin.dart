import 'package:flutter/material.dart';
import 'package:food_for_you/http/get_food_http_request.dart';
import 'package:food_for_you/models/recipe_response.dart';
import 'package:food_for_you/provider/food_provider.dart';
import 'package:provider/provider.dart';

mixin FoodMixin{
  BuildContext? _mixinContext;

  void getFoodRecipe(BuildContext context, int numberOfRecipes){
    _mixinContext = context;
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setLoadingState(false, false);
    getFoodCall.getFood(numberOfRecipes).then((tempRecipeResponse) => doneGettingFood(tempRecipeResponse));
  }

  void doneGettingFood(List<RecipeResponse> recipeList){
    print("Done Getting Food");
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setLoadingState(true, true);
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setRecipeResponse(recipeList);
  }
}