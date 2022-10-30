import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  InfoModel({
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

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
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
    this.iteminfoFk,
    this.tslmsFk,
    this.dsc,
    this.tp,
    this.mrp,
    this.qty,
    this.discount,
    this.vat,
    this.bunitFk,
    this.isCombo,
    this.appAvail,
    this.msmasteridOffersid,
  });

  num? pk;
  num? iteminfoFk;
  num? tslmsFk;
  String? dsc;
  num? tp;
  num? mrp;
  num? qty;
  num? discount;
  num? vat;
  num? bunitFk;
  num? isCombo;
  String? appAvail;
  String? msmasteridOffersid;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        pk: json["pk"],
        iteminfoFk: json["iteminfo_fk"],
        tslmsFk: json["tslms_fk"],
        dsc: json["dsc"],
        tp: json["tp"],
        mrp: json["mrp"],
        qty: json["qty"],
        discount: json["discount"],
        vat: json["vat"],
        bunitFk: json["bunit_fk"],
        isCombo: json["is_combo"],
        appAvail: json["app_avail"],
        msmasteridOffersid: json["msmasterid_offersid"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "iteminfo_fk": iteminfoFk,
        "tslms_fk": tslmsFk,
        "dsc": dsc,
        "tp": tp,
        "mrp": mrp,
        "qty": qty,
        "discount": discount,
        "vat": vat,
        "bunit_fk": bunitFk,
        "is_combo": isCombo,
        "app_avail": appAvail,
        "msmasterid_offersid": msmasteridOffersid,
      };
}

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
