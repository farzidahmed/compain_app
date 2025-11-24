import 'dart:convert';

class GetAreaResponse {
    bool? status;
    int? code;
    String? message;
    List<String>? polishStation;

    GetAreaResponse({
        this.status,
        this.code,
        this.message,
        this.polishStation,
    });

    GetAreaResponse copyWith({
        bool? status,
        int? code,
        String? message,
        List<String>? polishStation,
    }) => 
        GetAreaResponse(
            status: status ?? this.status,
            code: code ?? this.code,
            message: message ?? this.message,
            polishStation: polishStation ?? this.polishStation,
        );

    factory GetAreaResponse.fromRawJson(String str) => GetAreaResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetAreaResponse.fromJson(Map<String, dynamic> json) => GetAreaResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        polishStation: json["polish_station"] == null ? [] : List<String>.from(json["polish_station"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "polish_station": polishStation == null ? [] : List<dynamic>.from(polishStation!.map((x) => x)),
    };
}
