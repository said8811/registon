import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileInfoItem extends StatelessWidget {
  ProfileInfoItem({
    super.key,
    required this.info,
    required this.type,
  });
  String info;
  String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
              width: 105.w,
              child: Text(
                type,
                style: TextStyle(
                    fontSize: 20, color: Colors.black.withOpacity(0.4)),
              )),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(":  "),
          ),
          Expanded(
            child: Text(
              info,
              style:
                  TextStyle(fontSize: 20, color: Colors.blue.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }
}
