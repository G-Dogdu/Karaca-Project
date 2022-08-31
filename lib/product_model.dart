
import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.error,
    this.errorCode,
    this.message,
    this.statusCode,
    this.data,
  });

  bool? error;
  dynamic errorCode;
  String? message;
  int? statusCode;
  Data? data;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        error: json["error"] == null ? null : json["error"],
        errorCode: json["errorCode"],
        message: json["message"] == null ? null : json["message"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "errorCode": errorCode,
        "message": message == null ? null : message,
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.currentQuery,
    this.products,
    this.filters,
    this.pagination,
    this.sort,
  });

  CurrentQuery? currentQuery;
  List<Product>? products;
  List<Filter>? filters;
  Pagination? pagination;
  List<Sort>? sort;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentQuery: json["currentQuery"] == null
            ? null
            : CurrentQuery.fromJson(json["currentQuery"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        filters: json["filters"] == null
            ? null
            : List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        sort: json["sort"] == null
            ? null
            : List<Sort>.from(json["sort"].map((x) => Sort.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currentQuery": currentQuery == null ? null : currentQuery?.toJson(),
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "filters": filters == null
            ? null
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
        "pagination": pagination == null ? null : pagination?.toJson(),
        "sort": sort == null
            ? null
            : List<dynamic>.from(sort!.map((x) => x.toJson())),
      };
}

class CurrentQuery {
  CurrentQuery({
    this.query,
  });

  Query? query;

  factory CurrentQuery.fromJson(Map<String, dynamic> json) => CurrentQuery(
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query == null ? null : query?.toJson(),
      };
}

class Query {
  Query({
    required this.value,
    required this.params,
  });

  String? value;
  Params? params;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        value: json["value"] == null ? null : json["value"],
        params:
            json["params"] == null ? null : Params?.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "params": params == null ? null : params?.toJson(),
      };
}

class Params {
  Params({
    required this.query,
    this.queryBoutique,
    required this.sort,
    required this.order,
    required this.page,
    required this.stock,
  });

  String? query;
  dynamic queryBoutique;
  String? sort;
  String? order;
  String? page;
  String? stock;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        query: json["query"] == null ? null : json["query"],
        queryBoutique: json["query_boutique"],
        sort: json["sort"] == null ? null : json["sort"],
        order: json["order"] == null ? null : json["order"],
        page: json["page"] == null ? null : json["page"],
        stock: json["stock"] == null ? null : json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "query": query == null ? null : query,
        "query_boutique": queryBoutique,
        "sort": sort == null ? null : sort,
        "order": order == null ? null : order,
        "page": page == null ? null : page,
        "stock": stock == null ? null : stock,
      };
}

class Filter {
  Filter({
    required this.filterKey,
    required this.insiderKey,
    required this.filterTitle,
    required this.emptyFilterId,
    required this.items,
  });

  String? filterKey;
  String? insiderKey;
  String? filterTitle;
  String? emptyFilterId;
  List<Item>? items;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        filterKey: json["filterKey"] == null ? null : json["filterKey"],
        insiderKey: json["insiderKey"] == null ? null : json["insiderKey"],
        filterTitle: json["filterTitle"] == null ? null : json["filterTitle"],
        emptyFilterId:
            json["emptyFilterId"] == null ? null : json["emptyFilterId"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filterKey": filterKey == null ? null : filterKey,
        "insiderKey": insiderKey == null ? null : insiderKey,
        "filterTitle": filterTitle == null ? null : filterTitle,
        "emptyFilterId": emptyFilterId == null ? null : emptyFilterId,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.filterId,
    required this.filterValue,
    required this.filterCount,
    required this.selected,
    required this.rgbColor,
  });

  String? filterId;
  String? filterValue;
  int? filterCount;
  bool? selected;
  String? rgbColor;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        filterId: json["filterId"] == null ? null : json["filterId"],
        filterValue: json["filterValue"] == null ? null : json["filterValue"],
        filterCount: json["filterCount"] == null ? null : json["filterCount"],
        selected: json["selected"] == null ? null : json["selected"],
        rgbColor: json["rgbColor"] == null ? null : json["rgbColor"],
      );

  Map<String, dynamic> toJson() => {
        "filterId": filterId == null ? null : filterId,
        "filterValue": filterValue == null ? null : filterValue,
        "filterCount": filterCount == null ? null : filterCount,
        "selected": selected == null ? null : selected,
        "rgbColor": rgbColor == null ? null : rgbColor,
      };
}

class Pagination {
  Pagination({
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.totalResults,
  });

  int? currentPage;
  int? pageSize;
  int? totalPages;
  int? totalResults;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage == null ? null : currentPage,
        "pageSize": pageSize == null ? null : pageSize,
        "totalPages": totalPages == null ? null : totalPages,
        "totalResults": totalResults == null ? null : totalResults,
      };
}

class Product {
  Product({
    required this.productId,
    required this.model,
    required this.manufacturer,
    required this.name,
    required this.description,
    required this.sku,
    required this.images,
    required this.videos,
    required this.listPrice,
    required this.price,
    this.discountInCart,
    required this.wishListControl,
    required this.wishlistStatus,
    required this.wishCount,
    this.numberOfReviews,
    this.purchase,
    required this.purchasable,
    required this.stock,
    required this.deliveryInfo,
    required this.fastDelivery,
    required this.rating,
    required this.ratingPercent,
    this.sales,
    required this.badges,
    required this.freeShipping,
    required this.url,
    required this.taxonomy,
  });

  String? productId;
  String? model;
  String? manufacturer;
  String? name;
  String? description;
  String? sku;
  List<Image>? images;
  List<Video>? videos;
  ListPrice? listPrice;
  Price? price;
  dynamic discountInCart;
  bool? wishListControl;
  bool? wishlistStatus;
  int? wishCount;
  dynamic numberOfReviews;
  dynamic purchase;
  bool? purchasable;
  Stock? stock;
  String? deliveryInfo;
  bool? fastDelivery;
  double? rating;
  double? ratingPercent;
  dynamic sales;
  List<Badge>? badges;
  bool? freeShipping;
  String? url;
  List<dynamic>? taxonomy;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] == null ? null : json["product_id"],
        model: json["model"] == null ? null : json["model"],
        manufacturer:
            json["manufacturer"] == null ? null : json["manufacturer"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        sku: json["sku"] == null ? null : json["sku"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        videos: json["videos"] == null
            ? null
            : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        listPrice: json["listPrice"] == null
            ? null
            : ListPrice.fromJson(json["listPrice"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        discountInCart: json["discountInCart"],
        wishListControl:
            json["wishListControl"] == null ? null : json["wishListControl"],
        wishlistStatus:
            json["wishlistStatus"] == null ? null : json["wishlistStatus"],
        wishCount: json["wishCount"] == null ? null : json["wishCount"],
        numberOfReviews: json["numberOfReviews"],
        purchase: json["purchase"],
        purchasable: json["purchasable"] == null ? null : json["purchasable"],
        stock: json["stock"] == null ? null : Stock.fromJson(json["stock"]),
        deliveryInfo:
            json["deliveryInfo"] == null ? null : json["deliveryInfo"],
        fastDelivery:
            json["fastDelivery"] == null ? null : json["fastDelivery"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        ratingPercent: json["ratingPercent"] == null
            ? null
            : json["ratingPercent"].toDouble(),
        sales: json["sales"],
        badges: json["badges"] == null
            ? null
            : List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
        freeShipping:
            json["freeShipping"] == null ? null : json["freeShipping"],
        url: json["url"] == null ? null : json["url"],
        taxonomy: json["taxonomy"] == null
            ? null
            : List<dynamic>.from(json["taxonomy"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "model": model == null ? null : model,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "sku": sku == null ? null : sku,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "videos": videos == null
            ? null
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "listPrice": listPrice == null ? null : listPrice!.toJson(),
        "price": price == null ? null : price!.toJson(),
        "discountInCart": discountInCart,
        "wishListControl": wishListControl == null ? null : wishListControl,
        "wishlistStatus": wishlistStatus == null ? null : wishlistStatus,
        "wishCount": wishCount == null ? null : wishCount,
        "numberOfReviews": numberOfReviews,
        "purchase": purchase,
        "purchasable": purchasable == null ? null : purchasable,
        "stock": stock == null ? null : stock!.toJson(),
        "deliveryInfo": deliveryInfo == null ? null : deliveryInfo,
        "fastDelivery": fastDelivery == null ? null : fastDelivery,
        "rating": rating == null ? null : rating,
        "ratingPercent": ratingPercent == null ? null : ratingPercent,
        "sales": sales,
        "badges": badges == null
            ? null
            : List<dynamic>.from(badges!.map((x) => x.toJson())),
        "freeShipping": freeShipping == null ? null : freeShipping,
        "url": url == null ? null : url,
        "taxonomy": taxonomy == null
            ? null
            : List<dynamic>.from(taxonomy!.map((x) => x)),
      };
}

class Badge {
  Badge({
    required this.text,
    required this.badgeName,
    required this.color,
    required this.style,
    required this.location,
    required this.opportunity,
    required this.discount,
    required this.position,
    required this.id,
    required this.image,
    required this.url,
    required this.description,
  });

  String? text;
  String? badgeName;
  String? color;
  Style? style;
  String? location;
  bool? opportunity;
  bool? discount;
  int? position;
  String? id;
  String? image;
  String? url;
  String? description;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        text: json["text"] == null ? null : json["text"],
        badgeName: json["badgeName"] == null ? null : json["badgeName"],
        color: json["color"] == null ? null : json["color"],
        style: json["style"] == null ? null : Style.fromJson(json["style"]),
        location: json["location"] == null ? null : json["location"],
        opportunity: json["opportunity"] == null ? null : json["opportunity"],
        discount: json["discount"] == null ? null : json["discount"],
        position: json["position"] == null ? null : json["position"],
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        url: json["url"] == null ? null : json["url"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "badgeName": badgeName == null ? null : badgeName,
        "color": color == null ? null : color,
        "style": style == null ? null : style!.toJson(),
        "location": location == null ? null : location,
        "opportunity": opportunity == null ? null : opportunity,
        "discount": discount == null ? null : discount,
        "position": position == null ? null : position,
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "url": url == null ? null : url,
        "description": description == null ? null : description,
      };
}

class Style {
  Style({
    required this.fontSize,
    required this.color,
    required this.backgroundColor,
  });

  String? fontSize;
  String? color;
  String? backgroundColor;

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        fontSize: json["fontSize"] == null ? null : json["fontSize"],
        color: json["color"] == null ? null : json["color"],
        backgroundColor:
            json["backgroundColor"] == null ? null : json["backgroundColor"],
      );

  Map<String, dynamic> toJson() => {
        "fontSize": fontSize == null ? null : fontSize,
        "color": color == null ? null : color,
        "backgroundColor": backgroundColor == null ? null : backgroundColor,
      };
}

class Image {
  Image({
    required this.format,
    required this.imageType,
    required this.url,
    required this.zoom,
    required this.thumbUrl,
  });

  String? format;
  String? imageType;
  String? url;
  String? zoom;
  String? thumbUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        format: json["format"] == null ? null : json["format"],
        imageType: json["imageType"] == null ? null : json["imageType"],
        url: json["url"] == null ? null : json["url"],
        zoom: json["zoom"] == null ? null : json["zoom"],
        thumbUrl: json["thumbUrl"] == null ? null : json["thumbUrl"],
      );

  Map<String, dynamic> toJson() => {
        "format": format == null ? null : format,
        "imageType": imageType == null ? null : imageType,
        "url": url == null ? null : url,
        "zoom": zoom == null ? null : zoom,
        "thumbUrl": thumbUrl == null ? null : thumbUrl,
      };
}

class ListPrice {
  ListPrice({
    required this.formattedValue,
    required this.value,
  });

  String? formattedValue;
  double? value;

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        formattedValue:
            json["formattedValue"] == null ? null : json["formattedValue"],
        value: json["value"] == null ? null : json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "formattedValue": formattedValue == null ? null : formattedValue,
        "value": value == null ? null : value,
      };
}

class Price {
  Price({
    required this.discount,
    required this.discountPercent,
    required this.formattedValue,
    required this.value,
  });

  bool? discount;
  int? discountPercent;
  String? formattedValue;
  double? value;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        discount: json["discount"] == null ? null : json["discount"],
        discountPercent:
            json["discountPercent"] == null ? null : json["discountPercent"],
        formattedValue:
            json["formattedValue"] == null ? null : json["formattedValue"],
        value: json["value"] == null ? null : json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "discount": discount == null ? null : discount,
        "discountPercent": discountPercent == null ? null : discountPercent,
        "formattedValue": formattedValue == null ? null : formattedValue,
        "value": value == null ? null : value,
      };
}

class Stock {
  Stock({
    required this.stockLevel,
    required this.stockLevelStatus,
  });

  int? stockLevel;
  String? stockLevelStatus;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        stockLevel: json["stockLevel"] == null ? null : json["stockLevel"],
        stockLevelStatus:
            json["stockLevelStatus"] == null ? null : json["stockLevelStatus"],
      );

  Map<String, dynamic> toJson() => {
        "stockLevel": stockLevel == null ? null : stockLevel,
        "stockLevelStatus": stockLevelStatus == null ? null : stockLevelStatus,
      };
}

class Video {
  Video({
    required this.thumbnail,
    required this.url,
  });

  String? thumbnail;
  String? url;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail,
        "url": url == null ? null : url,
      };
}

class Sort {
  Sort({
    required this.sortKey,
    required this.sortId,
    required this.orderKey,
    required this.orderId,
    required this.sortValue,
    required this.selected,
  });

  String? sortKey;
  String? sortId;
  String? orderKey;
  String? orderId;
  String? sortValue;
  String? selected;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sortKey: json["sortKey"] == null ? null : json["sortKey"],
        sortId: json["sortId"] == null ? null : json["sortId"],
        orderKey: json["orderKey"] == null ? null : json["orderKey"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        sortValue: json["sortValue"] == null ? null : json["sortValue"],
        selected: json["selected"] == null ? null : json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "sortKey": sortKey == null ? null : sortKey,
        "sortId": sortId == null ? null : sortId,
        "orderKey": orderKey == null ? null : orderKey,
        "orderId": orderId == null ? null : orderId,
        "sortValue": sortValue == null ? null : sortValue,
        "selected": selected == null ? null : selected,
      };
}
