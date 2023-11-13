/// This class is used in the [cart_item_widget] screen.
class CartItemModel {
  CartItemModel({
    this.nikeAirZoomPegasus,
    this.price,
    this.one,
    this.id,
  }) {
    nikeAirZoomPegasus = nikeAirZoomPegasus ?? "Nike Air Zoom Pegasus 36 Miami";
    price = price ?? "299,43";
    one = one ?? "1";
    id = id ?? "";
  }

  String? nikeAirZoomPegasus;

  String? price;

  String? one;

  String? id;
}
