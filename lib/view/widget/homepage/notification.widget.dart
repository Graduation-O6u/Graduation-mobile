import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: Card(
            color: index < 4 ? Colors.blue[50] : Colors.white,
            child: ListTile(
              leading: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz6smg3FpheR3jUeFez5EZ5dqSImfpv9fJMEcI1ZUpXQ_TCQV5tKcN0b_OdQAgrbyafD4&usqp=CAU",
                width: 40,
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: index < 4 ? Colors.red : app_colors.secondText,
                ),
              ),
              subtitle: Text("Monday 21 | 11:05"),
              title: Row(
                children: [
                  Text(
                    "Microsoft",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(" Posted A New Job")
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
