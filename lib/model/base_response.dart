class BaseResponse<T> {
  final bool status;
  final String message;
  final T? data;

  BaseResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseResponse.fromResponse(dynamic data) {
    return BaseResponse(
      status: data['status'],
      message: data['message'],
      data: data['data'],
    );
  }

  BaseResponse copyWith({
    bool? status,
    String? message,
    T? data,
  }) {
    return BaseResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? data,
    );
  }

  @override
  String toString() {
    return 'BaseResponse(status: $status, message: $message, data: $data)';
  }
}
