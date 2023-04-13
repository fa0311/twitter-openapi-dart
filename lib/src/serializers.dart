//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:twitter_openapi_dart/src/date_serializer.dart';
import 'package:twitter_openapi_dart/src/model/date.dart';

import 'package:twitter_openapi_dart/src/model/content_entry_type.dart';
import 'package:twitter_openapi_dart/src/model/content_item_type.dart';
import 'package:twitter_openapi_dart/src/model/content_union.dart';
import 'package:twitter_openapi_dart/src/model/home_timeline_data.dart';
import 'package:twitter_openapi_dart/src/model/home_timeline_home.dart';
import 'package:twitter_openapi_dart/src/model/home_timeline_urt.dart';
import 'package:twitter_openapi_dart/src/model/instruction_type.dart';
import 'package:twitter_openapi_dart/src/model/instruction_union.dart';
import 'package:twitter_openapi_dart/src/model/item_content.dart';
import 'package:twitter_openapi_dart/src/model/item_result.dart';
import 'package:twitter_openapi_dart/src/model/list_tweets_timeline.dart';
import 'package:twitter_openapi_dart/src/model/list_tweets_timeline_data.dart';
import 'package:twitter_openapi_dart/src/model/list_tweets_timeline_list.dart';
import 'package:twitter_openapi_dart/src/model/list_tweets_timeline_response.dart';
import 'package:twitter_openapi_dart/src/model/timeline_add_entries.dart';
import 'package:twitter_openapi_dart/src/model/timeline_add_entry.dart';
import 'package:twitter_openapi_dart/src/model/timeline_response.dart';
import 'package:twitter_openapi_dart/src/model/timeline_timeline_cursor.dart';
import 'package:twitter_openapi_dart/src/model/timeline_timeline_item.dart';
import 'package:twitter_openapi_dart/src/model/timeline_timeline_module.dart';
import 'package:twitter_openapi_dart/src/model/tweet.dart';
import 'package:twitter_openapi_dart/src/model/tweet_edit_control.dart';
import 'package:twitter_openapi_dart/src/model/tweet_edit_prespective.dart';
import 'package:twitter_openapi_dart/src/model/tweet_legacy.dart';
import 'package:twitter_openapi_dart/src/model/tweet_union.dart';
import 'package:twitter_openapi_dart/src/model/tweet_views.dart';
import 'package:twitter_openapi_dart/src/model/tweet_with_visibility_results.dart';
import 'package:twitter_openapi_dart/src/model/type_name.dart';
import 'package:twitter_openapi_dart/src/model/user.dart';
import 'package:twitter_openapi_dart/src/model/user_legacy.dart';
import 'package:twitter_openapi_dart/src/model/user_result_core.dart';
import 'package:twitter_openapi_dart/src/model/user_results.dart';
import 'package:twitter_openapi_dart/src/model/user_union.dart';

part 'serializers.g.dart';

@SerializersFor([
  ContentEntryType,
  ContentItemType,
  ContentUnion,
  HomeTimelineData,
  HomeTimelineHome,
  HomeTimelineUrt,
  InstructionType,
  InstructionUnion,
  ItemContent,
  ItemResult,
  ListTweetsTimeline,
  ListTweetsTimelineData,
  ListTweetsTimelineList,
  ListTweetsTimelineResponse,
  TimelineAddEntries,
  TimelineAddEntry,
  TimelineResponse,
  TimelineTimelineCursor,
  TimelineTimelineItem,
  TimelineTimelineModule,
  Tweet,
  TweetEditControl,
  TweetEditPrespective,
  TweetLegacy,
  TweetUnion,
  TweetViews,
  TweetWithVisibilityResults,
  TypeName,
  User,
  UserLegacy,
  UserResultCore,
  UserResults,
  UserUnion,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
