import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  Destination destination;
  DestinationScreen({Key? key, required this.destination}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6)
                  ]),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.arrowDownWideShort),
                        iconSize: 25,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.destination.city,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.2)),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.locationArrow,
                          size: 15, color: Colors.white70),
                      SizedBox(width: 5),
                      Text(
                        widget.destination.country,
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25,
                ))
          ],
        )
      ]),
    );
  }
}
