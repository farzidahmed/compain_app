import 'dart:convert';

class VerifyotpResponse {
    bool? status;
    String? message;
    int? code;
    String? token;

    VerifyotpResponse({
        this.status,
        this.message,
        this.code,
        this.token,
    });

    VerifyotpResponse copyWith({
        bool? status,
        String? message,
        int? code,
        String? token,
    }) => 
        VerifyotpResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            code: code ?? this.code,
            token: token ?? this.token,
        );

    factory VerifyotpResponse.fromRawJson(String str) => VerifyotpResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VerifyotpResponse.fromJson(Map<String, dynamic> json) => VerifyotpResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "token": token,
    };
}
