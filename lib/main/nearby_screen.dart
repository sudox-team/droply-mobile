import 'package:droply/common/constants.dart';
import 'package:droply/common/ui/other_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NearbyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NearbyScreenState();
  }
}

class _NearbyScreenState extends State<NearbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            buildSwitchSetting("Scan devices nearby", "We'll show you devices that also use "
                "EasyShare")
          ],
        ),
      ),
    );
  }
}
