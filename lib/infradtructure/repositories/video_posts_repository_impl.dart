import 'package:toktik/domian/datasources/video_post_datasource.dart';
import 'package:toktik/domian/entities/video_post.dart';
import 'package:toktik/domian/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  //* esperamos que nos envien los origen de datos
  final VideoPostDataSouce videoPostDataSouce;
  VideoPostsRepositoryImpl({required this.videoPostDataSouce});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  //* solamente los llamamos los origenes de datos
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDataSouce.getTrendingVideosByPage(page);
  }
}
