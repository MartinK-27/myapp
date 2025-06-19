import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entieties/balatro_cards.dart';
import 'package:myapp/presentation/providers.dart';

class CardDetail extends ConsumerWidget {

  const CardDetail({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    final cardID = ref.watch(cardIDProvider);
    final cards = ref.watch(cardProvider);
    final card = cards.firstWhere(
      (cards) => cards.id == cardID,
      orElse: () => Balatro(name: '', image: '', description: '', price: 0, rarity: '', id: 0),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(card.name, style: TextStyle(fontSize: 24, color:
                                card.rarity == 'Legendary'
                                    ? Colors.purple
                                    : card.rarity == 'Rare'
                                    ? const Color.fromARGB(255, 243, 33, 33)
                                    : card.rarity == 'Uncommon'
                                    ? const Color.fromARGB(255, 63, 223, 15)
                                    : Colors
                                        .grey,)),
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
  }
}
