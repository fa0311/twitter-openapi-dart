import 'package:built_collection/built_collection.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';
import 'package:dio/dio.dart';

class PostApiUtils {
  final PostApi api;

  const PostApiUtils(this.api);

  /// postCreateTweet
  /// Create a Tweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [tweetText] The text of your Tweet.
  ///
  /// Returns a [Future] containing a [Response] with a [CreateTweetResponse] as data.
  /// * [CreateTweetResponse] contains a [Tweet] as data.

  Future<Response<CreateTweetResponse>> postCreateTweet({required String tweetText}) async {
    final variables = PostCreateTweetRequestVariables(
      (e) => e
        ..tweetText = tweetText
        ..semanticAnnotationIds = ListBuilder()
        ..media = PostCreateTweetRequestVariablesMedia((e) => e..mediaEntities = ListBuilder()).toBuilder(),
    );

    final response = await api.postCreateTweet(
      postCreateTweetRequest: PostCreateTweetRequest(
        (e) => e
          ..variables = variables.toBuilder()
          ..features = PostCreateTweetRequestFeatures((e) => e).toBuilder(),
      ),
    );
    return response;
  }

  /// postDeleteTweet
  /// Delete a Tweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [tweetId] The ID of the Tweet that you would like to delete.
  ///
  /// Returns a [Future] containing a [Response] with a [DeleteTweetResponse] as data.

  Future<Response<DeleteTweetResponse>> postDeleteTweet({required String tweetId}) async {
    final response = await api.postDeleteTweet(
      postDeleteTweetRequest: PostDeleteTweetRequest(
        (e) => e..variables = PostDeleteTweetRequestVariables((e) => e.tweetId = tweetId).toBuilder(),
      ),
    );
    return response;
  }

  /// postCreateRetweet
  /// Retweet a Tweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [tweetId] The ID of the Tweet that you would like to retweet.
  ///
  /// Returns a [Future] containing a [Response] with a [CreateRetweetResponse] as data.

  Future<Response<CreateRetweetResponse>> postCreateRetweet({required String tweetId}) async {
    final response = await api.postCreateRetweet(
      postCreateRetweetRequest: PostCreateRetweetRequest(
        (e) => e..variables = PostDeleteTweetRequestVariables((e) => e.tweetId = tweetId).toBuilder(),
      ),
    );
    return response;
  }

  /// postDeleteRetweet
  /// Delete a Retweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [sourceTweetId] The ID of the source Tweet of the Retweet that you would like to delete.
  ///
  /// Returns a [Future] containing a [Response] with a [DeleteRetweetResponse] as data.

  Future<Response<DeleteRetweetResponse>> postDeleteRetweet({required String sourceTweetId}) async {
    final response = await api.postDeleteRetweet(
      postDeleteRetweetRequest: PostDeleteRetweetRequest(
        (e) => e..variables = PostDeleteRetweetRequestVariables((e) => e.sourceTweetId = sourceTweetId).toBuilder(),
      ),
    );
    return response;
  }

  /// postFavoriteTweet
  /// Favorite a Tweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [tweetId] The ID of the Tweet that you would like to favorite.
  ///
  /// Returns a [Future] containing a [Response] with a [FavoriteTweetResponseData] as data.

  Future<Response<FavoriteTweetResponseData>> postFavoriteTweet({required String tweetId}) async {
    final response = await api.postFavoriteTweet(
      postFavoriteTweetRequest: PostFavoriteTweetRequest(
        (e) => e..variables = PostDeleteTweetRequestVariables((e) => e.tweetId = tweetId).toBuilder(),
      ),
    );
    return response;
  }

  /// postUnfavoriteTweet
  /// Unfavorite a Tweet.
  /// Note: Can only be used while logged in.
  ///
  /// Parameters:
  /// * [tweetId] The ID of the Tweet that you would like to unfavorite.
  ///
  /// Returns a [Future] containing a [Response] with a [UnfavoriteTweetResponseData] as data.

  Future<Response<UnfavoriteTweetResponseData>> postUnfavoriteTweet({required String tweetId}) async {
    final response = await api.postUnfavoriteTweet(
      postUnfavoriteTweetRequest: PostUnfavoriteTweetRequest(
        (e) => e..variables = PostDeleteTweetRequestVariables((e) => e.tweetId = tweetId).toBuilder(),
      ),
    );
    return response;
  }
}
