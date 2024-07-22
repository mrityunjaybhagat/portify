import 'package:flutter/material.dart';
import 'package:portify/app_theme.dart';

class NotificationTiles extends StatelessWidget {
  const NotificationTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notifications, color: AppTheme.primaryColor),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Notification Goes Here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 35),
              Expanded(
                child: Text(
                  'Notification is simply dummy text of the printing and typesetting industry.',
                  style:
                      TextStyle(fontSize: 17, color: AppTheme.secondaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
