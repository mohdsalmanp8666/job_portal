import 'dart:convert';
import 'package:get/get.dart';
import 'package:job_portal/custom_print.dart';
import 'package:job_portal/data/models/company_data_model.dart';
import 'package:job_portal/services/network_service.dart';

class CompanyListingController extends GetxController {
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  final Rx<List<CompanyDataModel>> _companyData =
      Rx<List<CompanyDataModel>>([]);
  set companyData(value) => _companyData.value = value;
  get companyData => _companyData.value;

  final RxBool _loading = true.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  NetworkService networkService = NetworkService();

  fetchData() async {
    loading = true;
    try {
      final response = await networkService.get();
      loading = false;
      if (response.statusCode == 200) {
        customLog("Got Data");
        var data = jsonDecode(response.body);
        data.forEach((val) {
          customLog(companyData.length);
          _companyData.value.add(CompanyDataModel.fromJson(val));
          customLog(companyData.length);
        });
      } else {
        customLog(response.statusCode);
      }
    } catch (e) {
      customLog("Ran into some error $e");
    }
  }
}
