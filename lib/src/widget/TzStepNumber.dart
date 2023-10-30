import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:yiju_flutter/util/toast.dart';

//faith 2020年04月20日11:05:57
class TzStepNumber extends StatefulWidget {
  //高度
  final double height;
  //输入框的宽度 总体宽度为自适应
  final double width;
  //按钮的宽度
  final double iconWidth;
  //默认输入框显示的数量
  final String initNum;
  // 回显值
  final String echoValue;
  // 最大值
  final num min;
  // 最大值
  final num max;
  //点击加号回调 数量
  final ValueChanged addValueChanged;
  //点击减号回调 数量
  final ValueChanged removeValueChanged;
  //点击减号任意一个回调 数量
  final ValueChanged updateValueChanged;
  TextInputType? keyboardType;
  final bool? enabled;
  List<TextInputFormatter>? inputFormatters;

  TzStepNumber({
    // required Key key,
    this.enabled = false,
    this.height = 30,
    this.width = 45,
    this.iconWidth = 24,
    this.initNum = '0',
    this.keyboardType,
    this.inputFormatters,
    this.echoValue = '',
    this.min = 0,
    this.max = 9999,
    required this.addValueChanged,
    required this.removeValueChanged,
    required this.updateValueChanged,
  });
  @override
  _TzStepNumberState createState() => _TzStepNumberState();
}

class _TzStepNumberState extends State<TzStepNumber> {
  var textController = TextEditingController();

  void echoTextController(String value) {
    textController.text = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text = widget.initNum;
    textController.addListener(() {
      if (textController.text.isNotEmpty) {
        int num = int.parse(textController.text);
        if (num > widget.max || num < widget.min) {
          // ToastUtils.show('取值范围${widget.min}-${widget.max}');
          textController.text = num > widget.max ? widget.max.toString() : widget.min.toString();
        }
        widget.updateValueChanged(textController.text);
      } else {
        widget.updateValueChanged(widget.initNum);
      }
    });
  }

  @override
  void didUpdateWidget(TzStepNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.echoValue != null && oldWidget.echoValue != widget.echoValue) {
      echoTextController(widget.echoValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(color: Colors.black12, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //减号
              coustomIconButton(icon: Icons.remove, isAdd: false),
              //输入框
              Container(
                width: widget.width,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1, color: Colors.black12),
                        right: BorderSide(width: 1, color: Colors.black12))),
                child: TextField(
                  enabled: widget.enabled,
                  controller: textController,
                  keyboardType: widget.keyboardType ?? TextInputType.number,
                  inputFormatters: widget.inputFormatters ?? [],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                  enableInteractiveSelection: false,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 0, top: 2, bottom: 2, right: 0),
                    border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              //加号
              coustomIconButton(icon: Icons.add, isAdd: true),
            ],
          ),
        )
      ],
    );
  }

  Widget coustomIconButton({required IconData icon, required bool isAdd}) {
    return Container(
      width: widget.iconWidth,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(icon),
        onPressed: () {
          var num = int.parse(textController.text);
          if (!isAdd && num == 0) return;
          if (isAdd) {
            num++;
            if (widget.addValueChanged != null) widget.addValueChanged(num);
          } else {
            num--;
            if (widget.removeValueChanged != null)
              widget.removeValueChanged(num);
          }
          textController.text = '$num';
          if (widget.updateValueChanged != null) widget.updateValueChanged(num.toString());
        },
      ),
    );
  }
}
