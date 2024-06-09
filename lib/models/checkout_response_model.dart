class CheckoutResponseModel {
  Order? order;
  String? invoiceUrl;

  CheckoutResponseModel({this.order, this.invoiceUrl});

  CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    invoiceUrl = json['invoice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['invoice_url'] = this.invoiceUrl;
    return data;
  }
}

class Order {
  int? id;
  var note;
  var email;
  bool? taxesIncluded;
  String? currency;
  var invoiceSentAt;
  String? createdAt;
  String? updatedAt;
  bool? taxExempt;
  var completedAt;
  String? name;
  String? status;
  List<LineItems>? lineItems;
  var shippingAddress;
  var billingAddress;
  String? invoiceUrl;
  var appliedDiscount;
  var orderId;
  var shippingLine;
  List<TaxLines>? taxLines;
  String? tags;
  String? totalPrice;
  String? subtotalPrice;
  String? totalTax;
  var paymentTerms;
  String? adminGraphqlApiId;

  Order(
      {this.id,
      this.note,
      this.email,
      this.taxesIncluded,
      this.currency,
      this.invoiceSentAt,
      this.createdAt,
      this.updatedAt,
      this.taxExempt,
      this.completedAt,
      this.name,
      this.status,
      this.lineItems,
      this.shippingAddress,
      this.billingAddress,
      this.invoiceUrl,
      this.appliedDiscount,
      this.orderId,
      this.shippingLine,
      this.taxLines,
      this.tags,
      this.totalPrice,
      this.subtotalPrice,
      this.totalTax,
      this.paymentTerms,
      this.adminGraphqlApiId});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    email = json['email'];
    taxesIncluded = json['taxes_included'];
    currency = json['currency'];
    invoiceSentAt = json['invoice_sent_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxExempt = json['tax_exempt'];
    completedAt = json['completed_at'];
    name = json['name'];
    status = json['status'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    shippingAddress = json['shipping_address'];
    billingAddress = json['billing_address'];
    invoiceUrl = json['invoice_url'];
    appliedDiscount = json['applied_discount'];
    orderId = json['order_id'];
    shippingLine = json['shipping_line'];
    if (json['tax_lines'] != null) {
      taxLines = <TaxLines>[];
      json['tax_lines'].forEach((v) {
        taxLines!.add(new TaxLines.fromJson(v));
      });
    }
    tags = json['tags'];
    totalPrice = json['total_price'];
    subtotalPrice = json['subtotal_price'];
    totalTax = json['total_tax'];
    paymentTerms = json['payment_terms'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['email'] = this.email;
    data['taxes_included'] = this.taxesIncluded;
    data['currency'] = this.currency;
    data['invoice_sent_at'] = this.invoiceSentAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tax_exempt'] = this.taxExempt;
    data['completed_at'] = this.completedAt;
    data['name'] = this.name;
    data['status'] = this.status;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    data['shipping_address'] = this.shippingAddress;
    data['billing_address'] = this.billingAddress;
    data['invoice_url'] = this.invoiceUrl;
    data['applied_discount'] = this.appliedDiscount;
    data['order_id'] = this.orderId;
    data['shipping_line'] = this.shippingLine;
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    data['total_price'] = this.totalPrice;
    data['subtotal_price'] = this.subtotalPrice;
    data['total_tax'] = this.totalTax;
    data['payment_terms'] = this.paymentTerms;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}

class LineItems {
  int? id;
  int? variantId;
  int? productId;
  String? title;
  var variantTitle;
  String? sku;
  String? vendor;
  int? quantity;
  bool? requiresShipping;
  bool? taxable;
  bool? giftCard;
  String? fulfillmentService;
  int? grams;
  List<TaxLines>? taxLines;
  var appliedDiscount;
  String? name;
  bool? custom;
  String? price;
  String? adminGraphqlApiId;

  LineItems(
      {this.id,
      this.variantId,
      this.productId,
      this.title,
      this.variantTitle,
      this.sku,
      this.vendor,
      this.quantity,
      this.requiresShipping,
      this.taxable,
      this.giftCard,
      this.fulfillmentService,
      this.grams,
      this.taxLines,
      this.appliedDiscount,
      this.name,
      this.custom,
      this.price,
      this.adminGraphqlApiId});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variantId = json['variant_id'];
    productId = json['product_id'];
    title = json['title'];
    variantTitle = json['variant_title'];
    sku = json['sku'];
    vendor = json['vendor'];
    quantity = json['quantity'];
    requiresShipping = json['requires_shipping'];
    taxable = json['taxable'];
    giftCard = json['gift_card'];
    fulfillmentService = json['fulfillment_service'];
    grams = json['grams'];
    if (json['tax_lines'] != null) {
      taxLines = <TaxLines>[];
      json['tax_lines'].forEach((v) {
        taxLines!.add(new TaxLines.fromJson(v));
      });
    }
    appliedDiscount = json['applied_discount'];
    name = json['name'];
    custom = json['custom'];
    price = json['price'];
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['variant_id'] = this.variantId;
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['variant_title'] = this.variantTitle;
    data['sku'] = this.sku;
    data['vendor'] = this.vendor;
    data['quantity'] = this.quantity;
    data['requires_shipping'] = this.requiresShipping;
    data['taxable'] = this.taxable;
    data['gift_card'] = this.giftCard;
    data['fulfillment_service'] = this.fulfillmentService;
    data['grams'] = this.grams;
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines!.map((v) => v.toJson()).toList();
    }
    data['applied_discount'] = this.appliedDiscount;
    data['name'] = this.name;
    data['custom'] = this.custom;
    data['price'] = this.price;
    data['admin_graphql_api_id'] = this.adminGraphqlApiId;
    return data;
  }
}

class TaxLines {
  double? rate;
  String? title;
  String? price;

  TaxLines({this.rate, this.title, this.price});

  TaxLines.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['title'] = this.title;
    data['price'] = this.price;
    return data;
  }
}
