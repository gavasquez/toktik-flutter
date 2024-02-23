import 'package:toktik/domian/datasources/video_post_datasource.dart';
import 'package:toktik/domian/entities/video_post.dart';
import 'package:toktik/infradtructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDataSouce {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntiy())
        .toList();

    return newVideos;
  }
}
