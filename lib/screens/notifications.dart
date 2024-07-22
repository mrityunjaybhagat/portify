import 'package:flutter/material.dart';
import 'package:portify/widgets/app_drawer.dart';
import 'package:portify/widgets/custom_app_bar.dart';
import 'package:portify/widgets/dashboard/tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
              NotificationTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
