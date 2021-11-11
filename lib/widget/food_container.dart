import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  String? name;
  String? picture;
  bool networkImage;
  VoidCallback? widgetClick;

  FoodContainer({Key? key, this.name, this.picture, this.networkImage = false, this.widgetClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
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
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: widgetClick!,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(name!, style: TextStyle(color: Colors.white, backgroundColor: Colors.black26),),
        ),
      ),
    );
  }
}
 