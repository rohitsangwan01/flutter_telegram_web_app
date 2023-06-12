import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';

class KButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const KButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

class KDetailsList extends StatelessWidget {
  final String title;
  final dynamic value;
  final bool isColor;
  const KDetailsList(
    this.title,
    this.value, {
    this.isColor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return value == null
        ? const SizedBox()
        : Column(
            children: [
              ListTile(
                  leading: Text("$title : "),
                  title: Text(value?.toString() ?? "Not Available"),
                  trailing: !isColor
                      ? null
                      : Container(
                          width: 20,
                          height: 20,
                          color: value.toString().toColor(),
                        )),
              const Divider(),
            ],
          );
  }
}
