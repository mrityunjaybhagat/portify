import 'package:flutter/material.dart';
import 'package:portify/screens/booking_detail_screen.dart';
import 'package:portify/services/booking_service.dart';
import 'package:portify/widgets/app_drawer.dart';
import 'package:portify/widgets/booking_history_widget.dart';
import 'package:portify/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:portify/providers/auth_provider.dart';
import 'package:portify/models/booking_model.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (!authProvider.isAuthenticated) {
      return Center(child: Text('User not logged in'));
    }

    final userId = authProvider.user?.id;

    // Now you can use `userId` to fetch data
    return Scaffold(
      appBar: const CustomAppBar(title: 'Booking History'),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: FutureBuilder<List<Booking>>(
          future: BookingService().fetchBookings(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching bookings'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No bookings found'));
            }

            final bookings = snapshot.data!;
            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                return BookingHistoryWidget(
                  booking: bookings[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookingDetailScreen(booking: bookings[index]),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Future<List<Booking>> fetchBookings(String? userId) async {
  //   // Fetch bookings for the given userId
  //   // Make sure to handle null userId case appropriately
  //   // Example API call:
  //   // final response = await http.get('https://oveego.in/Restapi/bookings?userId=$userId');
  //   // Parse response and return list of bookings
  // }
}
