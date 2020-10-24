import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/constants/size_constant.dart' ;

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({Key key, this.movieId, this.posterPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Material(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_6.w),
              child: CachedNetworkImage(
            imageUrl: '${ApiConstant.IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
