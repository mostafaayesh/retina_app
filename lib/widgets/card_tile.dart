import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  CardTile(
      {this.leading,
      this.titleText,
      this.textStyle,
      this.semanticsLabel,
      this.trailing,
      this.onTap});
  final leading;
  final titleText;
  final textStyle;
  final semanticsLabel;
  final trailing;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTileTheme(
        iconColor: Theme.of(context).iconTheme.color,
        contentPadding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
        child: ListTile(
          leading: this.leading,
          title: Text(
            this.titleText,
            semanticsLabel: this.semanticsLabel,
            style: this.textStyle,
          ),
          trailing: this.trailing,
          onTap: this.onTap,
        ),
      ),
    );
  }
}
