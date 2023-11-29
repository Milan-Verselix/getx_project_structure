

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../../assets.dart';
import '../../common/common_response.dart';
import '../local/app_pref.dart';
import 'base_api_service.dart';

class ApiClient {
  Dio dio = BaseApiService.dioClient;


  /// SIGN UP ///******
  ///
  Future<CommonResponse> signUp({
    required CommonResponse body
  }) async {
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpbml0MDIxMmhqaGdqOTI4QGdtYWlsLmNvbSIsImlkIjoiNjUxM2Q3OThkZTljZTAxZDFmYmE1MjNhIiwiaWF0IjoxNjk1Nzk5OTAxLCJleHAiOjE2OTU5NzI3MDF9.VQ0FNtrF5CspeEwodghPg4S_l0XS4jY2Oa1hjSw1x8g";
    Map<String, dynamic> header = {};

    final Response response = await dio.post(
      ApiPaths.signUp,
      options: Options(headers: header,
      ),
      data: body.toJson(),
    );

    return CommonResponse.fromJson(response.data);
  }

  /// CREATE PROFILE ///******
  ///
  Future<CommonResponse> createProfile({
    required CommonResponse body
  }) async {
    Map<String, dynamic> header = {"authorization": "Bearer ${AppPref.token}"};

    var formData = FormData.fromMap({
      "social_media_links1": "body.social_media_links1",
      "social_media_links2": "body.social_media_links2",
      "social_media_links3": "body.social_media_links3",
    });

    /// MULTIPART REQUEST DATA
    /*if (body.profile_image != "") {
      var file = await MultipartFile.fromFile(body.profile_image,
          filename: "profile_${body.profile_image}",
          contentType: MediaType("image", "profile_${body.profile_image}"));

      formData.files.add(MapEntry('profile_image', file));
    }*/

    // print("REQUEST :"+formData);

    final Response response = await dio.post(
      ApiPaths.login,
      options: Options(headers: header,
      ),
      data: formData,
    );

    print(response.data);

    return CommonResponse.fromJson(response.data);
  }

  /// LOGOUT ///******
  ///
  Future<CommonResponse> logout() async {
    Map<String, dynamic> header = {"authorization": "Bearer ${AppPref.token}"};

    final Response response = await dio.get(
      ApiPaths.login,
      options: Options(headers: header,),
    );

    print(response.data);

    return CommonResponse.fromJson(response.data);
  }
}