import 'package:caffery/common/heart.dart';
import 'package:caffery/model/Character.dart';
import 'package:caffery/res/colors.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Character character;

  Details({@required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: CafferyColors.secondary
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Hero(
                tag: 'character-img-${character.img}',
                child: Image.asset(
                  character.img,
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )),
              SizedBox(height: 30),
              ListTile(
                  title: Text(character.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800])),
                  subtitle:
                      Text(character.role, style: TextStyle(letterSpacing: 1)),
                  trailing: Heart()),
              Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                      character.bio,
                      style: TextStyle(color: Colors.grey[600], height: 1.4))),
            ],
          ),
        ));
  }
}
