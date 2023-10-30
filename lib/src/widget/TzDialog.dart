import 'package:flutter/material.dart';

class TzDialog extends StatefulWidget {
  // 取消按钮
  final String cancelText;
  // 确认按钮
  final String confirmText;
  // 宽度
  final double width;
  // 内容
  final Widget child;
  // 取消事件
  final VoidCallback? handleCancel;
  // 切换事件
  final VoidCallback handleConfirm;
  TzDialog(
      {this.cancelText = '取消',
      this.confirmText = '确定',
      this.width = 300,
      this.handleCancel,
      required this.child,
      required this.handleConfirm});
  @override
  _TzDialogState createState() => _TzDialogState();
}

class _TzDialogState extends State<TzDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: SingleChildScrollView(
            child: Container(
              width: widget.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.child,
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            widget.cancelText,
                            style:
                                const TextStyle(fontSize: 16.0, color: Color(0xff2787FC)),
                          ),
                        ),
                        style: ButtonStyle(
                          //圆角
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                          //边框
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Color(0xff2787FC), width: 0.5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          if (widget.handleCancel != null) {
                            widget.handleCancel!();
                          }
                        },
                      ),
                      const SizedBox(width: 16,),
                      OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            widget.confirmText,
                            style: const TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                            //圆角
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                            //边框
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                  color: Color(0xff2787FC), width: 0.5),
                            ),
                            //背景
                            backgroundColor:
                                MaterialStateProperty.all(
                              const Color(0xff2787FC))),
                        onPressed: () {
                          widget.handleConfirm();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
