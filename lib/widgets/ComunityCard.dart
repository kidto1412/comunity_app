import 'package:comunity_apps/theme/shared.dart';
import 'package:flutter/material.dart';

class ComunityCard extends StatelessWidget {
  const ComunityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(
                    'assets/images/profile.jpg'), // Ganti dengan path foto kamu
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Text("Basket Ball"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Text("Public Group"),
                  ),
                ],
              ),
              Spacer(),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Gabung",
                  style: textBlue,
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
