// To parse this JSON data, do
//
//     final geeksEventTable = geeksEventTableFromMap(jsonString);

import 'dart:convert';

class GeeksEventData {
  GeeksEventData({
    this.events,
    this.meta,
  });

  List<Event>? events;
  Meta? meta;

  factory GeeksEventData.fromJson(String str) =>
      GeeksEventData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeeksEventData.fromMap(Map<String, dynamic> json) => GeeksEventData(
        events: json["events"] == null
            ? null
            : List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "events": events == null
            ? null
            : List<dynamic>.from(events?.map((x) => x.toMap()) ?? []),
        "meta": meta?.toMap(),
      };
}

class Event {
  Event({
    this.type,
    this.id,
    this.datetimeUtc,
    this.venue,
    this.datetimeTbd,
    this.performers,
    this.isOpen,
    this.links,
    this.datetimeLocal,
    this.timeTbd,
    this.shortTitle,
    this.visibleUntilUtc,
    this.stats,
    this.taxonomies,
    this.url,
    this.score,
    this.announceDate,
    this.createdAt,
    this.dateTbd,
    this.title,
    this.popularity,
    this.description,
    this.status,
    this.accessMethod,
    this.eventPromotion,
    this.announcements,
    this.conditional,
    this.enddatetimeUtc,
    this.themes,
    this.domainInformation,
  });

  String? type;
  int? id;
  DateTime? datetimeUtc;
  Venue? venue;
  bool? datetimeTbd;
  List<Performer>? performers;
  bool? isOpen;
  List<dynamic>? links;
  DateTime? datetimeLocal;
  bool? timeTbd;
  String? shortTitle;
  DateTime? visibleUntilUtc;
  EventStats? stats;
  List<Taxonomy>? taxonomies;
  String? url;
  double? score;
  DateTime? announceDate;
  DateTime? createdAt;
  bool? dateTbd;
  String? title;
  double? popularity;
  String? description;
  String? status;
  AccessMethod? accessMethod;
  EventPromotion? eventPromotion;
  Announcements? announcements;
  bool? conditional;
  dynamic? enddatetimeUtc;
  List<dynamic>? themes;
  List<dynamic>? domainInformation;

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        type: json["type"],
        id: json["id"],
        datetimeUtc: json["datetime_utc"] == null
            ? null
            : DateTime.parse(json["datetime_utc"]),
        venue: json["venue"] == null ? null : Venue.fromMap(json["venue"]),
        datetimeTbd: json["datetime_tbd"],
        performers: json["performers"] == null
            ? null
            : List<Performer>.from(
                json["performers"].map((x) => Performer.fromMap(x))),
        isOpen: json["is_open"],
        links: json["links"] == null
            ? null
            : List<dynamic>.from(json["links"].map((x) => x)),
        datetimeLocal: json["datetime_local"] == null
            ? null
            : DateTime.parse(json["datetime_local"]),
        timeTbd: json["time_tbd"],
        shortTitle: json["short_title"],
        visibleUntilUtc: json["visible_until_utc"] == null
            ? null
            : DateTime.parse(json["visible_until_utc"]),
        stats: json["stats"] == null ? null : EventStats.fromMap(json["stats"]),
        taxonomies: json["taxonomies"] == null
            ? null
            : List<Taxonomy>.from(
                json["taxonomies"].map((x) => Taxonomy.fromMap(x))),
        url: json["url"],
        score: json["score"].toDouble(),
        announceDate: json["announce_date"] == null
            ? null
            : DateTime.parse(json["announce_date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        dateTbd: json["date_tbd"],
        title: json["title"],
        popularity: json["popularity"].toDouble(),
        description: json["description"],
        status: json["status"],
        accessMethod: json["access_method"] == null
            ? null
            : AccessMethod.fromMap(json["access_method"]),
        eventPromotion: json["event_promotion"] == null
            ? null
            : EventPromotion.fromMap(json["event_promotion"]),
        announcements: json["announcements"] == null
            ? null
            : Announcements.fromMap(json["announcements"]),
        conditional: json["conditional"],
        enddatetimeUtc: json["enddatetime_utc"],
        themes: json["themes"] == null
            ? null
            : List<dynamic>.from(json["themes"].map((x) => x)),
        domainInformation: json["domain_information"] == null
            ? null
            : List<dynamic>.from(json["domain_information"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "datetime_utc": datetimeUtc?.toIso8601String(),
        "venue": venue?.toMap(),
        "datetime_tbd": datetimeTbd,
        "performers": performers == null
            ? null
            : List<dynamic>.from(performers?.map((x) => x.toMap()) ?? []),
        "is_open": isOpen,
        "links": links == null
            ? null
            : List<dynamic>.from(links?.map((x) => x) ?? []),
        "datetime_local": datetimeLocal?.toIso8601String(),
        "time_tbd": timeTbd,
        "short_title": shortTitle,
        "visible_until_utc": visibleUntilUtc?.toIso8601String(),
        "stats": stats?.toMap(),
        "taxonomies": taxonomies == null
            ? null
            : List<dynamic>.from(taxonomies?.map((x) => x.toMap()) ?? []),
        "url": url,
        "score": score,
        "announce_date": announceDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "date_tbd": dateTbd,
        "title": title,
        "popularity": popularity,
        "description": description,
        "status": status,
        "access_method": accessMethod?.toMap(),
        "event_promotion": eventPromotion?.toMap(),
        "announcements": announcements?.toMap(),
        "conditional": conditional,
        "enddatetime_utc": enddatetimeUtc,
        "themes": themes == null
            ? null
            : List<dynamic>.from(themes?.map((x) => x) ?? []),
        "domain_information": domainInformation == null
            ? null
            : List<dynamic>.from(domainInformation?.map((x) => x) ?? []),
      };
}

class AccessMethod {
  AccessMethod({
    this.method,
    this.createdAt,
    this.employeeOnly,
  });

  String? method;
  DateTime? createdAt;
  bool? employeeOnly;

  factory AccessMethod.fromJson(String str) =>
      AccessMethod.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessMethod.fromMap(Map<String, dynamic> json) => AccessMethod(
        method: json["method"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        employeeOnly: json["employee_only"],
      );

  Map<String, dynamic> toMap() => {
        "method": method,
        "created_at": createdAt?.toIso8601String(),
        "employee_only": employeeOnly,
      };
}

class Announcements {
  Announcements();

  factory Announcements.fromJson(String str) =>
      Announcements.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Announcements.fromMap(Map<String, dynamic> json) => Announcements();

  Map<String, dynamic> toMap() => {};
}

class EventPromotion {
  EventPromotion({
    this.headline,
    this.additionalInfo,
    this.images,
  });

  String? headline;
  String? additionalInfo;
  EventPromotionImages? images;

  factory EventPromotion.fromJson(String str) =>
      EventPromotion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventPromotion.fromMap(Map<String, dynamic> json) => EventPromotion(
        headline: json["headline"],
        additionalInfo: json["additional_info"],
        images: json["images"] == null
            ? null
            : EventPromotionImages.fromMap(json["images"]),
      );

  Map<String, dynamic> toMap() => {
        "headline": headline,
        "additional_info": additionalInfo,
        "images": images?.toMap(),
      };
}

class EventPromotionImages {
  EventPromotionImages({
    this.icon,
    this.png2X,
    this.png3X,
  });

  String? icon;
  String? png2X;
  String? png3X;

  factory EventPromotionImages.fromJson(String str) =>
      EventPromotionImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventPromotionImages.fromMap(Map<String, dynamic> json) =>
      EventPromotionImages(
        icon: json["icon"],
        png2X: json["png@2x"],
        png3X: json["png@3x"],
      );

  Map<String, dynamic> toMap() => {
        "icon": icon,
        "png@2x": png2X,
        "png@3x": png3X,
      };
}

class Performer {
  Performer({
    this.type,
    this.name,
    this.image,
    this.id,
    this.images,
    this.divisions,
    this.hasUpcomingEvents,
    this.primary,
    this.stats,
    this.taxonomies,
    this.imageAttribution,
    this.url,
    this.score,
    this.slug,
    this.homeVenueId,
    this.shortName,
    this.numUpcomingEvents,
    this.colors,
    this.imageLicense,
    this.popularity,
    this.homeTeam,
    this.location,
    this.imageRightsMessage,
    this.awayTeam,
  });

  String? type;
  String? name;
  String? image;
  int? id;
  PerformerImages? images;
  List<Division>? divisions;
  bool? hasUpcomingEvents;
  bool? primary;
  PerformerStats? stats;
  List<Taxonomy>? taxonomies;
  String? imageAttribution;
  String? url;
  double? score;
  String? slug;
  int? homeVenueId;
  String? shortName;
  int? numUpcomingEvents;
  GeekColors? colors;
  String? imageLicense;
  int? popularity;
  bool? homeTeam;
  Location? location;
  String? imageRightsMessage;
  bool? awayTeam;

  factory Performer.fromJson(String str) => Performer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Performer.fromMap(Map<String, dynamic> json) => Performer(
        type: json["type"],
        name: json["name"],
        image: json["image"],
        id: json["id"],
        images: json["images"] == null
            ? null
            : PerformerImages.fromMap(json["images"]),
        divisions: json["divisions"] == null
            ? null
            : List<Division>.from(
                json["divisions"].map((x) => Division.fromMap(x))),
        hasUpcomingEvents: json["has_upcoming_events"],
        primary: json["primary"],
        stats: json["stats"] == null
            ? null
            : PerformerStats.fromMap(json["stats"]),
        taxonomies: json["taxonomies"] == null
            ? null
            : List<Taxonomy>.from(
                json["taxonomies"].map((x) => Taxonomy.fromMap(x))),
        imageAttribution: json["image_attribution"],
        url: json["url"],
        score: json["score"].toDouble(),
        slug: json["slug"],
        homeVenueId: json["home_venue_id"],
        shortName: json["short_name"],
        numUpcomingEvents: json["num_upcoming_events"],
        colors:
            json["colors"] == null ? null : GeekColors.fromMap(json["colors"]),
        imageLicense: json["image_license"],
        popularity: json["popularity"],
        homeTeam: json["home_team"],
        location: json["location"] == null
            ? null
            : Location.fromMap(json["location"]),
        imageRightsMessage: json["image_rights_message"],
        awayTeam: json["away_team"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "image": image,
        "id": id,
        "images": images?.toMap(),
        "divisions": divisions == null
            ? null
            : List<dynamic>.from(divisions?.map((x) => x.toMap()) ?? []),
        "has_upcoming_events": hasUpcomingEvents,
        "primary": primary,
        "stats": stats?.toMap(),
        "taxonomies": taxonomies == null
            ? null
            : List<dynamic>.from(taxonomies?.map((x) => x.toMap()) ?? []),
        "image_attribution": imageAttribution,
        "url": url,
        "score": score,
        "slug": slug,
        "home_venue_id": homeVenueId,
        "short_name": shortName,
        "num_upcoming_events": numUpcomingEvents,
        "colors": colors?.toMap(),
        "image_license": imageLicense,
        "popularity": popularity,
        "home_team": homeTeam,
        "location": location?.toMap(),
        "image_rights_message": imageRightsMessage,
        "away_team": awayTeam,
      };
}

class GeekColors {
  GeekColors({
    this.all,
    this.iconic,
    this.primary,
  });

  List<String>? all;
  String? iconic;
  List<String>? primary;

  factory GeekColors.fromJson(String str) =>
      GeekColors.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeekColors.fromMap(Map<String, dynamic> json) => GeekColors(
        all: json["all"] == null
            ? null
            : List<String>.from(json["all"].map((x) => x)),
        iconic: json["iconic"],
        primary: json["primary"] == null
            ? null
            : List<String>.from(json["primary"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "all":
            all == null ? null : List<dynamic>.from(all?.map((x) => x) ?? []),
        "iconic": iconic,
        "primary": primary == null
            ? null
            : List<dynamic>.from(primary?.map((x) => x) ?? []),
      };
}

class Division {
  Division({
    this.taxonomyId,
    this.shortName,
    this.displayName,
    this.displayType,
    this.divisionLevel,
    this.slug,
  });

  int? taxonomyId;
  String? shortName;
  String? displayName;
  String? displayType;
  int? divisionLevel;
  String? slug;

  factory Division.fromJson(String str) => Division.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Division.fromMap(Map<String, dynamic> json) => Division(
        taxonomyId: json["taxonomy_id"],
        shortName: json["short_name"],
        displayName: json["display_name"],
        displayType: json["display_type"],
        divisionLevel: json["division_level"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "taxonomy_id": taxonomyId,
        "short_name": shortName,
        "display_name": displayName,
        "display_type": displayType,
        "division_level": divisionLevel,
        "slug": slug,
      };
}

class PerformerImages {
  PerformerImages({
    this.huge,
  });

  String? huge;

  factory PerformerImages.fromJson(String str) =>
      PerformerImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PerformerImages.fromMap(Map<String, dynamic> json) => PerformerImages(
        huge: json["huge"],
      );

  Map<String, dynamic> toMap() => {
        "huge": huge,
      };
}

class Location {
  Location({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
      };
}

class PerformerStats {
  PerformerStats({
    this.eventCount,
  });

  int? eventCount;

  factory PerformerStats.fromJson(String str) =>
      PerformerStats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PerformerStats.fromMap(Map<String, dynamic> json) => PerformerStats(
        eventCount: json["event_count"],
      );

  Map<String, dynamic> toMap() => {
        "event_count": eventCount,
      };
}

class Taxonomy {
  Taxonomy({
    this.id,
    this.name,
    this.parentId,
    this.documentSource,
    this.rank,
  });

  int? id;
  String? name;
  int? parentId;
  DocumentSource? documentSource;
  int? rank;

  factory Taxonomy.fromJson(String str) => Taxonomy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Taxonomy.fromMap(Map<String, dynamic> json) => Taxonomy(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        documentSource: json["document_source"] == null
            ? null
            : DocumentSource.fromMap(json["document_source"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "document_source": documentSource?.toMap(),
        "rank": rank,
      };
}

class DocumentSource {
  DocumentSource({
    this.sourceType,
    this.generationType,
  });

  String? sourceType;
  String? generationType;

  factory DocumentSource.fromJson(String str) =>
      DocumentSource.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocumentSource.fromMap(Map<String, dynamic> json) => DocumentSource(
        sourceType: json["source_type"],
        generationType: json["generation_type"],
      );

  Map<String, dynamic> toMap() => {
        "source_type": sourceType,
        "generation_type": generationType,
      };
}

class EventStats {
  EventStats({
    this.listingCount,
    this.averagePrice,
    this.lowestPriceGoodDeals,
    this.lowestPrice,
    this.highestPrice,
    this.visibleListingCount,
    this.dqBucketCounts,
    this.medianPrice,
    this.lowestSgBasePrice,
    this.lowestSgBasePriceGoodDeals,
  });

  int? listingCount;
  int? averagePrice;
  int? lowestPriceGoodDeals;
  int? lowestPrice;
  int? highestPrice;
  int? visibleListingCount;
  List<int>? dqBucketCounts;
  int? medianPrice;
  int? lowestSgBasePrice;
  int? lowestSgBasePriceGoodDeals;

  factory EventStats.fromJson(String str) =>
      EventStats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventStats.fromMap(Map<String, dynamic> json) => EventStats(
        listingCount: json["listing_count"],
        averagePrice: json["average_price"],
        lowestPriceGoodDeals: json["lowest_price_good_deals"],
        lowestPrice: json["lowest_price"],
        highestPrice: json["highest_price"],
        visibleListingCount: json["visible_listing_count"],
        dqBucketCounts: json["dq_bucket_counts"] == null
            ? null
            : List<int>.from(json["dq_bucket_counts"].map((x) => x)),
        medianPrice: json["median_price"],
        lowestSgBasePrice: json["lowest_sg_base_price"],
        lowestSgBasePriceGoodDeals: json["lowest_sg_base_price_good_deals"],
      );

  Map<String, dynamic> toMap() => {
        "listing_count": listingCount,
        "average_price": averagePrice,
        "lowest_price_good_deals": lowestPriceGoodDeals,
        "lowest_price": lowestPrice,
        "highest_price": highestPrice,
        "visible_listing_count": visibleListingCount,
        "dq_bucket_counts": dqBucketCounts == null
            ? null
            : List<dynamic>.from(dqBucketCounts?.map((x) => x) ?? []),
        "median_price": medianPrice,
        "lowest_sg_base_price": lowestSgBasePrice,
        "lowest_sg_base_price_good_deals": lowestSgBasePriceGoodDeals,
      };
}

class Venue {
  Venue({
    this.state,
    this.nameV2,
    this.postalCode,
    this.name,
    this.links,
    this.timezone,
    this.url,
    this.score,
    this.location,
    this.address,
    this.country,
    this.hasUpcomingEvents,
    this.numUpcomingEvents,
    this.city,
    this.slug,
    this.extendedAddress,
    this.id,
    this.popularity,
    this.accessMethod,
    this.metroCode,
    this.capacity,
    this.displayLocation,
  });

  String? state;
  String? nameV2;
  String? postalCode;
  String? name;
  List<dynamic>? links;
  String? timezone;
  String? url;
  double? score;
  Location? location;
  String? address;
  String? country;
  bool? hasUpcomingEvents;
  int? numUpcomingEvents;
  String? city;
  String? slug;
  String? extendedAddress;
  int? id;
  int? popularity;
  AccessMethod? accessMethod;
  int? metroCode;
  int? capacity;
  String? displayLocation;

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
        state: json["state"],
        nameV2: json["name_v2"],
        postalCode: json["postal_code"],
        name: json["name"],
        links: json["links"] == null
            ? null
            : List<dynamic>.from(json["links"].map((x) => x)),
        timezone: json["timezone"],
        url: json["url"],
        score: json["score"].toDouble(),
        location: json["location"] == null
            ? null
            : Location.fromMap(json["location"]),
        address: json["address"],
        country: json["country"],
        hasUpcomingEvents: json["has_upcoming_events"],
        numUpcomingEvents: json["num_upcoming_events"],
        city: json["city"],
        slug: json["slug"],
        extendedAddress: json["extended_address"],
        id: json["id"],
        popularity: json["popularity"],
        accessMethod: json["access_method"] == null
            ? null
            : AccessMethod.fromMap(json["access_method"]),
        metroCode: json["metro_code"],
        capacity: json["capacity"],
        displayLocation: json["display_location"],
      );

  Map<String, dynamic> toMap() => {
        "state": state,
        "name_v2": nameV2,
        "postal_code": postalCode,
        "name": name,
        "links": links == null
            ? null
            : List<dynamic>.from(links?.map((x) => x) ?? []),
        "timezone": timezone,
        "url": url,
        "score": score,
        "location": location?.toMap(),
        "address": address,
        "country": country,
        "has_upcoming_events": hasUpcomingEvents,
        "num_upcoming_events": numUpcomingEvents,
        "city": city,
        "slug": slug,
        "extended_address": extendedAddress,
        "id": id,
        "popularity": popularity,
        "access_method": accessMethod?.toMap(),
        "metro_code": metroCode,
        "capacity": capacity,
        "display_location": displayLocation,
      };
}

class Meta {
  Meta({
    this.total,
    this.took,
    this.page,
    this.perPage,
    this.geolocation,
  });

  int? total;
  int? took;
  int? page;
  int? perPage;
  dynamic? geolocation;

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        total: json["total"],
        took: json["took"],
        page: json["page"],
        perPage: json["per_page"],
        geolocation: json["geolocation"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "took": took,
        "page": page,
        "per_page": perPage,
        "geolocation": geolocation,
      };
}
