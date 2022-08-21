import 'package:digitaltestproject/domain/geeks_event/data_sources/geeks_event_remote_data_source.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_argument_data.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_data.dart';

class GeeksEventMockDataSourceImpl implements GeeksEventDataSource {
  GeeksEventMockDataSourceImpl();
  static String getMockData() {
    return _responseMock;
  }

  /// Mock response given to The mobile screen.
  /// [Future<GeeksEventData>] to handle the Failure or result data.
  @override
  Future<GeeksEventData> getEventData(
      {required GeeksEventArgumentData argumentModel}) async {
    await Future.delayed(const Duration(seconds: 2));
    return GeeksEventData.fromJson(_responseMock);
  }
}

var _responseMock = """
{
  "events": [
    {
      "type": "mlb",
      "id": 5464816,
      "datetime_utc": "2022-08-21T18:10:00",
      "venue": {
        "state": "MN",
        "name_v2": "Target Field",
        "postal_code": "55403",
        "name": "Target Field",
        "links": [],
        "timezone": "America/Chicago",
        "url": "https://seatgeek.com/venues/target-field/tickets",
        "score": 0.62,
        "location": {
          "lat": 44.9817,
          "lon": -93.2776
        },
        "address": "1 Twins Way",
        "country": "US",
        "has_upcoming_events": true,
        "num_upcoming_events": 34,
        "city": "Minneapolis",
        "slug": "target-field",
        "extended_address": "Minneapolis, MN 55403",
        "id": 3712,
        "popularity": 0,
        "access_method": {
          "method": "PDF417",
          "created_at": "2015-07-05T00:00:00Z",
          "employee_only": false
        },
        "metro_code": 613,
        "capacity": 40000,
        "display_location": "Minneapolis, MN"
      },
      "datetime_tbd": false,
      "performers": [
        {
          "type": "mlb",
          "name": "Minnesota Twins",
          "image": "https://seatgeek.com/images/performers-landscape/minnesota-twins-49e40b/19/huge.jpg",
          "id": 19,
          "images": {
            "huge": "https://seatgeek.com/images/performers-landscape/minnesota-twins-49e40b/19/huge.jpg"
          },
          "divisions": [
            {
              "taxonomy_id": 1010100,
              "short_name": null,
              "display_name": "American League",
              "display_type": "League",
              "division_level": 1,
              "slug": null
            },
            {
              "taxonomy_id": 1010100,
              "short_name": "AL Central",
              "display_name": "American League Central",
              "display_type": "Division",
              "division_level": 2,
              "slug": "american-league-central"
            }
          ],
          "has_upcoming_events": true,
          "primary": true,
          "stats": {
            "event_count": 58
          },
          "taxonomies": [
            {
              "id": 1000000,
              "name": "sports",
              "parent_id": null,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 0
            },
            {
              "id": 1010000,
              "name": "baseball",
              "parent_id": 1000000,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 0
            },
            {
              "id": 1010100,
              "name": "mlb",
              "parent_id": 1010000,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 3
            }
          ],
          "image_attribution": "https://www.flickr.com/photos/ekilby/4925516994/in/photolist-8vfyAN-7jsWXe-8Co8gh-8vfys1-9EbSVm-8vcvYn-a3uCNw-pwwc2F-djq9aM-jKSkKf-8vcvRc-jGTfZi-72vcw-bNrHnM-bzx4CU-8FGazW-sLxxSK-sLxBX8-nptEK4-nFWUDS-nFFouF-sLmgaQ-nFFiUD-n6ga3g-sLmfe1-stXtuN-nFWZaW-nDVC5L-66L7Mk-sLxCXz-7TBVHC-nHDWy4-nHDUon-nHDUrt-nFRdFL-nFzBi8-nFRcNJ-nFzBZD-nFRe1d-nHDVhg-nHDWNT-nFEMML-npod4B-npo58E-nFzCxn-nFRcEY-nFEMzm-npo5fo-nHDUPH-npnQW8",
          "url": "https://seatgeek.com/minnesota-twins-tickets",
          "score": 0.46,
          "slug": "minnesota-twins",
          "home_venue_id": 3712,
          "short_name": "Twins",
          "num_upcoming_events": 58,
          "colors": {
            "all": [
              "#002B5C",
              "#D31145",
              "#002B5C"
            ],
            "iconic": "#002B5C",
            "primary": [
              "#002B5C",
              "#D31145"
            ]
          },
          "image_license": "https://creativecommons.org/licenses/by-sa/2.0/",
          "popularity": 0,
          "home_team": true,
          "location": {
            "lat": 44.9817,
            "lon": -93.2776
          },
          "image_rights_message": "[This image](https://www.flickr.com/photos/ekilby/4925516994/in/photolist-8vfyAN-7jsWXe-8Co8gh-8vfys1-9EbSVm-8vcvYn-a3uCNw-pwwc2F-djq9aM-jKSkKf-8vcvRc-jGTfZi-72vcw-bNrHnM-bzx4CU-8FGazW-sLxxSK-sLxBX8-nptEK4-nFWUDS-nFFouF-sLmgaQ-nFFiUD-n6ga3g-sLmfe1-stXtuN-nFWZaW-nDVC5L-66L7Mk-sLxCXz-7TBVHC-nHDWy4-nHDUon-nHDUrt-nFRdFL-nFzBi8-nFRcNJ-nFzBZD-nFRe1d-nHDVhg-nHDWNT-nFEMML-npod4B-npo58E-nFzCxn-nFRcEY-nFEMzm-npo5fo-nHDUPH-npnQW8) is available through [Creative Commons](https://creativecommons.org/licenses/by-sa/2.0/) (@ekilby - Flickr) and has been modified from the original. Email [images@seatgeek.com](mailto:images@seatgeek.com) with any questions."
        },
        {
          "type": "mlb",
          "name": "Texas Rangers",
          "image": "https://seatgeek.com/images/performers-landscape/texas-rangers-f6004e/16/huge.jpg",
          "id": 16,
          "images": {
            "huge": "https://seatgeek.com/images/performers-landscape/texas-rangers-f6004e/16/huge.jpg"
          },
          "divisions": [
            {
              "taxonomy_id": 1010100,
              "short_name": null,
              "display_name": "American League",
              "display_type": "League",
              "division_level": 1,
              "slug": null
            },
            {
              "taxonomy_id": 1010100,
              "short_name": "AL West",
              "display_name": "American League West",
              "display_type": "Division",
              "division_level": 2,
              "slug": "american-league-west"
            }
          ],
          "has_upcoming_events": true,
          "stats": {
            "event_count": 42
          },
          "taxonomies": [
            {
              "id": 1000000,
              "name": "sports",
              "parent_id": null,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 0
            },
            {
              "id": 1010000,
              "name": "baseball",
              "parent_id": 1000000,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 0
            },
            {
              "id": 1010100,
              "name": "mlb",
              "parent_id": 1010000,
              "document_source": {
                "source_type": "ELASTIC",
                "generation_type": "FULL"
              },
              "rank": 3
            }
          ],
          "image_attribution": "SeatGeek - VFS Photo",
          "url": "https://seatgeek.com/texas-rangers-tickets",
          "score": 0.47,
          "slug": "texas-rangers",
          "home_venue_id": 487468,
          "short_name": "Rangers",
          "num_upcoming_events": 42,
          "colors": {
            "all": [
              "#003278",
              "#C0111F",
              "#003278"
            ],
            "iconic": "#003278",
            "primary": [
              "#003278",
              "#C0111F"
            ]
          },
          "image_license": "SeatGeek - VFS Photo",
          "popularity": 0,
          "away_team": true,
          "location": {
            "lat": 32.7472,
            "lon": -97.0838
          },
          "image_rights_message": ""
        }
      ],
      "is_open": false,
      "links": [],
      "datetime_local": "2022-08-21T13:10:00",
      "time_tbd": false,
      "short_title": "Rangers at Twins",
      "visible_until_utc": "2022-08-21T22:10:00",
      "stats": {
        "listing_count": 258,
        "average_price": 84,
        "lowest_price_good_deals": 29,
        "lowest_price": 29,
        "highest_price": 309,
        "visible_listing_count": 257,
        "dq_bucket_counts": [
          22,
          90,
          40,
          31,
          30,
          28,
          21,
          0
        ],
        "median_price": 81,
        "lowest_sg_base_price": 17,
        "lowest_sg_base_price_good_deals": 17
      },
      "taxonomies": [
        {
          "id": 1000000,
          "name": "sports",
          "parent_id": null,
          "rank": 0
        },
        {
          "id": 1010000,
          "name": "baseball",
          "parent_id": 1000000,
          "rank": 0
        },
        {
          "id": 1010100,
          "name": "mlb",
          "parent_id": 1010000,
          "rank": 3
        }
      ],
      "url": "https://seatgeek.com/rangers-at-twins-tickets/8-21-2022-minneapolis-minnesota-target-field/mlb/5464816",
      "score": 0.74,
      "announce_date": "2021-08-04T00:00:00",
      "created_at": "2021-08-04T20:44:32",
      "date_tbd": false,
      "title": "Texas Rangers at Minnesota Twins",
      "popularity": 0.899,
      "description": "",
      "status": "normal",
      "access_method": {
        "method": "PDF417",
        "created_at": "2015-07-05T00:00:00Z",
        "employee_only": false
      },
      "event_promotion": {
        "headline": "Twins Hall of Fame Pin Collectible Set",
        "additional_info": "First 5,000 fans",
        "images": {
          "icon": "https://seatgeek.com/images/event_promotion/f79db8d0-4200-449a-9bef-ad63c9d39b1b/icon.svg",
          "png@2x": "https://seatgeek.com/images/event_promotion/f79db8d0-4200-449a-9bef-ad63c9d39b1b/png_2x.png",
          "png@3x": "https://seatgeek.com/images/event_promotion/f79db8d0-4200-449a-9bef-ad63c9d39b1b/png_3x.png"
        }
      },
      "announcements": {},
      "conditional": false,
      "enddatetime_utc": null,
      "themes": [],
      "domain_information": []
    }
  ],
  "meta": {
    "total": 42,
    "took": 8,
    "page": 1,
    "per_page": 10,
    "geolocation": null
  }
}
""";
