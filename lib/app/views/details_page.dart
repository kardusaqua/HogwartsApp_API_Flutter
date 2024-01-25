import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hogwarts/app/models/character_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key,required this.characterModel}) : super(key: key);
 final CharacterModel characterModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2c3e50),
        elevation: 0,
        title: Text(characterModel.name, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:
        SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 26,),
            Hero(tag: characterModel.name, 
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff2c3e50).withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 5,
                    )
                  ]
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: characterModel.image,
                            height: 200,
                            placeholder: (context,url)=>const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xff2c3e50),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                            ),
                          ),
              ),
            ),
            ),
            //more data
            const SizedBox(height: 15,),
            Text(characterModel.name,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text(characterModel.house.toString(),
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),),
            
            Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              color: Color(0xff2d3447),
              borderRadius: BorderRadius.circular(18),
            ),
              child: Column(
                children: [
                  Row(
                    children: [
                     Text('  Actor', style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300
                     ),),
                     Spacer(),
                     Text(characterModel.actor.toString(),
                     style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600
                     ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  const Divider(indent: 5, endIndent: 5, color: Color(0xffEEEEEE)),
                  SizedBox(height: 5,),

                  Row(
                    children: [
                     Text('  Gender', style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300
                     ),),
                     Spacer(),
                     Text(characterModel.gender.toString(),
                     style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600
                     ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  const Divider(indent: 5, endIndent: 5, color: Color(0xffEEEEEE)),
                  SizedBox(height: 5,),

                  Row(
                    children: [
                     Text('  Date of Birth', style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300
                     ),),
                     Spacer(),
                     Text(characterModel.dateOfBirth.toString(),
                     style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600
                     ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  const Divider(indent: 5, endIndent: 5, color: Color(0xffEEEEEE)),
                  SizedBox(height: 5,),

                  Row(
                    children: [
                     Text('  Eye Color', style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300
                     ),),
                     Spacer(),
                     Text(characterModel.eyeColour.toString(),
                     style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600
                     ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  const Divider(indent: 5, endIndent: 5, color: Color(0xffEEEEEE)),
                  SizedBox(height: 5,),

                  Row(
                    children: [
                     Text('  Hair Color', style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300
                     ),),
                     Spacer(),
                     Text(characterModel.hairColour.toString(),
                     style: GoogleFonts.poppins(
                      color: Colors.white,fontSize: 15, fontWeight: FontWeight.w600
                     ),),
                    ],
                  ),
                ],
              ),
            ),
          ]),
      ),
    );
  }
}