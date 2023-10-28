import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  String text;
  String imagePath;
  NoDataPage({super.key,required this.text,this.imagePath="assets/logo/empty_cart_page.jpg"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
            imagePath,
          height: MediaQuery.of(context).size.height*0.22,
          width: MediaQuery.of(context).size.width*0.22,
        ),
        SizedBox(height:MediaQuery.of(context).size.height*0.03,),
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.0184,
            color: Theme.of(context).disabledColor,
          ),
          textAlign: TextAlign.center,
        )

      ],
    );
  }
}
