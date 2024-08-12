import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String data;
  const BulletPoint({super.key, 
  required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle, size: 7,
                color: Colors.grey,
              ),
              SizedBox(width: 15,),
              Flexible(child: Text(data, style: TextStyle(color: Colors.grey),))
            ],
          ),
          SizedBox(height: 5,),
          Divider(
            height: 1,
            color: Color.fromARGB(255, 227, 224, 224),
          )
        ],
      ),
    );
  }
}
