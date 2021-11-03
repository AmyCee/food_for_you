import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  String? name;
  String? picture;
   FoodContainer({Key? key, this.name, this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(picture!)
              )
            ),
          ),
          Container(
            height: 80,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Text(name!),
          ),

        ],
      ),
    );
  }
}
