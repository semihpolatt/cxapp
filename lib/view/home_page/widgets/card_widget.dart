import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final String? count;
  final IconData? icon;
  const CardWidget(
      {this.title = 'User Count',
      this.count = '24',
      this.icon = Icons.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff111333),
            Color(0xff111333),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                count!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
