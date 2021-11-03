import 'package:flutter/material.dart';
import 'package:food_for_you/utils/hex_color.dart';
import 'package:food_for_you/widget/circle.dart';
import 'package:food_for_you/widget/custom_form_field.dart';

import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
           child: Container(
             //height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage("assets/images/spagetti_image.jpeg"),
                     fit: BoxFit.cover,
                     colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
                   //  fit: BoxFit.cover,
                 )
             ),
            // color: HexColor("E1AD01"),
            // margin: EdgeInsets.all(50),
            child: Column(
              children: [
              /** Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomCircle(
                     circleColor: HexColor('82BB25'),
                   ),
                  ],
                 ),*/
              Center(
                 child: Container(
                   height: 350,
                   width: 350,
                   decoration: const BoxDecoration(
                   image: DecorationImage(
                   image: AssetImage("assets/images/image_2.png")
            )
          ),
          ),
          ),
               CustomFormField(
                    formIcon: Icon(Icons.account_circle_rounded),
                    textLabel: "Username",
                    ),
                    SizedBox(height: 20,),
                    CustomFormField(
                      formIcon: Icon(Icons.lock_outline_rounded),
                      textLabel: "Password",
                      obscureText: true,
    ),
             SizedBox(height: 20,),
             CustomFormField(
               formIcon: Icon(Icons.mail_outline_rounded),
               textLabel: "Email",
             ),
                SizedBox(height: 20,),
                CustomFormField(
                  formIcon: Icon(Icons.food_bank_outlined),
                  textLabel: "Favorite food",
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  height: 80,// MediaQuery.of(context).size.height * 0.05,
                  minWidth: 120, //MediaQuery.of(context).size.width * 0.2,
                  shape: CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  color: HexColor('82BB25'),
                  child: Text('Cook up!',
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Creepster",
                          fontSize: 20
                      )
                  ),
                ),

      ],
       ),
      ),
     ),
    );
  }
}
