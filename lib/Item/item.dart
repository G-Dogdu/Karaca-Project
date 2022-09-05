import 'package:flutter/material.dart';

class CurrentItem {
  Text? name;
  String? id;
  Text? price;
  String? sku;
  Text? model;
  List<String>? images = [];

  CurrentItem(this.name, this.id, this.price, this.sku, this.model);

  Text? getName() {
    return name;
  }

  String? getId() {
    return id;
  }

  Text? getPrice() {
    return price;
  }

  Text? getModel() {
    return model;
  }

  String? getSku() {
    return sku;
  }

  List<String>? getImages() {
    return images;
  }

  void setName(Text? newName) {
    name = newName;
  }

  void setId(String? newId) {
    id = newId;
  }

  void setPrice(Text? newPrice) {
    price = newPrice;
  }

  void setModel(Text? newModel) {
    model = newModel;
  }

  void setSku(String? newSku) {
    sku = newSku;
  }

  void addImage(String? url) {
    images?.add(url!);
  }
}
