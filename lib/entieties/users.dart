class Users {
  String email;
  String contrasena;
  String nombre;
  String direccion;
  String id;

  Users({
    required this.email,
    required this.contrasena,
    required this.nombre,
    required this.direccion,
    required this.id,
  });
}
List<Users> listUsers = [
    Users(
      email: 'martinkin2021@gmail.com',
      contrasena: 'NuevaContraseña2021',
      nombre: 'Tincho',
      direccion: 'Nazca 1830',
      id: '1',
    ),
    Users(
      email: 'martinkin2020@gmail.com',
      contrasena: 'Pandemia2020',
      nombre: 'Marto',
      direccion: 'Jonte 1234',
      id: '2',
    ),
    Users(
      email: '48522161@est.ort.edu.ar',
      contrasena: 'MecatronicaDap123',
      nombre: 'Martin',
      direccion: 'Yatay 123',
      id: '3',
    ),
    Users(
      email: '23903423@est.ort.edu.ar',
      contrasena: 'Marcelito22',
      nombre: 'Marcelo',
      direccion: 'Rio de Janerio 321',
      id: '4',
    ),
    Users(
      email: 'fofo_god@gmail.com',
      contrasena: 'Minecraft123',
      nombre: 'Fefe',
      direccion: 'Angel gallardo 2000',
      id: '5',
    ),
    Users(email: 'a', contrasena: 'a', nombre: 'FastUser', direccion: '123', id: '6'),
  ];