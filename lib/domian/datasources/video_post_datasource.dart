import 'package:toktik/domian/entities/video_post.dart';

//* se pone abstract porque no queremos instancias de esta clase
abstract class VideoPostDataSouce {
  // No se implementa este metodo, solo se dice que tiene que regresar un Future de una Lista de VideoPost
  Future<List<VideoPost>> getTrendingVideosByPage(int id);
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
