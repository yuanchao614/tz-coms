import 'package:flutter/material.dart';

class TzHorizontalBar extends StatefulWidget {
  // 类型
  final bool isRound;
  // 数据
  final List<Map> dataList;
  // 选中项颜色
  final int activeColor;
  // 选中项下标
  final int activeIndex;
  // 切换事件
  final ValueChanged handleTapChanged;
  TzHorizontalBar(
      {this.isRound = true,
      this.activeColor = 0xff0072FF,
      this.activeIndex = 0,
      required this.dataList,
      required this.handleTapChanged});
  @override
  _TzHorizontalBarState createState() => _TzHorizontalBarState();
}

class _TzHorizontalBarState extends State<TzHorizontalBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: widget.dataList.asMap().entries.map((entry) {
          Map item = entry.value;
          int index = entry.key;
          return GestureDetector(
            onTap: () {
              widget.handleTapChanged(index);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: const EdgeInsets.only(right: 4),
                child: Text(
                  item['label'],
                  style: TextStyle(
                      fontSize: 14,
                      color: index == widget.activeIndex && widget.isRound
                          ? const Color(0xffFFFFFF)
                          : const Color(0xff666666)),
                ),
                decoration: widget.isRound ? BoxDecoration(
                    color: index == widget.activeIndex
                        ? Color(widget.activeColor)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ) : BoxDecoration(
                      border: Border(
                            bottom: widget.isRound
                                ? BorderSide.none
                                : BorderSide(
                                    color: index == widget.activeIndex
                                        ? Color(widget.activeColor)
                                        : Colors.transparent,
                                    width: 1))
                    )),
          );
        }).toList()));
  }
}
