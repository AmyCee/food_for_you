import 'package:flutter/material.dart';
import 'package:food_for_you/models/recipe_response.dart';

class RecipeView extends StatelessWidget {
  RecipeResponse response;

  RecipeView({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(response.title!),
              Image.network(response.image!),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(children: response.ingredients!.map((word)=> Text(word)).toList())
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: ListView.builder(
              //     itemCount: response.ingredients!.length,
              //     itemBuilder: (context, int index){
              //       return Text(response.ingredients![index]);
              //     }),
              // ),
              Text((response.times!.length == 0) ? "" : response.times![0]),
              // ListView(children: response.instructions!.map((word)=> Text()).toList())
            ],
          ),
        ),
      ),
    );
  }
}
