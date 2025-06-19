// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entieties/users.dart';
import 'package:myapp/presentation/providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  String texto = 'Ingrese el usuraio y contraseña';
  String textoingresado1 = '';
  String textoingresado2 = '';
  int R = 255;
  int G = 255;
  int B = 255;
  bool visible = true;
  void ojito() {
    setState(() {
      visible = !visible;
    });
  }
final listaUsuarios = listUsers;

  void mostrarSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Color.fromARGB(255, R, G, B)),),
      duration: Duration(seconds: 3),
    );

    // Usamos ScaffoldMessenger para mostrar el SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: usuario,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuraio',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: password,
                  obscureText: visible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: ojito,
                      icon: Icon(
                        visible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textoingresado1 = usuario.text;
                    textoingresado2 = password.text;
                    if (textoingresado1 == '' || textoingresado2 == '') {
                      mostrarSnackBar(context, 'Error, el usuario o la contraseña no pueden estar vacios');
                      R = 255;
                      G = 0;
                      B = 0;
                      setState(() {});
                    } 
                    else {
                     var usuarioingresando = listaUsuarios.firstWhere((Users) => Users.email == textoingresado1, orElse: () => Users(email: 'null', contrasena: 'null', nombre: 'null', direccion: 'null', id: 'null'));
                      if (usuarioingresando.contrasena == textoingresado2 && usuarioingresando.email == textoingresado1) {
                        R = 0;
                        G = 255;
                        B = 0;
                        mostrarSnackBar(context, 'Incio de sesion exitoso');
                        ref.read(userIDProvider.notifier).update((State) => usuarioingresando.id);
                        context.go('/home');
                        setState(() {});
                      } 
                      else {
                        R = 255;
                        G = 0;
                        B = 0;
                        mostrarSnackBar(context, 'Error, Usuario o Contraseña invalidos');
                        setState(() {});
                      }
                    }
                  });
                },
                child: Text('Verificar'),
              ),
            ],
          ),
        ),
      );
  }
}