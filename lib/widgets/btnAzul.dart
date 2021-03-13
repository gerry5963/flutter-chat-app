
import 'package:flutter/material.dart';


class BtnAzul extends StatelessWidget {

  final String textoBtn;
  final Function onPressed;

  const BtnAzul({ Key key,@required this.textoBtn , @required this.onPressed }): super(key: key);
    
 @override
  Widget  build(BuildContext context) {
   return   RaisedButton(
             shape:  StadiumBorder(),
             color: Colors.blue,
             highlightElevation: 5,
             elevation: 2,
             child: Container(
               width: double.infinity,
               child: Center(
                 child: Text(this.textoBtn,style:TextStyle(color: Colors.white,fontSize: 17)),
               ),
             ),
             onPressed:() {
               this.onPressed();
             }
           );
      }
}
           