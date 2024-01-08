import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/core/res/res.dart';
import 'package:AKHMAD_NUR_ALAMSYAH_MOBILE_FE_ORDO/src/presentation/model/models.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var leaderboardList = <LeaderboardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Map<String, dynamic>> apiResponse = [
      {
        'number': 1,
        'name': 'Shinta Alexandra',
        'date': '31 Januari 2023',
        'avatar': MediaRes.user4,
        'deals': 45,
      },
      {
        'number': 2,
        'name': 'Jhonatan Zegwin',
        'date': '31 Januari 2023',
        'avatar': MediaRes.user5,
        'deals': 41,
      },
      {
        'number': 3,
        'name': 'Vita Arsalansia',
        'date': '31 Januari 2023',
        'avatar': MediaRes.user6,
        'deals': 34,
      },
      {
        'number': 4,
        'name': 'Meriko Yolanda',
        'date': '31 Januari 2023',
        'avatar': MediaRes.user7,
        'deals': 30,
      },
      {
        'number': 5,
        'name': 'Higuain Morelan',
        'date': '31 Januari 2023',
        'avatar': MediaRes.user8,
        'deals': 25,
      },
    ];

    leaderboardList.value = apiResponse
        .map((data) => LeaderboardModel(
              number: data['number'],
              name: data['name'],
              date: data['date'],
              avatar: data['avatar'],
              deals: data['deals'],
            ))
        .toList();
  }
}
