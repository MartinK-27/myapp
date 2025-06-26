import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entieties/users.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardProvider);
    final userID = ref.watch(userIDProvider);
    final modo = ref.watch(modeProvider);
    final usuarioingresando = listUsers.firstWhere(
      (user) => user.id == userID,
      orElse:
          () => Users(
            email: '',
            contrasena: '',
            nombre: '',
            direccion: '',
            id: '',
          ),
    );

    return Scaffold(
      backgroundColor:
          modo == 'delete'
              ? const Color.fromARGB(255, 197, 20, 46)
              : modo == 'edit'
              ? const Color.fromARGB(255, 236, 240, 24)
              : Colors.white,
      appBar: AppBar(
        title: Text(
          'Bienvenido ${usuarioingresando.nombre} ${usuarioingresando.direccion}',
        ),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          //return Text(movies[index].title);   //Ejemplo 1
          return Card(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Card ID: ${cards[index].id}\n',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  children: [
                    TextSpan(
                      text: cards[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${cards[index].rarity}',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color:
                                cards[index].rarity == 'Legendary'
                                    ? Colors.purple
                                    : cards[index].rarity == 'Rare'
                                    ? const Color.fromARGB(255, 243, 33, 33)
                                    : cards[index].rarity == 'Uncommon'
                                    ? const Color.fromARGB(255, 63, 223, 15)
                                    : Colors
                                        .grey, // Default color for other rarities
                          ),
                        ),
                        TextSpan(
                          text: ' - \$${cards[index].price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 219, 181, 9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              subtitle: Text(cards[index].description),
              leading: Image.network(
                cards[index].image,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
              ),
              onTap: () {
                if (modo == 'delete') {
                  // Eliminar la carta
                  ref.read(cardProvider.notifier).state = [
                    for (final card in cards)
                      if (card.id != cards[index].id) card,
                  ];
                } else if (modo == 'edit') {
                  ref.read(cardIDProvider.notifier).state = cards[index].id;
                  context.push('/CardDae');
                } else {
                  ref.read(cardIDProvider.notifier).state = cards[index].id;
                  context.push('/CardDae');
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            tooltip: "Agregar",
            onPressed: () {
              setState(() {
                if (modo != 'add') {
                  ref.read(modeProvider.notifier).state = 'add';
                }
               
              });
              context.push('/CardDae');
            },
            backgroundColor: const Color.fromARGB(255, 18, 127, 216),
            child: Icon(Icons.add),
          ),

          SizedBox(height: 10),
          FloatingActionButton(
            tooltip: "Editar",
            onPressed: () {
              setState(() {
                if (modo != 'edit') {
                  ref.read(modeProvider.notifier).state = 'edit';
                }
                else{
                  ref.read(modeProvider.notifier).state = '';
                }
              });
            },
            backgroundColor: const Color.fromARGB(255, 193, 196, 27),
            child: Icon(modo == 'edit' ? Icons.edit_off : Icons.edit),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            tooltip: "Eliminar",
            onPressed: () {
              setState(() {
                if (modo != 'delete') {
                  ref.read(modeProvider.notifier).state = 'delete';
                }
                else{
                  ref.read(modeProvider.notifier).state = '';
                }
              });
            },
            backgroundColor: Colors.red,
            child: Icon(modo == 'delete' ? Icons.cancel : Icons.delete),
          ),
        ],
      ),
    );
  }
}
