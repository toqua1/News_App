import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;
  // final Color? color;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
    // required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title,style:TextStyle(
        fontSize: 16,
        fontFamily: 'Metropolis thin',
        fontWeight: FontWeight.w900,
        color: title =='Logout' ?Colors.red:null
      )
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
