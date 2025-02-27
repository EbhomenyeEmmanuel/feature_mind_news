/// status : "error"
/// code : "maximumResultsReached"
/// message : "You have requested too many results. Developer accounts are limited to a max of 100 results. You are trying to request results 0 to 200. Please upgrade to a paid plan if you need more results."

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
