class CurrentItem {
  late String name;
  late String id;
  late String price;
  late String sku;

  CurrentItem(this.name, this.id, this.price, this.sku);

  String? getName() {
    return name;
  }

  String? getId() {
    return id;
  }

  String? getPrice() {
    return price;
  }

  String? getSku() {
    return sku;
  }

  void setName(String newName) {
    name = newName;
  }

  void setId(String newId) {
    id = newId;
  }

  void setPrice(String newPrice) {
    price = newPrice;
  }

  void setSku(String newSku) {
    sku = newSku;
  }
}
