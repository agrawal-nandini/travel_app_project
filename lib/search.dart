import 'package:flutter/material.dart';
import 'constants1.dart';
import 'intro_page.dart';

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: <Widget>[
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore the',
                style: TextStyle(
                  fontSize: 29.0,
                  color: Colors.black,
                  fontFamily: 'Outfit',
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Beautiful World',
                style: TextStyle(
                  fontSize: 29.0,
                  color: Colors.black,
                  fontFamily: 'Outfit',
                ),
              )),
          SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: DataSearch());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Color(0x80657ED4),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xFFF7FFF7),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Text(
                          "Search Destinations",
                          style: TextStyle(
                            color: Color(0xFFF7FFF7),
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: const VerticalDivider(
                        color: Color(0xFFF7FFF7),
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: constraints.maxWidth / 8),
                            child: DropdownButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFFF7FFF7),
                              ),
                              underline: Container(),
                              iconSize: 25.0,
                              items: [],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    'New York',
    'London',
    'Paris',
    'Tokyo',
    'Barcelona',
    'Toronto',
    'Moscow',
    'Sydney',
    'Cairo',
    'Istanbul',
    'Rio De Janeiro',
    "Mumbai",
    'Singapore City',
    'Dubai',
    'Rome',
  ];

  final recentcities = [
    'New York',
    'London',
    'Paris',
    'Tokyo',
    'Barcelona',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = cities.where((p) {
      return p.toLowerCase().contains(query.toLowerCase());
    }).toList();
    if (suggestions.isEmpty) {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Container(
            child: Text(
              'No Cities Found',
              style: TextStyle(fontSize: 20.0, fontFamily: 'AnticSlab'),
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      IntroPage(index: cities.indexOf(suggestions[index]))));
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text:
              // TextSpan(
              // text: suggestionsList[index].substring(0, query.length),
              // style:
              // TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              // children: []
              TextSpan(
            text: suggestions[index],
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      itemCount: suggestions.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? recentcities
        : cities
            .where((p) => p.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IntroPage(
                      index: cities.indexOf(suggestionsList[index]))));
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text:
              // TextSpan(
              //     text: suggestionsList[index].substring(0, query.length),
              //     style:
              //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              //     children: []
              TextSpan(
            text: suggestionsList[index],
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      itemCount: suggestionsList.length,
    );
  }
}
