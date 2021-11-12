import 'package:flutter/material.dart';
import 'package:food_for_you/http/get_food_http_request.dart';
import 'package:food_for_you/models/recipe_response.dart';
import 'package:food_for_you/provider/food_provider.dart';
import 'package:provider/provider.dart';

mixin FoodMixin{
  BuildContext? _mixinContext;
  bool reload = false;

  void getFoodRecipe(BuildContext context, int numberOfRecipes, bool setReload){
    _mixinContext = context;
    reload = setReload;
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setLoadingState(false, false);
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setReload();
    print("Get Reload: ${Provider.of<FoodProvider>(_mixinContext!, listen: false).getReload() == true}");
    if (Provider.of<FoodProvider>(_mixinContext!, listen: false).getReload() == true || reload == true){
      getFoodCall.getFood(numberOfRecipes).then((tempRecipeResponse) => doneGettingFood(tempRecipeResponse));
    }
  }

  void doneGettingFood(List<RecipeResponse> recipeList){
    print("Done Getting Food");
    Provider.of<FoodProvider>(_mixinContext!, listen: false).setLoadingState(true, true);
    if (Provider.of<FoodProvider>(_mixinContext!, listen: false).getReload() == true || reload == true){
      Provider.of<FoodProvider>(_mixinContext!, listen: false).setRecipeResponse(recipeList);
    }
    Provider.of<FoodProvider>(_mixinContext!, listen: false).resetReload();
  }
}