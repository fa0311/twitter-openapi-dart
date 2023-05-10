import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';
import 'package:dio/dio.dart';

import 'dart:io';
import 'dart:convert';

class HeaderAuth extends Interceptor {
  static String ct0 = "ct0";
  static String authToken = "auth_token";

  Map<String, String> cookies = {};

  Future<void> readCookies(String path) async {
    final file = new File(path);
    cookies = (json.decode(await file.readAsString()) as Map).cast<String, String>();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(<String, String>{
      "x-csrf-token": cookies.entries.firstWhere((e) => e.key == HeaderAuth.ct0).value,
      "cookie": cookies.entries.fold("", (a, b) => "${a}${b.key}=${b.value};"),
    });
    return handler.next(options);
  }
}

bool contentTest(BuiltList<InstructionUnion> instructions) {
  final item = instructions.expand((e) => e.oneOf.isType(TimelineAddEntries) ? [e.oneOf.value as TimelineAddEntries] : <TimelineAddEntries>[]).first;

  final timelineItem =
      item.entries.expand((e) => e.content.oneOf.isType(TimelineTimelineItem) ? [e.content.oneOf.value as TimelineTimelineItem] : <TimelineTimelineItem>[]);

  final timelineModule = item.entries
      .expand((e) => e.content.oneOf.isType(TimelineTimelineModule) ? [e.content.oneOf.value as TimelineTimelineModule] : <TimelineTimelineModule>[]);
  print(timelineItem.length + timelineModule.length);
  return (timelineItem.length + timelineModule.length) > 0;
}

void main() async {
  final auth = HeaderAuth();
  await auth.readCookies("test/cookies.json");
  final client = TwitterOpenapiDartGenerated(
    dio: Dio(BaseOptions(
      baseUrl: TwitterOpenapiDartGenerated.basePath,
    )),
    interceptors: [
      auth,
      LogInterceptor(),
    ],
  );

  final file = new File("twitter-openapi/src/config/placeholder.json");
  final config = (json.decode(await file.readAsString()) as Map).cast<String, dynamic>();
  test('getHomeTimeline', () async {
    final response = await client.getTweetApi().getHomeTimeline(
          variables: jsonEncode(config["HomeTimeline"]!["variables"]),
          features: jsonEncode(config["HomeTimeline"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.home.homeTimelineUrt.instructions), true);
  });

  test('getHomeLatestTimeline', () async {
    final response = await client.getTweetApi().getHomeLatestTimeline(
          variables: jsonEncode(config["HomeLatestTimeline"]!["variables"]),
          features: jsonEncode(config["HomeLatestTimeline"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.home.homeTimelineUrt.instructions), true);
  });

  test('getListLatestTweetsTimeline', () async {
    final response = await client.getTweetApi().getListLatestTweetsTimeline(
          variables: jsonEncode(config["ListLatestTweetsTimeline"]!["variables"]),
          features: jsonEncode(config["ListLatestTweetsTimeline"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.list.tweetsTimeline.timeline.instructions), true);
  });

  test('getUserByScreenName', () async {
    const name = "elonmusk";
    final response = await client.getUserApi().getUserByScreenName(
          variables: jsonEncode(config["UserByScreenName"]!["variables"]),
          features: jsonEncode(config["UserByScreenName"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(response.data!.data.user.result.legacy.screenName, name);
  });

  test('ProfileSpotlightsQuery', () async {
    final response = await client.getDefaultApi().getProfileSpotlightsQuery(
          variables: jsonEncode(config["UserByScreenName"]!["variables"]),
          features: jsonEncode(config["UserByScreenName"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(response.data!.data.userResultByScreenName.result.legacy.screenName, "elonmusk");
  });

  test('getUserTweets', () async {
    final response = await client.getTweetApi().getUserTweets(
          variables: jsonEncode(config["UserTweets"]!["variables"]),
          features: jsonEncode(config["UserTweets"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timelineV2.timeline.instructions), true);
  });

  test('getUserTweetsAndReplies', () async {
    final response = await client.getTweetApi().getUserTweetsAndReplies(
          variables: jsonEncode(config["UserTweetsAndReplies"]!["variables"]),
          features: jsonEncode(config["UserTweetsAndReplies"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timelineV2.timeline.instructions), true);
  });

  test('getUserMedia', () async {
    final response = await client.getTweetApi().getUserMedia(
          variables: jsonEncode(config["UserMedia"]!["variables"]),
          features: jsonEncode(config["UserMedia"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timelineV2.timeline.instructions), true);
  });

  test('getLikes', () async {
    final response = await client.getTweetApi().getLikes(
          variables: jsonEncode(config["Likes"]!["variables"]),
          features: jsonEncode(config["Likes"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timelineV2.timeline.instructions), true);
  });

  test('getBookmarks', () async {
    final response = await client.getTweetApi().getBookmarks(
          variables: jsonEncode(config["Bookmarks"]!["variables"]),
          features: jsonEncode(config["Bookmarks"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.bookmarkTimelineV2.timeline.instructions), true);
  });

  test('getTweetDetail', () async {
    final response = await client.getTweetApi().getTweetDetail(
          variables: jsonEncode(config["TweetDetail"]!["variables"]),
          features: jsonEncode(config["TweetDetail"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.threadedConversationWithInjectionsV2.instructions), true);
  });
  test('getTweetDetail2', () async {
    final response = await client.getTweetApi().getTweetDetail(
          variables: jsonEncode(config["TweetDetail"]!["variables"]..addAll({"focalTweetId": "1349265937392930816"})),
          features: jsonEncode(config["TweetDetail"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.threadedConversationWithInjectionsV2.instructions), true);
  });

  test('getFollowers', () async {
    final response = await client.getUserListApi().getFollowing(
          variables: jsonEncode(config["Followers"]!["variables"]),
          features: jsonEncode(config["Followers"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timeline.timeline.instructions), true);
  });

  test('getFollowing', () async {
    final response = await client.getUserListApi().getFollowing(
          variables: jsonEncode(config["Following"]!["variables"]),
          features: jsonEncode(config["Following"]!["features"]),
        );
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    expect(contentTest(response.data!.data.user.result.timeline.timeline.instructions), true);
  });

  test('tweet', () async {
    final time = DateTime.now().toIso8601String();
    final response = await client.getPostApi().postCreateTweet(
          postCreateTweetRequest: PostCreateTweetRequest(
            (e) => e
              ..variables = PostCreateTweetRequestVariables((e) => e..tweetText = "Test[${time}]").toBuilder()
              ..features = PostCreateTweetRequestFeatures((e) => e).toBuilder(),
          ),
        );
    final tweetId = response.data!.data.createTweet.tweetResults.result.restId;
    print(response);
    print(response.data!.data.createTweet.tweetResults.result.restId);
    expect(response.statusCode, 200);
    expect(response.data == null, false);
    final response2 = await client.getPostApi().postDeleteTweet(
          postDeleteTweetRequest: PostDeleteTweetRequest(
            (e) => e..variables = PostDeleteTweetRequestVariables((e) => e..tweetId = tweetId).toBuilder(),
          ),
        );
    print(response2);
    expect(response2.statusCode, 200);
    expect(response2.data == null, false);
  });

  test('createRetweet', () async {
    final response = await client.getPostApi().postCreateRetweet(
          postCreateRetweetRequest: PostCreateRetweetRequest(
            (e) => e..variables = PostDeleteTweetRequestVariables().toBuilder(),
          ),
        );
    print(response);
    expect(response.statusCode, 200);
    expect(response.data == null, false);
  });
  test('deleteRetweet', () async {
    final response = await client.getPostApi().postDeleteRetweet(
          postDeleteRetweetRequest: PostDeleteRetweetRequest(
            (e) => e..variables = PostDeleteRetweetRequestVariables().toBuilder(),
          ),
        );
    print(response);
    expect(response.statusCode, 200);
    expect(response.data == null, false);
  });

  test('favoriteTweet', () async {
    final response = await client.getPostApi().postFavoriteTweet(
          postFavoriteTweetRequest: PostFavoriteTweetRequest(
            (e) => e..variables = PostDeleteTweetRequestVariables().toBuilder(),
          ),
        );
    print(response);
    expect(response.statusCode, 200);
    expect(response.data == null, false);
  });
  test('favoriteTweet', () async {
    final response = await client.getPostApi().postUnfavoriteTweet(
          postUnfavoriteTweetRequest: PostUnfavoriteTweetRequest(
            (e) => e..variables = PostDeleteTweetRequestVariables().toBuilder(),
          ),
        );
    print(response);
    expect(response.statusCode, 200);
    expect(response.data == null, false);
  });
  test('createFriendships', () async {
    final response = await client.getV11PostApi().postCreateFriendships();
    print(response);
    expect(response.statusCode, 200);
  });
}
