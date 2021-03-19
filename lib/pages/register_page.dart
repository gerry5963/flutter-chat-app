import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/btnAzul.dart';
import 'package:chat_app/widgets/custom_labels.dart';
import 'package:chat_app/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/custom_input.dart';
import 'package:provider/provider.dart';



class RegisterPage extends StatelessWidget {

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
                  Logo(titulo: 'Registro'),
                  _Form(),
                  Labels(ruta: 'login',labelini: 'Ya tienes cuenta',labelfin: 'Inicia sesion',),
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

final nameCtrl = TextEditingController();
final emailCtrl = TextEditingController();
final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService  = Provider.of<AuthService>(context);

    return Container(        
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(horizontal:50),
       child: Column (
         children: [

          CustomImput(
            icon: Icons.supervised_user_circle,
            placeHolder: 'Nombre',
            keybordType: TextInputType.text,
            textController: nameCtrl,
            isPassword: false,
          ),

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
          BtnAzul(textoBtn: 'Crear cuenta',
          onPressed: 
                authService.autenticando ? null : () async { 
            FocusScope.of(context).unfocus();
            print(emailCtrl.text+ ' ' +passCtrl.text );              
            final loginOK= await  authService.register(nameCtrl.text.trim(),emailCtrl.text.trim(), passCtrl.text.trim());
            
            if(loginOK==true){
              //Conectar a el socket server 
              //navegar a otra pantalla
              Navigator.pushReplacementNamed(context, 'users');

            }else {
              //Mostrar alerta
              mostrarAlerta(context, 'Error en el registro', loginOK);
            }
            
            },  

          ),
         ],
       ),
    );
  }
}

