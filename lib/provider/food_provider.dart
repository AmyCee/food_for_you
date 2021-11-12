import 'package:flutter/cupertino.dart';
import 'package:food_for_you/models/recipe_response.dart';

class FoodProvider extends ChangeNotifier{
  List<RecipeResponse>? providerRecipe;
  bool doneLoading = false;
  bool reload = false;

  void setLoadingState(bool loadingState, bool shouldNotify){
    doneLoading = loadingState;
    if (shouldNotify == true){
      notifyListeners();
    }
  }

  bool getReload() => reload;
  void resetReload(){
    reload = false;
  }
  void setReload(){
    reload = true;
  }

  void setRecipeResponse(List<RecipeResponse> recipeFromMixin) {
    providerRecipe = recipeFromMixin;
    notifyListeners();
  }
}