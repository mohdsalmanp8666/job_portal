import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/app/controllers/company_listing_controller.dart';
import 'package:job_portal/custom_print.dart';
import 'package:job_portal/ui/widgets/bottomsheet_widget.dart';
import 'package:job_portal/ui/widgets/custom_company_card.dart';
import 'package:job_portal/ui/widgets/custom_text_widget.dart';

class CompanyListingScreen extends StatelessWidget {
  const CompanyListingScreen({super.key});

  processName(String companyName) {
    var word = companyName.split(' ');
    return word.length < 2 ? companyName : "${word[0]}  ${word[1]}";
  }

  @override
  Widget build(BuildContext context) {
    final companyController = Get.put(CompanyListingController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 25,
              right: 25,
              bottom: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.menu_outlined),
                    // IconButton(
                    //     onPressed: () {
                    //       companyController.loading =
                    //           !companyController.loading;
                    //     },
                    //     icon:
                    Icon(Icons.search_outlined),
                    // ),
                  ],
                ),
                const SizedBox(height: 25),
                customTextWidget(
                  text: "Find Your Dream\nJob Today",
                  fontSize: 36,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Obx(
                    () => companyController.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            itemCount: companyController.companyData.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              var company =
                                  companyController.companyData[index];
                              return CustomCompanyCard(
                                companyName: processName(company.title),
                                companyDesc: company.title,
                                companyImage: company.thumbnailUrl,
                                onTap: () {
                                  customLog("Opened $index: ${company.title}");
                                  Get.bottomSheet(
                                    ignoreSafeArea: false,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.white,
                                    barrierColor: const Color(0xFF6f69e9)
                                        .withOpacity(0.15),
                                    CustomBottomSheetWidget(
                                      companyName: processName(company.title),
                                      companyDesc: company.title,
                                      companyImage: company.thumbnailUrl,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
