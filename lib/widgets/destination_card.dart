import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:travelbooking/screens/destination_screen.dart';
import '../models/destination.dart';


class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDetailScreen(destination: destination),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Hero(
              tag: destination.id,
              child: CachedNetworkImage(
                imageUrl: destination.imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ListTile(
              title: Text(destination.name),
            ),
          ],
        ),
      ),
    );
  }
}
