import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:food_for_you/models/recipe_response.dart';
import 'package:food_for_you/widget/clock.dart';

class RecipeView extends StatelessWidget {
  RecipeResponse response;

  RecipeView({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(response.title!, textScaleFactor: 1.0, style: TextStyle(fontSize: 24) ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Text(response.title!, textScaleFactor: 1.0, style: TextStyle(fontSize: 24) ),
              Image.network(
                response.image!,
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              // Text("Ingredients", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
              Accordion(
                children: [
                  AccordionSection(
                    header: Text("Ingredients", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                    content: Container(
                        padding: EdgeInsets.all(16.0),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView(children: response.ingredients!.map((word)=> ListTile(leading: Icon(Icons.add), title: Text(word))).toList())
                    ),
                  ),
                  AccordionSection(
                    header: Text("Instructions", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                    content: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                            itemCount: response.instructions!.length,
                            itemBuilder: (context, int index){
                              return ListTile(leading: Icon(Icons.add_task),title: Text(response.instructions![index].text!));
                            }),
                      ),)
                ]
              ),
              // Container(
              //   padding: EdgeInsets.all(16.0),
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: ListView(children: response.ingredients!.map((word)=> Text(word)).toList())
              // ),
              // SizedBox(height: 20,),
              // Text("Instructions", textScaleFactor: 1.0, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.4,
              //   child: ListView.builder(
              //     itemCount: response.instructions!.length,
              //     itemBuilder: (context, int index){
              //       return Text(response.instructions![index].text!);
              //     }),
              // ),
              // ListView(children: response.instructions!.map((word)=> Text()).toList())
              SizedBox(height: 20,),
              NewStopWatch(),
              Text((response.times!.length == 0) ? "" : response.times![0]),
            ],
          ),
        ),
      ),
    );
  }
}
