import 'package:chat_app/widgets/btnAzul.dart';
import 'package:chat_app/widgets/custom_labels.dart';
import 'package:chat_app/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custom_input.dart';



class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Logo(titulo: 'Messenge',),
                  _Form(),
                  Labels(ruta: 'register',labelini: '¿No tienes cuenta?',labelfin:'Crea una ahora' ),
                  Text('Términos y condiciones de uso.',style: TextStyle(fontWeight: FontWeight.w200),)
            ],
        ),
              ),
              ),
      )
   );
  }
}


class _Form  extends StatefulWidget {
  

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form > {

final emailCtrl = TextEditingController();
final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(        
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(horizontal:50),
       child: Column (
         children: [

          CustomImput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keybordType: TextInputType.emailAddress,
            textController: emailCtrl,
            isPassword: false,
          ),
          
          CustomImput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',            
            textController: passCtrl,
            isPassword: true,
          ),
          
           //TODO: crear boton
          BtnAzul(textoBtn: 'Ingrese',onPressed: () { print(emailCtrl.text+ ' ' +passCtrl.text );},),
         ],
       ),
    );
  }
}

