// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    this.items,
    this.hasMore,
    this.limit,
    this.offset,
    this.count,
    this.links,
  });

  List<Item>? items;
  bool? hasMore;
  num? limit;
  num? offset;
  num? count;
  List<Link>? links;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        hasMore: json["hasMore"],
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "hasMore": hasMore,
        "limit": limit,
        "offset": offset,
        "count": count,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.pk,
    this.customerIdFk,
    this.mobileNumber,
    this.total,
    this.discountAmount,
    this.subTotal,
    this.receivedAmount,
    this.returnAmount,
    this.paymentType,
    this.sellPerson,
    this.bunitFk,
    this.sellDate,
    this.couponCode,
    this.vat,
    this.slType,
    this.trnId,
    this.discountAble,
    this.discountCoupon,
    this.discountPct,
    this.vatableAmt,
    this.netAmt,
    this.appAvil,
    this.unixtimestamp,
    this.usedBranch,
    this.useDate,
    this.startDate,
  });

  num? pk;
  num? customerIdFk;
  MobileNumber? mobileNumber;
  num? total;
  num? discountAmount;
  num? subTotal;
  num? receivedAmount;
  num? returnAmount;
  String? paymentType;
  SellPerson? sellPerson;
  num? bunitFk;
  String? sellDate;
  MobileNumber? couponCode;
  num? vat;
  SellPerson? slType;
  String? trnId;
  num? discountAble;
  String? discountCoupon;
  num? discountPct;
  num? vatableAmt;
  num? netAmt;
  num? appAvil;
  String? unixtimestamp;
  dynamic? usedBranch;
  dynamic? useDate;
  Date? startDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        customerIdFk:
            json["customer_id_fk"] == null ? null : json["customer_id_fk"],
        mobileNumber: mobileNumberValues.map![json["mobile_number"]],
        total: json["total"],
        discountAmount: json["discount_amount"],
        subTotal: json["sub_total"],
        receivedAmount: json["received_amount"],
        returnAmount: json["return_amount"],
        paymentType: json["payment_type"],
        sellPerson: sellPersonValues.map[json["sell_person"]],
        bunitFk: json["bunit_fk"],
        sellDate: json['sell_date'],
        couponCode: json["coupon_code"] == null
            ? null
            : mobileNumberValues.map[json["coupon_code"]],
        vat: json["vat"],
        slType: json["sl_type"] == null
            ? null
            : sellPersonValues.map[json["sl_type"]],
        trnId: json["trn_id"] == null ? null : json["trn_id"],
        discountAble: json["discount_able"],
        discountCoupon:
            json["discount_coupon"] == null ? null : json["discount_coupon"],
        discountPct: json["discount_pct"],
        vatableAmt: json["vatable_amt"],
        netAmt: json["net_amt"],
        appAvil: json["app_avil"] == null ? null : json["app_avil"],
        unixtimestamp:
            json["unixtimestamp"] == null ? null : json["unixtimestamp"],
        usedBranch: json["used_branch"],
        useDate: json["use_date"],
        startDate: json["start_date"] == null
            ? null
            : dateValues.map[json["start_date"]],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "customer_id_fk": customerIdFk == null ? null : customerIdFk,
        "mobile_number": mobileNumberValues.reverse[mobileNumber],
        "total": total,
        "discount_amount": discountAmount,
        "sub_total": subTotal,
        "received_amount": receivedAmount,
        "return_amount": returnAmount,
        "payment_type": paymentType,
        "sell_person": sellPersonValues.reverse[sellPerson],
        "bunit_fk": bunitFk,
        "sell_date": dateValues.reverse[sellDate],
        "coupon_code":
            couponCode == null ? null : mobileNumberValues.reverse[couponCode],
        "vat": vat,
        "sl_type": slType == null ? null : sellPersonValues.reverse[slType],
        "trn_id": trnId == null ? null : trnId,
        "discount_able": discountAble,
        "discount_coupon": discountCoupon == null ? null : discountCoupon,
        "discount_pct": discountPct,
        "vatable_amt": vatableAmt,
        "net_amt": netAmt,
        "app_avil": appAvil == null ? null : appAvil,
        "unixtimestamp": unixtimestamp == null ? null : unixtimestamp,
        "used_branch": usedBranch,
        "use_date": useDate,
        "start_date": startDate == null ? null : dateValues.reverse[startDate],
      };
}

enum MobileNumber { THE_30434288_UX30, THE_254342547_FF5, THE_01717956094 }

final mobileNumberValues = EnumValues({
  "01717956094": MobileNumber.THE_01717956094,
  "254342547FF5": MobileNumber.THE_254342547_FF5,
  "30434288UX30": MobileNumber.THE_30434288_UX30
});

enum Date { THE_30_OCT_2022, THE_24_OCT_2022, THE_10_OCT_2022 }

final dateValues = EnumValues({
  "10/Oct/2022": Date.THE_10_OCT_2022,
  "24/Oct/2022": Date.THE_24_OCT_2022,
  "30/Oct/2022": Date.THE_30_OCT_2022
});

enum SellPerson { ANDROID, AM_IT, SHOHAG }

final sellPersonValues = EnumValues({
  "AM-IT": SellPerson.AM_IT,
  "ANDROID": SellPerson.ANDROID,
  "SHOHAG": SellPerson.SHOHAG
});

class Link {
  Link({
    this.rel,
    this.href,
  });

  String? rel;
  String? href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
