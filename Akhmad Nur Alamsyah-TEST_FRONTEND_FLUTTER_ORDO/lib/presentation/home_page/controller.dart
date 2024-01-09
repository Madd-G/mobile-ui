import 'package:flutter/material.dart';
import 'package:flutter_ordo/common/res/media_res.dart';
import 'package:flutter_ordo/presentation/home_page/index.dart';
import 'package:flutter_ordo/presentation/home_page/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  final HomeState state = HomeState();

  void onExplore() {
    state.isEmpty.value = false;
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

  void onHandoverPhase(BuildContext context) {
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
