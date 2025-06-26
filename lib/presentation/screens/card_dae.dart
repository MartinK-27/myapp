import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entieties/balatro_cards.dart';
import 'package:myapp/presentation/providers.dart';
import 'package:go_router/go_router.dart';

class CardDae extends ConsumerStatefulWidget {
  const CardDae({super.key});

  @override
  CardDaeState createState() => CardDaeState();
}

class CardDaeState extends ConsumerState<CardDae> {
  @override
  Widget build(BuildContext context) {
    final modo = ref.watch(modeProvider);
    final cardSelected = ref.watch(cardIDProvider);
    final card = ref
        .watch(cardProvider)
        .firstWhere(
          (card) => card.id == cardSelected,
          orElse:
              () => Balatro(
                name: '',
                image: '',
                description: '',
                price: 0,
                rarity: '',
                id: 0,
              ),
        );
    TextEditingController name = TextEditingController(
      text: modo == 'edit' ? card.name : '',
    );
    TextEditingController image = TextEditingController(
      text: modo == 'edit' ? card.image : '',
    );
    TextEditingController description = TextEditingController(
      text: modo == 'edit' ? card.description : '',
    );
    TextEditingController price = TextEditingController(
      text: modo == 'edit' ? card.price.toString() : '',
    );
    TextEditingController rarity = TextEditingController(
      text: modo == 'edit' ? card.rarity : '',
    );
    TextEditingController id = TextEditingController(
      text: modo == 'edit' ? card.id.toString() : '',
    );
    if (modo == 'edit') {
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Card')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Card Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: image,
                  decoration: InputDecoration(
                    labelText: 'Image URL (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: price,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: rarity,
                  decoration: InputDecoration(
                    labelText: 'Rarity',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: id,
                  decoration: InputDecoration(
                    labelText: 'Card ID',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (id.text.isEmpty ||
                        name.text.isEmpty ||
                        description.text.isEmpty ||
                        price.text.isEmpty ||
                        rarity.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields')),
                      );
                    } else if (int.tryParse(price.text) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Price must be a number')),
                      );
                    } else if (int.tryParse(id.text) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Id must be a number')),
                      );
                    } else {
                      ref.read(cardProvider.notifier).state = [
                        for (final card in ref.read(cardProvider))
                          if (card.id == cardSelected)
                            Balatro(
                              name: name.text,
                              image:
                                  image.text.isEmpty
                                      ? 'https://i.ytimg.com/vi/Y5kxKRTU9ao/maxresdefault.jpg'
                                      : image.text,
                              description: description.text,
                              price: int.parse(price.text),
                              rarity: rarity.text,
                              id: int.parse(id.text),
                            )
                          else
                            card,
                      ];
                      setState(() {
                        ref.read(modeProvider.notifier).state = '';
                      });
                      context.go('/home');
                    }
                  },
                  child: Text('Confirm Edit'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (modo == 'add') {
      return Scaffold(
        appBar: AppBar(title: const Text('Add Card')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Card Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: image,
                  decoration: InputDecoration(
                    labelText: 'Image URL (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: price,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: rarity,
                  decoration: InputDecoration(
                    labelText: 'Rarity',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: id,
                  decoration: InputDecoration(
                    labelText: 'Card ID',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (id.text.isEmpty ||
                        name.text.isEmpty ||
                        description.text.isEmpty ||
                        price.text.isEmpty ||
                        rarity.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields')),
                      );
                      
                    } else if (int.tryParse(price.text) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Price must be a number')),
                      );
                    } else if (int.tryParse(id.text) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Id must be a number')),
                      );
                    }
                    else {
                      ref
                          .read(cardProvider.notifier)
                          .update(
                            (state) => [
                              ...state,
                              Balatro(
                                name: name.text,
                                image:
                                    image.text.isEmpty
                                        ? 'https://i.ytimg.com/vi/Y5kxKRTU9ao/maxresdefault.jpg'
                                        : image.text,
                                description: description.text,
                                price: int.parse(price.text),
                                rarity: rarity.text,
                                id: int.parse(id.text),
                              ),
                            ],
                          );
                      setState(() {
                        ref.read(modeProvider.notifier).state = '';
                      });
                      context.go('/home');
                    }
                  },
                  child: Text('Add Card'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (modo == '') {
      return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(card.name, style: TextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Text(
                '- ${card.rarity} -',
                style: TextStyle(
                  color:
                      card.rarity == 'Legendary'
                          ? Colors.purple
                          : card.rarity == 'Rare'
                          ? const Color.fromARGB(255, 243, 33, 33)
                          : card.rarity == 'Uncommon'
                          ? const Color.fromARGB(255, 63, 223, 15)
                          : Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$ ${card.price.toString()}',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 219, 181, 9),
                ),
              ),
              SizedBox(height: 16),
              Text(card.description, style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Image.network(
                card.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );
    } else {
      return Placeholder();
    }
  }
}
