// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Card packageCard(Icon icon, String name, double price, String description,
    int duration, Function onTap) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(child: icon),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text('$duration months',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
          SizedBox(height: 5),
          Text(description, style: TextStyle(fontSize: 12)),
        ],
      ),
      trailing: Text('৳ ${price.toStringAsFixed(0)}',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
      onTap: () => onTap(),
    ),
  );
}
