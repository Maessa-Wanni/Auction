import 'package:emaritas_auction/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonOutLine extends StatefulWidget {
  final icon;
  final String name;
  final double width;
  final double height;
  final Color color;

  ButtonOutLine({
    required this.color,
    this.icon,
    required this.name,
    required this.width,
    required this.height,
  });

  @override
  _ButtonOutLineState createState() => _ButtonOutLineState();
}

class _ButtonOutLineState extends State<ButtonOutLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon != null ? widget.icon : Container(),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ],
          )),
    );
  }
}
