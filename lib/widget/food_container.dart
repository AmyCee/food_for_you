import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  String? name;
  String? picture;
  bool networkImage;
   FoodContainer({Key? key, this.name, this.picture, this.networkImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 80,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(name!, style: TextStyle(color: Colors.white, backgroundColor: Colors.black26),),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          image: networkImage ?
            DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              fit: BoxFit.cover,
              image: NetworkImage(picture!)
            )
              :
            DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(picture!)
          )
        ),
      ),
    );
  }
}
