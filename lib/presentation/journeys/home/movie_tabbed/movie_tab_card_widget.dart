import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/data/core/api_constant.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;

  const MovieTabCardWidget({Key key, this.movieId, this.title, this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.h),
              child: CachedNetworkImage(
                imageUrl: "${ApiConstant.IMAGE_URL}$posterPath",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(title.intelliTrim(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2),
          )
        ],
      ),
    );
  }
}
