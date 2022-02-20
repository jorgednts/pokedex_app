import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/model/pokemon_model.dart';
import '../page/pokemon_details_page.dart';

class PokedexCardWidget extends StatelessWidget {
  const PokedexCardWidget({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonDetailPage(pokemon: pokemon)));
        },
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          margin: const EdgeInsets.all(2),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFEC0344), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '#${pokemon.id.toString()}',
                        style: const TextStyle(
                          color: Color(0xFFEC0344),
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SvgPicture.network(
                    pokemon.image,
                    placeholderBuilder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFEC0344),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
