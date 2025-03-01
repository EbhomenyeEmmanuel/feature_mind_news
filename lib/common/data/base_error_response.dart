class BaseErrorResponse {
  BaseErrorResponse({
    this.status,
    this.code,
    this.message,
  });

  factory BaseErrorResponse.fromJson(dynamic json) => BaseErrorResponse(
      status: json['status'] ?? '',
      code: json['code'] ?? '',
      message: json['message'] ?? 'An error has occurred');

  final String? status;
  final String? code;
  final String? message;

  BaseErrorResponse copyWith({
    String? status,
    String? code,
    String? message,
  }) =>
      BaseErrorResponse(
        status: status ?? status,
        code: code ?? code,
        message: message ?? message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}
