
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomImput extends  StatelessWidget {

final  IconData icon;
final String placeHolder;
final TextEditingController textController;
final TextInputType keybordType;
final bool isPassword;

  const CustomImput({
    Key key, 
    @required this.icon, 
    @required this.placeHolder, 
    @required this.textController, 
    this.keybordType= TextInputType.text, 
    this.isPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(   
             padding: EdgeInsets.only(top:5, left:5,bottom:5, right:20),
             margin: EdgeInsets.only(bottom:10),
             decoration: BoxDecoration(
               color:Colors.white,
               borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0,5),
                    blurRadius: 15
                  )
                ]
             ),
             child: TextField(
               textAlign: TextAlign.start,
               controller: this.textController,
               autocorrect: false,
               keyboardType:this.keybordType,
               obscureText: this.isPassword,
               decoration: InputDecoration(              
                 prefix: Icon(this.icon),
                 focusedBorder: InputBorder.none,
                 border: InputBorder.none,
                 hintText: this.placeHolder
               ),
             ),
           ) ;
  }
}