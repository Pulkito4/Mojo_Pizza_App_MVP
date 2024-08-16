import 'package:flutter/material.dart';

class SavedPaymentsCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget navigateTo;
  final IconData iconData;
  const SavedPaymentsCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigateTo));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconData),
                  SizedBox(
                    width: screenSize.width * 0.04,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_right_sharp)
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.7,
            child: Text(
              description,
              style: const TextStyle(color: Color.fromARGB(195, 84, 84, 84)),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          const Divider(
            height: 2,
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
        ],
      ),
    );
  }
}
