import 'package:fe_ordo/core/res/res.dart';
import 'package:fe_ordo/src/presentation/model/models.dart';
import 'package:get/get.dart';

class KpiController extends GetxController {
  var kpiList = <KpiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    await Future.delayed(const Duration(seconds: 1));

    List<Map<String, dynamic>> apiResponse = [
      {
        'icon': MediaRes.store,
        'color': AppColors.purple,
        'title': 'Total Lead',
        'point': 57,
        'growth': 3.5,
      },
      {
        'icon': MediaRes.fire,
        'color': AppColors.lightRed,
        'title': 'Hot Lead',
        'point': 28,
        'growth': -1.25,
      },
      {
        'icon': MediaRes.check,
        'color': AppColors.green1,
        'title': 'Total Deals',
        'point': 100,
        'growth': 0,
      },
      {
        'icon': MediaRes.flag,
        'color': AppColors.green2,
        'title': 'Grand Opening',
        'point': 150,
        'growth': 3.5,
      },
      {
        'icon': MediaRes.snow,
        'color': AppColors.blue,
        'title': 'Cold Lead',
        'point': 45,
        'growth': 3.5,
      },
      {
        'icon': MediaRes.clear,
        'color': AppColors.red,
        'title': 'Failed Deal',
        'point': 13,
        'growth': 3.5,
      },
    ];

    kpiList.value = apiResponse
        .map(
          (data) => KpiModel(
            icon: data['icon'],
            color: data['color'],
            title: data['title'],
            point: data['point'],
            growth: data['growth'],
          ),
        )
        .toList();
  }
}
