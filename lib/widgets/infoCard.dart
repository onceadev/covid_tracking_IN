import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color color;
  final String spot;
  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.color,
    this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: yMargin(2)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: xMargin(5), vertical: yMargin(1)),
                width: xMargin(35),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: yMargin(2),
                  ),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: xMargin(3)),
                    child: Text(
                      "$effectedNum",
                      style: TextStyle(fontSize: yMargin(4)),
                    )),
              ],
            )
          ],
        );
      },
    );
  }
}
