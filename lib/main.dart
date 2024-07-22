import 'package:flutter/material.dart';
import 'package:portify/providers/booking_provider.dart';
import 'package:portify/providers/place_provider.dart';
import 'package:portify/screens/booking_history.dart';
import 'package:portify/screens/change_password_screen.dart';
//import 'package:portify/screens/help_screen.dart';
import 'package:portify/screens/home.dart';
import 'package:portify/screens/notifications.dart';
import 'package:portify/screens/pages/team_folder.dart';
import 'package:portify/screens/register/bank_form_screen.dart';
import 'package:portify/screens/register/dacument.dart';
import 'package:portify/screens/register/driverdetails.dart';
import 'package:portify/screens/register/upload_form_screen.dart';
import 'package:portify/screens/register/vehicledetais.dart';
import 'package:portify/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:portify/providers/auth_provider.dart';
import 'package:portify/screens/login_screen.dart';
import 'package:portify/screens/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => AppData()),
          //ChangeNotifierProvider(create: (context) => PlaceProvider()),
          ChangeNotifierProvider(create: (context) => BookingProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Google Maps Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, _) {
              return authProvider.isAuthenticated
                  ? ProfileScreen()
                  : LoginScreen();
            },
          ),
          routes: {
            '/bank-form': (context) => BankFormScreen(),
            '/home': (context) => HomeScreen(),
            '/profile': (context) => ProfileScreen(),
            '/history': (context) => BookingHistory(),
            '/driver': (context) => DriverDetailsForm(),
            '/vehicle': (context) => VehicleDetailsForm(),
            '/documents': (context) => UploadFormScreen(),
            '/help': (context) => DocumentFrom(),
            '/settings': (context) => SettingScreen(),
            '/privacy': (context) => ProfileScreen(),
            // '/help': (context) => const HelpScreen(),
            '/change-password': (context) => const ChnagePassword(),
            '/cloud': (context) => const TeamFolderPage(),
            '/notification': (context) => NotificationScreen()
          },
        ));
  }
}
