import 'package:flutter/material.dart';
import 'package:job_portal/ui/widgets/custom_image.dart';

import 'custom_text_widget.dart';

class CustomCompanyCard extends StatelessWidget {
  final String companyName;
  final String companyDesc;
  final String companyImage;
  final Function() onTap;
  const CustomCompanyCard({
    Key? key,
    required this.companyName,
    required this.companyDesc,
    required this.companyImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade200,
          child: CustomImage(companyImage: companyImage),
        ),
        trailing: const CircleAvatar(
          radius: 15,
          backgroundColor: Color(0xFF6f69e9),
          child: Icon(
            Icons.work_outline_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        horizontalTitleGap: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: customTextWidget(
          text: companyName,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: customTextWidget(
          text: companyDesc,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ),
    );
  }
}
