import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  // list of icons from font_awesome_flutter
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.ticket,
    FontAwesomeIcons.hotTubPerson,
  ];

  // Widget function to create row of icons
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (() => setState(() {
            _selectedIndex = index;
          })),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(20)),
        child: Icon(_icons[index],
            size: 25,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : const Color(0XFFB4C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          //safearea since no appbar is used
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 120),
            child: Text(
              "What you would like to find?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // SingleChildScrollView for scrollable row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              // Mapping the List<IconData> _icons
              ..._icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ]),
          ),
          const SizedBox(height: 20),
          const DestinationCarousel(),
          HotelCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          _currentTab = value;
        }),
        currentIndex: _currentTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: ''),
        ],
      ),
    );
  }
}
