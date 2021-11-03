import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  Icon? formIcon;
  bool suffixIcon;
  bool obscureText = false;
  String textLabel = "";

   CustomFormField({Key? key, this.formIcon, this.obscureText = false, this.textLabel = "", this.suffixIcon = false,}) : super(key: key);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(5)
      ),

      child: widget.suffixIcon
      ?
        TextFormField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            icon: widget.formIcon,
            border: InputBorder.none,
            hintText: widget.textLabel,
            suffixIcon: widget.obscureText
                ?
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.obscureText = false;
                });
              },
              child: Icon(Icons.remove_red_eye_outlined)
            )
                :
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.obscureText = true;
                });
              },
              child: Icon(Icons.close)
            )
          ),
        )
          :
      TextFormField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          icon: widget.formIcon,
          border: InputBorder.none,
          hintText: widget.textLabel,
        ),
      ),
    );
  }
}