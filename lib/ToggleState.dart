import 'package:flutter/material.dart';

class Item {
  String name;
  String image;
  bool isOn;

  Item({
    this.name,
    this.image,
    this.isOn,
  });
}

class AppTab extends StatelessWidget {
  final List<Item> deviceItem;
  final Function onToggle;

  AppTab(this.deviceItem, this.onToggle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 1.1,
        children: deviceItem
            .map((deviceItem) => Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9.0),
                            child: Image.asset(
                              'assets/${deviceItem.image}',
                              width: 150.0,
                              height: 150.0,
                            ),
                          ),
                          onTap: () => onToggle(deviceItem.name),
                        ),
                        Spacer(),
                        if (deviceItem.isOn)
                          Icon(Icons.power_settings_new,
                              color: Colors.green, size: 50.0),
                        if (!deviceItem.isOn)
                          Icon(Icons.power_settings_new,
                              color: Colors.red, size: 50.0),
                      ]),
                      Spacer(),
                      Text(deviceItem.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.0),
                      Text(
                        '${deviceItem.isOn ? 'ON' : 'OFF'}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: deviceItem.isOn ? Colors.teal : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
