


import 'dart:io';

class Enviroment{
static String apiUrl= 
Platform.isAndroid ? 'http://10.0.2.2:3000/api': 
'http://localhost:3000/api';


static String socketUrl= 
Platform.isAndroid ? 'http://192.168.0.100:3000': 
'http://localhost:3000';

}