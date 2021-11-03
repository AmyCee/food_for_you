import 'package:flutter/material.dart';
import 'package:food_for_you/utils/hex_color.dart';
import 'package:food_for_you/widget/circle.dart';
import 'package:food_for_you/widget/custom_form_field.dart';

import 'homepage.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/spagetti_image.jpeg"),
                        fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
                      //  fit: BoxFit.cover,
                    )
                ),
              //margin: EdgeInsets.all(50),
                child: Column(
                    children: [
                      /**Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40, top: 40),
                            child: CustomCircle(
                              circleColor: HexColor('82BB25'),
                            ),
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
                        suffixIcon: true,
                      ),
                      SizedBox(height: 20,),
                      // ElevatedButton(onPressed: onPressed, child: child),
                      MaterialButton(
                        height: 60,
                        minWidth: 100,
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        color: HexColor('82BB25'),
                        child: Text('EAT!',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "Creepster",
                            fontSize: 20
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        },
                        color: HexColor('E1AD01'),
                        child: Text('SIGN UP -->', style: TextStyle(color: Colors.black)),
                      ),
                 ]
                )
            )
        )
    );
  }
}