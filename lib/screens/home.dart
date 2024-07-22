import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:portify/app_theme.dart';
import 'package:portify/screens/booking_history.dart';
import 'package:portify/screens/map/map.dart';
import 'package:portify/screens/notifications.dart';
import 'package:portify/screens/profile_screen.dart'; // Adjust the import path as per your project structure
import 'package:portify/screens/setting_screen.dart';
import 'package:portify/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<Widget> _screens = [
    MapScreen(),
    NotificationScreen(),
    BookingHistory(),
    SettingScreen(),
    ProfileScreen(), // Add ProfileScreen to the list
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward(from: 1.0);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(title: 'Home'),
      drawer: AppDrawer(),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: _currentIndex == 0,
        transitionBuilder: (Widget child, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 60),
            painter: CurvedNavigationBarPainter(),
          ),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: AppTheme.secondaryColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile', // Label for profile screen
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvedNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.5, -40, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedNavigationBarPainter oldDelegate) => false;
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
