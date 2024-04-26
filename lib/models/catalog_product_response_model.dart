class CatalogProductResponseModel {
  // int? status;
  List<Data>? data;
  // String? message;

  // CatalogProductResponseModal({this.status, this.data, this.message});

  CatalogProductResponseModel.fromJson(json) {
    // status = json['status'];
    if (json != null) {
      data = <Data>[];
      json.forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    // message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? templateSuffix;
  String? publishedScope;
  String? tags;
  String? status;
  String? adminGraphqlApiId;
  List<Variants>? variants;
  List<Options>? options;
  List<Image>? images;
  Image? image;

  Data(
      {this.id,
      this.title,
      this.bodyHtml,
      this.vendor,
      this.productType,
      this.createdAt,
      this.handle,
      this.updatedAt,
      this.publishedAt,
      this.templateSuffix,
      this.publishedScope,
      this.tags,
      this.status,
      this.adminGraphqlApiId,
      this.variants,
      this.options,
      this.images,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyHtml = json['body_html'];
    vendor = json['vendor'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    handle = json['handle'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    templateSuffix = json['template_suffix'];
    publishedScope = json['published_scope'];
    tags = json['tags'];
    status = json['status'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((v) {
        images!.add(new Image.fromJson(v));
      });
    }
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body_html'] = this.bodyHtml;
    data['vendor'] = this.vendor;
    data['product_type'] = this.productType;
    data['created_at'] = this.createdAt;
    data['handle'] = this.handle;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    data['template_suffix'] = this.templateSuffix;
    data['published_scope'] = this.publishedScope;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Variants {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? inventoryPolicy;
  String? compareAtPrice;
  String? fulfillmentService;
  String? inventoryManagement;
  String? option1;
  var option2;
  var option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  String? barcode;
  int? grams;
  var weight;
  String? weightUnit;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;
  var imageId;

  Variants(
      {this.id,
      this.productId,
      this.title,
      this.price,
      this.sku,
      this.position,
      this.inventoryPolicy,
      this.compareAtPrice,
      this.fulfillmentService,
      this.inventoryManagement,
      this.option1,
      this.option2,
      this.option3,
      this.createdAt,
      this.updatedAt,
      this.taxable,
      this.barcode,
      this.grams,
      this.weight,
      this.weightUnit,
      this.inventoryItemId,
      this.inventoryQuantity,
      this.oldInventoryQuantity,
      this.requiresShipping,
      this.adminGraphqlApiId,
      this.imageId});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    fulfillmentService = json['fulfillment_service'];
    inventoryManagement = json['inventory_management'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    grams = json['grams'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
    inventoryQuantity = json['inventory_quantity'];
    oldInventoryQuantity = json['old_inventory_quantity'];
    requiresShipping = json['requires_shipping'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['position'] = this.position;
    data['inventory_policy'] = this.inventoryPolicy;
    data['compare_at_price'] = this.compareAtPrice;
    data['fulfillment_service'] = this.fulfillmentService;
    data['inventory_management'] = this.inventoryManagement;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['taxable'] = this.taxable;
    data['barcode'] = this.barcode;
    data['grams'] = this.grams;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['inventory_item_id'] = this.inventoryItemId;
    data['inventory_quantity'] = this.inventoryQuantity;
    data['old_inventory_quantity'] = this.oldInventoryQuantity;
    data['requires_shipping'] = this.requiresShipping;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['image_id'] = this.imageId;
    return data;
  }
}

class Options {
  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;

  Options({this.id, this.productId, this.name, this.position, this.values});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    position = json['position'];
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['position'] = this.position;
    data['values'] = this.values;
    return data;
  }
}

// class Images {
//   int? id;
//   String? alt;
//   int? position;
//   int? productId;
//   String? createdAt;
//   String? updatedAt;
//   String? adminGraphqlApiId;
//   int? width;
//   int? height;
//   String? src;
//   var variantIds;

//   Images({this.id, this.alt, this.position, this.productId, this.createdAt, this.updatedAt, this.adminGraphqlApiId, this.width, this.height, this.src, this.variantIds});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     alt = json['alt'];
//     position = json['position'];
//     productId = json['product_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     adminGraphqlApiId = json['admin_graphql_api_id'];
//     width = json['width'];
//     height = json['height'];
//     src = json['src'];
//     variantIds = json['variant_ids'];
//     // if (json['variant_ids'] != null) {
//     //   variantIds = <Null>[];
//     // json['variant_ids'].forEach((v) {
//     //   variantIds!.add(new Null.fromJson(v));
//     // });
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['alt'] = this.alt;
//     data['position'] = this.position;
//     data['product_id'] = this.productId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['admin_graphql_api_id'] = this.adminGraphqlApiId;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['src'] = this.src;
//     if (this.variantIds != null) {
//       data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Image {
  int? id;
  var alt;
  int? position;
  int? productId;
  String? createdAt;
  String? updatedAt;
  String? adminGraphqlApiId;
  int? width;
  int? height;
  String? src;
  var variantIds;

  Image({this.id, this.alt, this.position, this.productId, this.createdAt, this.updatedAt, this.adminGraphqlApiId, this.width, this.height, this.src, this.variantIds});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alt = json['alt'];
    position = json['position'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    variantIds = json['variant_ids'];
    // if (json['variant_ids'] != null) {
    //   variantIds = <Null>[];
    //   json['variant_ids'].forEach((v) {
    //     variantIds!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alt'] = this.alt;
    data['position'] = this.position;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    data['width'] = this.width;
    data['height'] = this.height;
    data['src'] = this.src;
    data['variant_ids'] = this.variantIds;
    // if (this.variantIds != null) {
    //   data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
