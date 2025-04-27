import 'dart:convert';

List<Api> apiFromJson(String str) => List<Api>.from(json.decode(str).map((x) => Api.fromJson(x)));

String apiToJson(List<Api> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Api {
    String movie;
    int year;
    DateTime releaseDate;
    String director;
    String character;
    String movieDuration;
    String timestamp;
    String fullLine;
    int currentWhoaInMovie;
    int totalWhoasInMovie;
    WhoaGrouping? whoaGrouping;
    String poster;
    Video video;
    String audio;

    Api({
        required this.movie,
        required this.year,
        required this.releaseDate,
        required this.director,
        required this.character,
        required this.movieDuration,
        required this.timestamp,
        required this.fullLine,
        required this.currentWhoaInMovie,
        required this.totalWhoasInMovie,
        required this.whoaGrouping,
        required this.poster,
        required this.video,
        required this.audio,
    });

    factory Api.fromJson(Map<String, dynamic> json) => Api(
        movie: json["movie"],
        year: json["year"],
        releaseDate: DateTime.parse(json["release_date"]),
        director: json["director"],
        character: json["character"],
        movieDuration: json["movie_duration"],
        timestamp: json["timestamp"],
        fullLine: json["full_line"],
        currentWhoaInMovie: json["current_whoa_in_movie"],
        totalWhoasInMovie: json["total_whoas_in_movie"],
        whoaGrouping: json["whoa_grouping"] == null ? null : WhoaGrouping.fromJson(json["whoa_grouping"]),
        poster: json["poster"],
        video: Video.fromJson(json["video"]),
        audio: json["audio"],
    );

    Map<String, dynamic> toJson() => {
        "movie": movie,
        "year": year,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "director": director,
        "character": character,
        "movie_duration": movieDuration,
        "timestamp": timestamp,
        "full_line": fullLine,
        "current_whoa_in_movie": currentWhoaInMovie,
        "total_whoas_in_movie": totalWhoasInMovie,
        "whoa_grouping": whoaGrouping?.toJson(),
        "poster": poster,
        "video": video.toJson(),
        "audio": audio,
    };
}

class Video {
    String the1080P;
    String the720P;
    String the480P;
    String the360P;

    Video({
        required this.the1080P,
        required this.the720P,
        required this.the480P,
        required this.the360P,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        the1080P: json["1080p"],
        the720P: json["720p"],
        the480P: json["480p"],
        the360P: json["360p"],
    );

    Map<String, dynamic> toJson() => {
        "1080p": the1080P,
        "720p": the720P,
        "480p": the480P,
        "360p": the360P,
    };
}

class WhoaGrouping {
    int movieWhoaGroupIndex;
    int currentWhoaInGroup;
    int totalWhoasInGroup;

    WhoaGrouping({
        required this.movieWhoaGroupIndex,
        required this.currentWhoaInGroup,
        required this.totalWhoasInGroup,
    });

    factory WhoaGrouping.fromJson(Map<String, dynamic> json) => WhoaGrouping(
        movieWhoaGroupIndex: json["movie_whoa_group_index"],
        currentWhoaInGroup: json["current_whoa_in_group"],
        totalWhoasInGroup: json["total_whoas_in_group"],
    );

    Map<String, dynamic> toJson() => {
        "movie_whoa_group_index": movieWhoaGroupIndex,
        "current_whoa_in_group": currentWhoaInGroup,
        "total_whoas_in_group": totalWhoasInGroup,
    };
}
