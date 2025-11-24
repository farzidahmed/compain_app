import 'dart:convert';

class AreaResponse {
    String? status;
    int? code;
    String? message;
    String? polishStation;
    List<String>? words;

    AreaResponse({
        this.status,
        this.code,
        this.message,
        this.polishStation,
        this.words,
    });

    AreaResponse copyWith({
        String? status,
        int? code,
        String? message,
        String? polishStation,
        List<String>? words,
    }) => 
        AreaResponse(
            status: status ?? this.status,
            code: code ?? this.code,
            message: message ?? this.message,
            polishStation: polishStation ?? this.polishStation,
            words: words ?? this.words,
        );

    factory AreaResponse.fromRawJson(String str) => AreaResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AreaResponse.fromJson(Map<String, dynamic> json) => AreaResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        polishStation: json["polish_station"],
        words: json["words"] == null ? [] : List<String>.from(json["words"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "polish_station": polishStation,
        "words": words == null ? [] : List<dynamic>.from(words!.map((x) => x)),
    };
}
