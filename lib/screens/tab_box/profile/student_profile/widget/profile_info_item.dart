import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class ProfileInfoItem extends StatelessWidget {
  ProfileInfoItem({
    super.key,
    required this.info,
    required this.type,
    required this.svg,
  });
  String info;
  String type;
  String svg;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svg),
          Expanded(
            child: ListTile(
              title: Text(
                type,
                style: const TextStyle(color: Color(0xffA1A1A1)),
              ),
              subtitle: Text(
                info,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
