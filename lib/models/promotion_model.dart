import 'dart:developer';

class PromotionModel {
  List<Collection>? collection;

  PromotionModel({this.collection});

  PromotionModel.fromJson(Map<String, dynamic> json) {
        log('object: ${collection?.length}');

    if (json['collection'] != null) {
      //check if json['collection'] is single object or list
      if (json['collection'] is List) {
        collection = <Collection>[];
        json['collection'].forEach((v) {
          collection!.add(new Collection.fromJson(v));
        });
      } else {
        collection = <Collection>[];
        collection!.add(new Collection.fromJson(json['collection']));
      }
    }

    log('object: ${collection?.length}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collection {
  int? id;
  String? title;
  String? handle;
  String? description;
  String? publishedAt;
  String? updatedAt;
  var image;
  int? productsCount;

  Collection({this.id, this.title, this.handle, this.description, this.publishedAt, this.updatedAt, this.image, this.productsCount});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    handle = json['handle'];
    description = json['description'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['handle'] = this.handle;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['products_count'] = this.productsCount;
    return data;
  }
}
