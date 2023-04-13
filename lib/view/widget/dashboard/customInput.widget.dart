import 'package:flutter/material.dart';

class customInput extends StatelessWidget {
  final String title;
  final String title2;
  final double width;
  final bool req;

  const customInput(
      {super.key,
      required this.req,
      required this.title,
      required this.title2,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(title),
                req
                    ? Text(
                        "*",
                        style: TextStyle(color: Colors.red[800]),
                      )
                    : Text(""),
              ],
            )),
        SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 5.0,
            clipBehavior: Clip.antiAlias, // Add This
            shadowColor: Colors.blue.withOpacity(0.5),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 1),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title2),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
