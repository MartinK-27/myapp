import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/providers.dart';
import 'package:myapp/entieties/balatro_cards.dart';

class AddCard extends ConsumerWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context, ref) {

TextEditingController name = TextEditingController();
TextEditingController image = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController rarity = TextEditingController();
TextEditingController id = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
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
                  if(id.text.isEmpty || name.text.isEmpty || description.text.isEmpty || price.text.isEmpty || rarity.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                  } else {
                    ref.read(cardProvider.notifier).update((state) => [
                      ...state,
                      Balatro(
                        name: name.text,
                        image: image.text.isEmpty ? 'https://i.ytimg.com/vi/7OzUJX0yjaM/hqdefault.jpg' : image.text,
                        description: description.text,
                        price: int.parse(price.text),
                        rarity: rarity.text,
                        id: int.parse(id.text),
                      ),
                    ]);
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
  }
}