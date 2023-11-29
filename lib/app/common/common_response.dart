


class CommonResponse {
  CommonResponse({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;

  factory CommonResponse.fromJson(Map<String, dynamic> json){
    return CommonResponse(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };

}
