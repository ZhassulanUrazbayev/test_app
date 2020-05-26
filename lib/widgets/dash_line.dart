import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 10,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final boxWidth = constraints.constrainWidth();
              final dashWidth = 1.0;
              final dashHeight = height;
              final dashCount = (boxWidth / (4 * dashWidth)).floor();
              return Flex(
                children: List.generate(dashCount, (_) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    width: dashWidth,
                    height: dashHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.5)),
                          color: color),
                    ),
                  );
                }),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
              );
            },
          ),
        ),
      ),
    );
  }
}