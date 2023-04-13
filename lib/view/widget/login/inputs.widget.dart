import 'package:MyCareer/core/constatnt/images.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class inputs extends StatelessWidget {
  const inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              2,
              (index) => Container(
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  elevation: 5.0,
                  clipBehavior: Clip.antiAlias, // Add This
                  shadowColor: Color.fromARGB(255, 224, 224, 224),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                    onPressed: () {},
                    child: loginList[index].icon,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 5.0,
            clipBehavior: Clip.antiAlias, // Add This
            shadowColor: Color.fromARGB(255, 224, 224, 224),
            child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
                onPressed: () {},
                child: Image.asset(
                  images.Google,
                  width: 40,
                  fit: BoxFit.fill,
                )),
          ),
        ),
      ],
    );
  }
}
