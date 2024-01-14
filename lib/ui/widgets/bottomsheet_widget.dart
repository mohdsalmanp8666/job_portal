import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/ui/widgets/custom_image.dart';
import 'package:job_portal/ui/widgets/custom_text_widget.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final String companyName;
  final String companyDesc;
  final String companyImage;

  const CustomBottomSheetWidget({
    super.key,
    required this.companyName,
    required this.companyDesc,
    required this.companyImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Company Image
            CircleAvatar(
              radius: 50,
              child: CustomImage(companyImage: companyImage),
            ),
            // * About Company
            Expanded(
                child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              // color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextWidget(
                    text: companyName,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 25),
                  customTextWidget(
                    text: companyDesc,
                    textAlign: TextAlign.justify,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ],
              ),
            )),
            // * Apply Now Button
            SizedBox(
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    '',
                    '',
                    titleText: customTextWidget(
                      text: "Job Applied Successfully!",
                      color: Colors.greenAccent,
                    ),
                    messageText: const SizedBox(),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.greenAccent,
                    backgroundColor: const Color(0xFF2a2b2b),
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 25,
                    ),
                    shouldIconPulse: false,
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color(0xFF6f69e9)),
                child: customTextWidget(
                  text: "Apply Now",
                  color: Colors.white,
                ),
              ),
            ),
            // Spacer(),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
