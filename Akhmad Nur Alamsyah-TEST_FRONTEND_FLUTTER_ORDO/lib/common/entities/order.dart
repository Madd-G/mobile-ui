class Order {
  final String orderId, residenceName, location, date, image, type;
  final int price;
  final int? latePaymentDays, penalty;
  final bool isLate;

  Order({
    required this.orderId,
    required this.residenceName,
    required this.location,
    required this.date,
    required this.image,
    required this.type,
    required this.price,
    this.latePaymentDays,
    this.penalty,
    required this.isLate,
  });
}
