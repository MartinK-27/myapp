import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entieties/balatro_cards.dart';
import 'package:myapp/entieties/users.dart';



StateProvider<String> userIDProvider = StateProvider<String>((ref) => '');
StateProvider<int> cardIDProvider = StateProvider<int>((ref) => 0);
StateProvider<String> modeProvider = StateProvider<String>((ref) => '');


StateProvider<List<Users>> userProvider = StateProvider((ref) => [
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

]);

final cardProvider = StateProvider<List<Balatro>>((ref) => [
  Balatro(
    name: 'Blueprint',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzAPd5Exe0UGrjMWJ1-8R1wsYkQpEWbxi0tij9JpguqzpHHZeVgJMTiIeHjWiDrJ7DA3Q&usqp=CAU',
    description: 'Copies ability of Joker to the right',
    price: 10,
    rarity: 'Rare',
    id: 123,
  ),
  Balatro(
    name: 'Brainstorm',
    image:
        'https://cdn.unduel.com/D96E47BC-1A1F-460A-B8DA-6AAA50012108/brainstorm.webp',
    description: 'Copies the ability of leftmost Joker',
    price: 10,
    rarity: 'Rare',
    id: 138,
  ),
  Balatro(
    name: 'Perkeo',
    image:
        'https://i.ytimg.com/vi/kgw6MH9MdGk/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA3hm1QeP27seMLJUIu0L_cX3r2nw',
    description:
        'Creates a Negative copy of 1 random consumable card in your possession at the end of the shop',
    price: 0,
    rarity: 'Legendary',
    id: 150,
  ),
  Balatro(
    name: 'Invisible Joker',
    image:
        'https://i.ytimg.com/vi/f5paNquuors/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBrJUoDBeFtkvWYDBhsaTldzuBCnA',
    description: 'After 2 rounds, sell this card to Duplicate a random Joker',
    price: 8,
    rarity: 'Rare',
    id: 137,
  ),
  Balatro(
    name: 'Showman',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk5btbjnUKjbafQN2EKvlkwsU_McdN6Lb6AA&s',
    description:
        'Joker, Tarot, Planet, and Spectral cards may appear multiple times',
    price: 5,
    rarity: 'Uncommon',
    id: 121,
  ),
  Balatro(
    name: 'Onyx Agate',
    image:
        'https://cdn.unduel.com/D96E47BC-1A1F-460A-B8DA-6AAA50012108/onyx-agate.webp?width=256&quality=85',
    description: 'Played cards with  Club suit give +7 Mult when scored',
    price: 7,
    rarity: 'Uncommon',
    id: 119,
  ),
  Balatro(
    name: 'Hanging Chad',
    image:
        'https://i.ytimg.com/vi/fC5SIAtHMYo/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDpSrCYRGIBtibxBrWPD4aOorR-AQ',
    description:
        'Retrigger first played card used in scoring 2 additional times',
    price: 4,
    rarity: 'Common',
    id: 115,
  ),
  Balatro(
    name: 'Sock and Buskin',
    image:
        'https://i.ytimg.com/vi/7OzUJX0yjaM/hqdefault.jpg',
    description: 'Retrigger all played face cards',
    price: 6,
    rarity: 'Uncommon ',
    id: 109,
  ),
  Balatro(
    name: 'Smiley Face',
    image:
        'https://i.ytimg.com/vi/M4oYe1l6v94/hqdefault.jpg',
    description: 'Played face cards give +5 Mult when scored ',
    price: 4,
    rarity: 'Common ',
    id: 104,
  ),
  Balatro(
    name: 'Ancient Joker',
    image:
        'https://i.ytimg.com/vi/xTuGj4eYBzg/sddefault.jpg',
    description:
        'Each played card with [suit] gives X1.5 Mult when scored, suit changes at end of round',
    price: 8,
    rarity: 'Rare',
    id: 99,
  ),
  Balatro(
    name: 'Popcorn',
    image:
        'https://i.ytimg.com/vi/71XFNyH8vLM/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDWCrL8u2rpm1xBmF_HVwVqcQd70w',
    description: '+20 Mult -4 Mult per round played',
    price: 5,
    rarity: 'Common',
    id: 97,
  ),
  Balatro(
    name: 'Golden Joker',
    image:
        'https://cdn.unduel.com/D96E47BC-1A1F-460A-B8DA-6AAA50012108/golden-joker.webp',
    description: 'Earn s4 at end of round',
    price: 6,
    rarity: 'Common',
    id: 90,
  ),
  Balatro(
    name: 'Photograph',
    image:
        'https://i.ytimg.com/vi/vF3V9D9JIso/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLClSFg53Z0nA3Lk9IsQ079XaQdM-A',
    description: 'First played face card gives X2 Mult when scored',
    price: 5,
    rarity: 'Common',
    id: 78,
  ),
  Balatro(
    name: 'Baron',
    image:
        'https://i.ytimg.com/vi/RcjcQaHAXBA/maxresdefault.jpg',
    description: 'Each King held in hand gives X1.5 Mult',
    price: 8,
    rarity: 'Rare',
    id: 72,
  ),
  Balatro(
    name: 'Hologram',
    image:
        'https://i.ytimg.com/vi/nl0QYHSzNnE/maxresdefault.jpg',
    description:
        'This Joker gains X0.25 Mult every time a playing card is added to your deck (Currently X1 Mult)',
    price: 7,
    rarity: 'Uncommon',
    id: 70,
  ),
  Balatro(
    name: 'Cavendish',
    image:
        'https://cdn.unduel.com/D96E47BC-1A1F-460A-B8DA-6AAA50012108/cavendish.webp?width=256&quality=85',
    description:
        'X3 Mult 1 in 1000 chance this card is destroyed at the end of round',
    price: 4,
    rarity: 'Common',
    id: 61,
  ),
  Balatro(
    name: 'DNA',
    image:
        'https://i.ytimg.com/vi/S-5qGZ9malk/maxresdefault.jpg',
    description:
        'If first hand of round has only 1 card, add a permanent copy to deck and draw it to hand',
    price: 8,
    rarity: 'Rare',
    id: 51,
  ),
  Balatro(
    name: 'Even Steven',
    image:
        'https://i.ytimg.com/vi/H_kyGjbs79U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDzDt-7O5LImiptkPkq5CYhnFiqdg',
    description:
        'Played cards with even rank give +4 Mult when scored (10, 8, 6, 4, 2)',
    price: 4,
    rarity: 'Common',
    id: 39,
  ),
  Balatro(
    name: 'Fibonacci',
    image:
        'https://i.ytimg.com/vi/o_-uvzWgK-k/mqdefault.jpg',
    description: 'Each played Ace, 2, 3, 5, or 8 gives +8 Mult when scored',
    price: 8,
    rarity: 'Uncommon',
    id: 31,
  ),
  Balatro(
    name: 'Mime',
    image:
        'https://i.ytimg.com/vi/6rKQ7bDb-1A/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCdlUAc2nj0HHcg8RzM73cDBb0bYA',
    description: 'Retrigger all card held in hand abilities',
    price: 8,
    rarity: 'Uncommon',
    id: 19,
  ),
]);


