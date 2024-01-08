import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/res/res.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/model/models.dart';
import 'package:get/get.dart';

class LeadController extends GetxController {
  var leadsList = <LeadModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    await Future.delayed(const Duration(seconds: 1));

    List<Map<String, dynamic>> apiResponse = [
      {
        'avatar': MediaRes.user1,
        'name': 'Shinta Alexandra',
        'label': 'New Lead',
        'icon': MediaRes.star,
        'color': AppColors.purple,
        'date': '31 Januari 2023',
        'amount': 13000000,
      },
      {
        'avatar': MediaRes.user2,
        'name': 'Vita Arsalansia',
        'label': 'Hot Lead',
        'icon': MediaRes.fire,
        'color': AppColors.lightRed,
        'date': '31 Januari 2023',
        'amount': 13000000,
      },
      {
        'avatar': MediaRes.user3,
        'name': 'Meriko Yolanda',
        'label': 'Cold Lead',
        'icon': MediaRes.snow,
        'color': AppColors.orange,
        'date': '31 Januari 2023',
        'amount': 13000000,
      },
    ];

    leadsList.value = apiResponse
        .map(
          (data) => LeadModel(
            avatar: data['avatar'],
            name: data['name'],
            label: data['label'],
            icon: data['icon'],
            color: data['color'],
            date: data['date'],
            amount: data['amount'],
          ),
        )
        .toList();
  }
}
