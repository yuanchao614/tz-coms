import 'package:flutter/material.dart';

class TzAvator extends StatefulWidget {
  // 图片地址
  String url;
  // 图片宽度
  double width;
  // 图片高度
  double height;
  // 阴影
  int shadowColor;
  // 点击事件
  VoidCallback? handleOnTap;

  TzAvator({
    Key? key,
    this.url = "",
    this.width = 48,
    this.height = 48,
    this.shadowColor = 0xffF5F6FA,
    this.handleOnTap,
  }) : super(key: key);

  @override
  State<TzAvator> createState() => _TzAvator();
}

class _TzAvator extends State<TzAvator> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handleOnTap!();
      },
      child: Container(
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.width / 2),
              side: BorderSide(width: 0.5, color: Color(widget.shadowColor))),
          // child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              widget.url,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
          ),
          // ),
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(widget.shadowColor),
              blurRadius: 5.0,
              offset: const Offset(0, 10),
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
