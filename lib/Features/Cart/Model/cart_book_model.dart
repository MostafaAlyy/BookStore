class CartBook {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartBook(
      {this.itemId,
      this.itemProductId,
      this.itemProductName,
      this.itemProductImage,
      this.itemProductPrice,
      this.itemProductDiscount,
      this.itemProductPriceAfterDiscount,
      this.itemProductStock,
      this.itemQuantity,
      this.itemTotal});

  CartBook.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];
    itemProductPriceAfterDiscount = json['item_product_price_after_discount'];
    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_product_id'] = itemProductId;
    data['item_product_name'] = itemProductName;
    data['item_product_image'] = itemProductImage;
    data['item_product_price'] = itemProductPrice;
    data['item_product_discount'] = itemProductDiscount;
    data['item_product_price_after_discount'] = itemProductPriceAfterDiscount;
    data['item_product_stock'] = itemProductStock;
    data['item_quantity'] = itemQuantity;
    data['item_total'] = itemTotal;
    return data;
  }
}
