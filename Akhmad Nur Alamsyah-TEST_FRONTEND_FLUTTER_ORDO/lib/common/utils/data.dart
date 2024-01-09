import 'package:flutter_ordo/common/entities/entities.dart';
import 'package:flutter_ordo/common/res/media_res.dart';

class Data {
  const Data._();

  static List<Menu> get menuList => _menuList;

  static List<Order> get orderList => _orderList;

  static List<String> get bannerList => _bannerList;

  static final List<Menu> _menuList = [
    Menu(title: 'Pemesanan', image: MediaRes.menu1, progress: 100, phase: 1),
    Menu(title: 'Administrasi', image: MediaRes.menu2, progress: 50, phase: 2),
    Menu(title: 'Pembangunan', image: MediaRes.menu3, progress: 0, phase: 3),
    Menu(
        title: 'Akad & Serah Terima',
        image: MediaRes.menu4,
        progress: 0,
        phase: 4),
  ];

  static final List<Order> _orderList = [
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

  static final List<String> _bannerList = [MediaRes.banner1, MediaRes.banner4];
}
