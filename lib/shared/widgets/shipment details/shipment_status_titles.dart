enum ShipmentStatus {
  shippingAddress("Shipping Address"),
  delivered("Delivered"),
  outForDelivery("Out for Delivery"),
  pickedUp("Picked Up");

  final String value;
  const ShipmentStatus(this.value);
}
