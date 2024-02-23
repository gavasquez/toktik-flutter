import 'package:toktik/domian/entities/video_post.dart';

//* se pone abstract porque no queremos instancias de esta clase
abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
