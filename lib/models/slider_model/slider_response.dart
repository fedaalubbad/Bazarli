// To parse this JSON data, do
//
//     final slidersResponse = slidersResponseFromJson(jsonString);

import 'dart:convert';

SlidersResponse slidersResponseFromJson(String str) => SlidersResponse.fromJson(json.decode(str));

String slidersResponseToJson(SlidersResponse data) => json.encode(data.toJson());

class SlidersResponse {
  SlidersResponse({
    this.sliderdata,
    this.links,
    this.meta,
  });

  List<Sliderdatum> sliderdata;
  Links links;
  Meta meta;

  factory SlidersResponse.fromJson(Map<String, dynamic> json) => SlidersResponse(
    sliderdata: List<Sliderdatum>.from(json["data"].map((x) => Sliderdatum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(sliderdata.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Sliderdatum {
  Sliderdatum({
    this.id,
    this.title,
    this.imageUrl,
    this.content,
  });

  int id;
  String title;
  String imageUrl;
  String content;

  factory Sliderdatum.fromJson(Map<String, dynamic> json) => Sliderdatum(
    id: json["id"],
    title: json["title"],
    imageUrl: json["image_url"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image_url": imageUrl,
    "content": content,
  };
}
