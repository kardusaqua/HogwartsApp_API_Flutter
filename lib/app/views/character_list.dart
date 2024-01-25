import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hogwarts/app/controllers/character_controller.dart';

import 'package:hogwarts/app/views/details_page.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({
    Key? key,
    required this.controller,
    required this.toggleFavorite,
    required this.favoriteCharacters,
  }) : super(key: key);

  final CharacterController controller;
  final void Function(String) toggleFavorite;
  final Set<String> favoriteCharacters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff2c3e50),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.characters.length,
                  itemBuilder: (context, index) {
                    final character = controller.characters[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              characterModel: character,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: character.name,
                                    child: CachedNetworkImage(
                                      imageUrl: character.image,
                                      height: 90,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff2c3e50),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          character.name,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          character.house.toString(),
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      favoriteCharacters.contains(character.name)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: favoriteCharacters.contains(character.name)
                                          ? Colors.red
                                          : null,
                                    ),
                                    onPressed: () {
                                      toggleFavorite(character.name);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
