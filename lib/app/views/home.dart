import 'package:flutter/material.dart';
import 'package:hogwarts/app/controllers/character_controller.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:hogwarts/app/views/details_page.dart';
import 'character_list.dart';
import 'favorite_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;
  Set<String> favoriteCharacters = Set<String>(); // Daftar karakter favorit

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavorite(String characterName) {
    setState(() {
      if (favoriteCharacters.contains(characterName)) {
        favoriteCharacters.remove(characterName);
      } else {
        favoriteCharacters.add(characterName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEEEEE),
        toolbarHeight: 60,
        elevation: 0,
        title: Text(
          'HOGWARTS 🏰',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xff2c3e50),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: _selectedPageIndex == 0
          ? CharacterList(
              controller: controller,
              toggleFavorite: _toggleFavorite,
              favoriteCharacters: favoriteCharacters,
            )
          : FavoritePage(
              favoriteCharacters: favoriteCharacters,
            ),
      backgroundColor: Color(0xffEEEEEE),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Color(0xff2c3e50),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
