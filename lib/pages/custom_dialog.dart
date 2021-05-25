import 'package:flutter/material.dart';

/// 对话框组件，暂时只考虑 android 平台
class GDDialog extends StatefulWidget {
  GDDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final void Function() onConfirm;
  final void Function() onCancel;

  @override
  _GDDialogState createState() => _GDDialogState();
}

class _GDDialogState extends State<GDDialog> {
  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = MaterialStateProperty.all(const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ));
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(widget.title),
      titlePadding: const EdgeInsets.only(left: 20, top: 24, right: 20),
      titleTextStyle: const TextStyle(
        color: Color.fromRGBO(51, 56, 62, 1),
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 1,
      ),
      contentPadding:
          const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.content,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              height: 22.5 / 15,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(157, 163, 172, 1),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Text(widget.cancelText),
                  onPressed: widget.onCancel,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(241, 242, 244, 1)),
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(51, 56, 62, 1)),
                    textStyle: buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(34, 84, 244, 1)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: buttonTextStyle,
                  ),
                  child: Text(widget.confirmText),
                  onPressed: widget.onConfirm,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TestDialog extends StatefulWidget {
  TestDialog({Key? key}) : super(key: key);

  @override
  _TestDialogState createState() => _TestDialogState();
}

class _TestDialogState extends State<TestDialog> {
  void handleShowDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return GDDialog(
          title:
              '这是一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的标题',
          content:
              '这是一段很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的文字',
          confirmText: '确定',
          cancelText: '取消',
          onConfirm: () {},
          onCancel: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义对话框'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('show dialog'),
          onPressed: handleShowDialog,
        ),
      ),
    );
  }
}
