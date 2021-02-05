import 'package:caffery/model/Character.dart';
import 'package:caffery/res/colors.dart';
import 'package:caffery/res/images.dart';
import 'package:caffery/screens/details.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _characterTiles = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addCharacters();
    });
  }

  void _addCharacters() {
    // get data from db
    List<Character> _characters = [
      Character(
          name: 'Neal Caffery',
          role: 'FBI Consultant',
          age: '43',
          img: Images.neal,
          bio:
              'Neal is known for his good looks, his fitness, his brilliant out-of-the-box thinking, ability to talk, lie or charm his way out of (or into) anything, and charisma. These traits prove to be crucial necessities in his line of work and serve as an advantage in the many instances where his or another person\'s life is on the line.'),
      Character(
          name: 'Peter Burke',
          role: 'Agent',
          age: '57',
          img: Images.peter,
          bio:
              'A no-nonsense federal agent in the FBI\'s White Collar Crime Unit, Peter believes in earning success the old-fashioned way, with perseverance and hard work. Adhering to a \'by the book\' approach to law enforcement, he has high moral and ethical standards, although having Neal assigned as his CI occasionally makes him more willing to bend rules and look at \'grey areas\' for opportunities to catch the real bad guys.'),
      Character(
          name: 'Elizabeth Burke',
          role: 'Event Planner',
          age: '40',
          img: Images.elizabeth,
          bio:
              'The beautiful,epic, and sophisticated wife of FBI agent Peter Burke, Elizabeth Burke, understands her husband\'s work ethic. As Peter\'s friend and mate, she stands by her husband as he tracks elusive criminals and offers fresh perspective whenever he needs it. Elizabeth even gives flirting tricks when her husband is undercover and needs to flirt a woman.'),
      Character(
          name: 'Mozzie',
          role: 'Criminal Connections',
          age: '45',
          img: Images.mozzie,
          bio:
              'Mozzie is an ally, confidant, and close friend to Neal and is the person who has the know-how to get information and get things done. He has deep connections in the criminal underworld and can get just about anything for Neal, from classified secrets to cutting edge technology. What Mozzie lacks in charm and charisma, he makes up for with insider knowledge and secret sources. Neal has always counted on his mysterious friend, and now that Neal is spending a little time on the right side of the law, Mozzie\'s connections could prove to be more valuable than ever.'),
    ];

    Future ft = Future(() {});
    _characters.forEach((Character character) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _characterTiles.add(_buildTile(character));
          _listKey.currentState.insertItem(_characterTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Character character) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(character: character)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(character.role,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CafferyColors.secondary)),
          Text(character.name,
              style: TextStyle(fontSize: 20, color: CafferyColors.primary)),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'character-img-${character.img}',
          child: Image.asset(
            character.img,
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('${character.age} years'),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _characterTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _characterTiles[index],
          );
        });
  }
}
