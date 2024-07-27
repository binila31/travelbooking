import 'package:flutter/material.dart';
import 'package:travelbooking/screens/destination_screen.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';


class HomeScreen extends StatelessWidget {
  final List<Destination> destinations = [
    Destination(id: '1', name: 'Paris', imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/640px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg'),
  Destination(id: '2', name: 'Tajmahal', imageUrl:'https://upload.wikimedia.org/wikipedia/commons/1/1d/Taj_Mahal_%28Edited%29.jpeg'),
  Destination(id: '3', name: 'America', imageUrl:'https://cdn.mos.cms.futurecdn.net/XsbvTN6PRi6PZtgEGvRsiE.jpg'),
  Destination(id: '4', name: 'Switzerland', imageUrl:'https://cdn.britannica.com/65/162465-050-9CDA9BC9/Alps-Switzerland.jpg'),
    Destination(id: '5', name: 'Germany', imageUrl:'https://deih43ym53wif.cloudfront.net/berlin-germany-shutterstock_314149679_87b7a543ce.jpeg'),
    Destination(id: '6', name: 'Maldives', imageUrl:'https://afar.brightspotcdn.com/dims4/default/dd4ced2/2147483647/strip/true/crop/3000x1592+0+323/resize/1440x764!/quality/90/?url=https%3A%2F%2Fk3-prod-afar-media.s3.us-west-2.amazonaws.com%2Fbrightspot%2Fb2%2Ff4%2F9a1ebe3f427f8e5eb937f8df8998%2Ftravelguides-maldives-videomediastudioeurope-shutterstock.jpg'),
    Destination(id: '7', name: 'Rome', imageUrl:'https://tourismmedia.italia.it/is/image/mitur/20220127150143-colosseo-roma-lazio-shutterstock-756032350-1?wid=1600&hei=900&fit=constrain,1&fmt=webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Booking App')),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => DestinationDetailScreen(destination: destinations[index]),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var begin = Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: DestinationCard(destination: destinations[index]),
          );
        },
      ),
    );
  }
}
