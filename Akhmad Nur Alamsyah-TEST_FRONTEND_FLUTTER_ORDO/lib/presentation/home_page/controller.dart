import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/entities/entities.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/common/style/color.dart';
import 'package:flutter_ordo/common/utils/custom_text_style.dart';
import 'package:flutter_ordo/presentation/home_page/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  RxInt currentIndex = 0.obs;

  RxBool isEmpty = true.obs;

  final List<Order> orders = [
    Order(
      orderId: '#881726478123',
      residenceName: 'Candra Bhirawa',
      location: 'Lotus, Kavling A1, Blok B',
      date: '25/11/2022, 09:00',
      image: MediaRes.banner2,
      type: 'Komersil',
      price: 850000000,
      latePaymentDays: null,
      penalty: null,
      isLate: false,
    ),
    Order(
      orderId: '#881726478124',
      residenceName: 'Bukit Raya Residance',
      location: 'Jaguar, Kavling A1, Blok D',
      date: '25/12/2023, 09:00',
      image: MediaRes.banner3,
      type: 'Komersil',
      price: 985799300,
      latePaymentDays: 7,
      penalty: 8550000,
      isLate: true,
    ),
    Order(
      orderId: '#881726478125',
      residenceName: 'Bukit Tinggi Residance',
      location: 'Cat, Kavling C3, Blok E',
      date: '26/12/2023, 11:16',
      image: MediaRes.banner3,
      type: 'Komersil',
      price: 639599500,
      latePaymentDays: 5,
      penalty: 5550000,
      isLate: true,
    ),
  ];

  final List<Menu> menus = [
    Menu(title: 'Pemesanan', image: MediaRes.menu1, progress: 100, phase: 1),
    Menu(title: 'Administrasi', image: MediaRes.menu2, progress: 50, phase: 2),
    Menu(title: 'Pembangunan', image: MediaRes.menu3, progress: 0, phase: 3),
    Menu(
        title: 'Akad & Serah Terima',
        image: MediaRes.menu4,
        progress: 0,
        phase: 4),
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void onExplore() {
    isEmpty.value = false;
  }

  void onOrderPhase(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext modelContext) {
        return const BottomSheetContent(
          title: 'Tahap Pemesanan',
          subtitle: 'Daftar menu tahap pemesanan',
          content: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 10.0,
            spacing: 7.5,
            children: <Widget>[
              BottomSheetItem(
                title: 'Booking',
                subtitle: 'Fee',
                isActive: true,
                icon: MediaRes.moneyReceived,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Pesanan',
                subtitle: 'Belum Bayar',
                isActive: false,
                icon: MediaRes.emptyWalletTime,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Riwayat',
                subtitle: 'Pemesanan',
                isActive: false,
                icon: MediaRes.noteFavorite,
                isIcon: true,
              ),
            ],
          ),
        );
      },
    );
  }

  void onAdministrationPhase(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext modelContext) {
        return const BottomSheetContent(
          title: 'Tahap Administrasi',
          subtitle: 'Daftar menu tahap administrasi',
          content: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 15.0,
            spacing: 7.5,
            children: <Widget>[
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'SPS',
                isActive: true,
                icon: MediaRes.rulerPen,
                isIcon: true,
                isNeedAttention: true,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'SPR',
                isActive: false,
                icon: MediaRes.edit2,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'PPJB',
                isActive: false,
                icon: MediaRes.documentText,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Daftar',
                subtitle: 'Dokumen',
                isActive: false,
                icon: MediaRes.note2,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'SP3K',
                isActive: false,
                icon: MediaRes.archiveBook,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Bayar',
                subtitle: 'Angsuran',
                isActive: false,
                icon: MediaRes.receiptText,
                isIcon: true,
              ),
            ],
          ),
        );
      },
    );
  }

  void onBuildingPhase(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext modelContext) {
        return const BottomSheetContent(
          title: 'Tahap Pembangunan',
          subtitle: 'Daftar menu tahap pembangunan rumah',
          content: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 15.0,
            spacing: 7.5,
            children: <Widget>[
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'Persiapan',
                isActive: true,
                icon: MediaRes.rulerPen,
                isIcon: false,
                progress: 100,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'Pondasi & Struktur',
                isActive: false,
                icon: MediaRes.edit2,
                isIcon: false,
                progress: 20,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'Rumah Unfinished',
                isActive: false,
                icon: MediaRes.documentText,
                isIcon: false,
                progress: 30,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'Finishing & Interior',
                isActive: false,
                icon: MediaRes.note2,
                isIcon: false,
                progress: 40,
              ),
              BottomSheetItem(
                title: 'Tahap',
                subtitle: 'Pembersihan',
                isActive: false,
                icon: MediaRes.archiveBook,
                isIcon: false,
                progress: 0,
              ),
            ],
          ),
        );
      },
    );
  }

  onHandoverPhase(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext modelContext) {
        return const BottomSheetContent(
          title: 'Tahap akad & Serah Terima',
          subtitle: 'Daftar menu tahap akad & serah terima',
          content: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 10.0,
            spacing: 7.5,
            children: <Widget>[
              BottomSheetItem(
                title: 'Booking',
                subtitle: 'Akad',
                isActive: true,
                icon: MediaRes.handshake,
                isIcon: true,
                isNeedAttention: true,
              ),
              BottomSheetItem(
                title: 'Pesanan',
                subtitle: 'Serah Terima Bangunan',
                isActive: false,
                icon: MediaRes.key,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Riwayat',
                subtitle: 'Serah Terima Legalitas',
                isActive: false,
                icon: MediaRes.judge,
                isIcon: true,
              ),
              BottomSheetItem(
                title: 'Booking',
                subtitle: 'Komplain',
                isActive: false,
                icon: MediaRes.danger,
                isIcon: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  final String title, subtitle;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 5.0,
                  width: 60.5,
                  decoration: const BoxDecoration(
                      color: AppColors.gray100,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                ),
                const SizedBox(height: 20.0),
                Text(
                  title,
                  style: CustomTextStyle.textExtraLargeMedium
                      .copyWith(color: AppColors.baseDark),
                ),
                Text(
                  subtitle,
                  style: CustomTextStyle.textSmallRegular
                      .copyWith(color: AppColors.gray200),
                ),
                const SizedBox(height: 15.0),
                const Divider(
                  thickness: 2.0,
                  color: AppColors.gray100,
                ),
                const SizedBox(height: 20.0),
                content,
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
