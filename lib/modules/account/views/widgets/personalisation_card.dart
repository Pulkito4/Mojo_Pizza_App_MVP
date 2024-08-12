import 'package:flutter/material.dart';

class PersonalisationCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget navigateTo;
  const PersonalisationCard(
      {super.key,
      required this.title,
      required this.description,
      required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigateTo));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Icon(Icons.keyboard_arrow_right_sharp)
              ],
            ),
            SizedBox(
              width: screenSize.width*0.7,
              child: Text(
                description,
                style: TextStyle(color: Color.fromARGB(195, 84, 84, 84)),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Divider(
              height: 2,
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
