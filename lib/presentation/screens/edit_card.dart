import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/providers.dart';
import 'package:myapp/entieties/balatro_cards.dart';

class EditCard extends ConsumerWidget {
  const EditCard({super.key});



  @override
  Widget build(BuildContext context, ref) {
    final cardSelected = ref.watch(cardIDProvider);
    final card = ref.watch(cardProvider).firstWhere(
          (card) => card.id == cardSelected,
          orElse: () => Balatro(
            name: '',
            image: '',
            description: '',
            price: 0,
            rarity: '',
            id: 0,
          ),
        );

TextEditingController name = TextEditingController(text: card.name);
TextEditingController image = TextEditingController(text: card.image);
TextEditingController description = TextEditingController(text: card.description);  
TextEditingController price = TextEditingController(text: card.price.toString());
TextEditingController rarity = TextEditingController(text: card.rarity);
TextEditingController id = TextEditingController(text: card.id.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Card'),
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
                    ref.read(cardProvider.notifier).state = [
                      for (final card in ref.read(cardProvider))
                        if (card.id == cardSelected)
                          Balatro(
                            name: name.text,
                            image: image.text,
                            description: description.text,
                            price: int.parse(price.text),
                            rarity: rarity.text,
                            id: int.parse(id.text),
                          )
                        else
                          card
                    ];
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
  }
}