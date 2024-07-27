import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/destination.dart';

class DestinationDetailScreen extends StatelessWidget {
  final Destination destination;

  DestinationDetailScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: Column(
        children: [
          Hero(
            tag: destination.id,
            child: CachedNetworkImage(
              imageUrl: destination.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
     ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/booking');
        },
        child: Text('Book a Trip'),
     )
          // Add more detailed content here
        ],
      ),
    );
  }
}
