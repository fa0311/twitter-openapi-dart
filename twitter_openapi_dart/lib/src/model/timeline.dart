import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dio/dio.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

part 'timeline.g.dart';

/// TimelineApiUtilsResponse
/// This class is used to store the cursor of the tweet list.

abstract class CursorApiUtilsResponse implements Built<CursorApiUtilsResponse, CursorApiUtilsResponseBuilder> {
  TimelineTimelineCursor? get bottom;
  TimelineTimelineCursor? get top;

  CursorApiUtilsResponse._();

  factory CursorApiUtilsResponse([void Function(CursorApiUtilsResponseBuilder) updates]) = _$CursorApiUtilsResponse;
}

/// ApiUtilsRaw
/// This class is used to store the listing Raw.

abstract class ApiUtilsRaw implements Built<ApiUtilsRaw, ApiUtilsRawBuilder> {
  Response get response;
  BuiltList<InstructionUnion> get instruction;
  BuiltList<TimelineAddEntry> get entry;

  ApiUtilsRaw._();

  factory ApiUtilsRaw([void Function(ApiUtilsRawBuilder) updates]) = _$ApiUtilsRaw;
}
