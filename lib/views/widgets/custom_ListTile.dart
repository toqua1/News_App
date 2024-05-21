import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title,style: TextStyle()
        ,),
      trailing: hasSwitch
          ? Switch(
        value: switchValue,
        onChanged: onSwitchChanged,
      )
          : null,
      onTap: onTap,
    );
  }
}
