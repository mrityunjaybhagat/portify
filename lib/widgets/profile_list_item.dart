import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    required Key key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(
        bottom: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 25,
          ),
          const SizedBox(width: 15),
          Text(
            this.text,
            //style: kTitleTextStyle.copyWith(
            //  fontWeight: FontWeight.w500, fontFamily: "Poppins"),
          ),
          const Spacer(),
          if (this.hasNavigation)
            const Icon(
              Icons.arrow_back,
              // LineAwesomeIcons.angle_right,
              size: 25,
            ),
        ],
      ),
    );
  }
}
