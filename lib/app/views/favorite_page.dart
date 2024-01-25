import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
    required this.favoriteCharacters,
  }) : super(key: key);

  final Set<String> favoriteCharacters;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteCharacters.isEmpty
          ? Text('No favorite characters yet.',
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),)
          : ListView.builder(
            
              itemCount: favoriteCharacters.length,
              itemBuilder: (context, index) {
                final characterName = favoriteCharacters.elementAt(index);
                // You can fetch more details about the character using characterName
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      characterName,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    tileColor: Colors.white,
                  ),
                );
              },
            ),
    );
  }
}
