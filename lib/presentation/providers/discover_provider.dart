import 'package:flutter/material.dart';
import 'package:toktik/domian/entities/video_post.dart';
import 'package:toktik/domian/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  //* Repository, DataSource
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    //* Cargar videos
    /* await Future.delayed(const Duration(seconds: 2)); */

    /* final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntiy())
        .toList(); */

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
