import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/services/auth_service.dart';




class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginSatte(context),
        builder: ( context,snapshot){ 
        return  Center(
        //animacion
          child: Text('Espere........ '),
          );
        },
      
      ),
   );
  }


  Future checkLoginSatte(BuildContext context )async{

    final authService = Provider.of<AuthService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();
    final socketService = Provider.of<SocketService>(context, listen: false);

      if (autenticado ){
        //conectar al socket
        socketService.connect();
        //Navigator.pushReplacementNamed(context, 'users');        
        Navigator.pushReplacement(
          context, PageRouteBuilder(
          pageBuilder: ( _,__,___,)=>UsuariosPage(),
          transitionDuration: Duration(milliseconds: 0)
          ));
      }
      else{
         Navigator.pushReplacement(
          context, PageRouteBuilder(
          pageBuilder: ( _,__,___,)=>LoginPage(),
          transitionDuration: Duration(milliseconds: 0)
          ));      
      }

  }
}