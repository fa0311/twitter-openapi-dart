import 'dart:convert';
import 'package:twitter_openapi_dart/src/api_util.dart';
import 'package:twitter_openapi_dart/src/model/model.dart';
import 'package:twitter_openapi_dart/src/util/type.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

class UserListApiUtils {
  final UserListApi api;
  final Future<Map<String, dynamic>> flag;

  const UserListApiUtils(this.api, this.flag);

  Future<UserListApiUtilsResponse> request<T>({
    required ApiFunction<T> apiFn,
    required ConvertTnstructionsFunction<T> convertFn,
    required String key,
    required Map<String, dynamic> param,
  }) async {
    assert((await flag)[key] != null);
    final response = await apiFn(
      variables: jsonEncode((await flag)[key]!["Variables"]..addAll(param)),
      features: jsonEncode((await flag)[key]!["Features"]),
    );
    final entry = instructionToEntry(convertFn(response.data as T));
    final userList = entriesConverter<TimelineUser>(entry, TimelineUser).expand((e) => e);
    final data = userList.map((user) => buildUserResponse(user)).toList();
    return UserListApiUtilsResponse(
      (e) => e
        ..data = data
        ..cursor = entriesCursor(entry).toBuilder(),
    );
  }

  Future<UserListApiUtilsResponse> getFollowers({
    required String userId,
    String? cursor,
    int? count,
    Map<String, dynamic>? extraParam,
  }) async {
    final param = {
      "userId": userId,
      if (count != null) "count": count,
      if (cursor != null) "cursor": cursor,
      ...?extraParam,
    };
    final response = await request(
      apiFn: api.getFollowers,
      convertFn: (e) => e.data.user.result.timeline.timeline.instructions,
      key: 'Followers',
      param: param,
    );
    return response;
  }

  Future<UserListApiUtilsResponse> getFollowing({
    required String userId,
    String? cursor,
    int? count,
    Map<String, dynamic>? extraParam,
  }) async {
    final param = {
      "userId": userId,
      if (count != null) "count": count,
      if (cursor != null) "cursor": cursor,
      ...?extraParam,
    };
    final response = await request(
      apiFn: api.getFollowing,
      convertFn: (e) => e.data.user.result.timeline.timeline.instructions,
      key: 'Following',
      param: param,
    );
    return response;
  }
}
