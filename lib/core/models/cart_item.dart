class CartItem {
  final String productName;
  final String productId;
  final String producerId;
  final String producerName;
  final int amount;
  final String price;

  CartItem({
    required this.productName,
    required this.productId,
    required this.producerId,
    required this.producerName,
    required this.amount,
    required this.price,
  });
}
