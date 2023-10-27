import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef HandleCancelClick = void Function();
typedef HandleSaveClick = void Function();

class TzModalBottomSheet {
  static void showTzModalBottomSheet(
    BuildContext context, {
    Widget titleWidget = const Text('请选择'),
    String cancelText = '取消',
    String saveText = '确定',
    double height = 300,
    bool enableDrag = false,
    bool isDismissible = true,
    bool showTopBtn = false,
    required List<Widget> sheetListWidget,
    VoidCallback? handleRowClick,
    HandleCancelClick? handleCancelClick,
    HandleSaveClick? handleSaveClick,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showTopBtn ?
                    TextButton(onPressed: () {
                        Navigator.pop(context);
                        if (handleCancelClick != null) {
                          handleCancelClick();
                        }
                    }, child: Text(cancelText, style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),)) : Container(),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: titleWidget),
                    showTopBtn ? TextButton(
                      onPressed: () {
                        handleSaveClick!();
                      },
                      child: Text(saveText, style: const TextStyle(
                                  fontSize: 14, color: Colors.blue),),
                    ) : Container(),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: sheetListWidget),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
