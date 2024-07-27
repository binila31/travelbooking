import 'package:flutter/material.dart';
import '../widgets/booking_form.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Your Trip')),
      body:AnimatedBookingForm(),
    );
  }
}
