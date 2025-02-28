import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:feature_mind_news/common/utils/extensions.dart';

import '../../utils/colors.dart';

class FeatureMindNetworkImage extends StatelessWidget {
  const FeatureMindNetworkImage(
      {super.key,
      required this.url,
      this.errorPlaceholder,
      this.height = 200,
      this.width = 200,
      this.isCircular = false,
      this.boxFit = BoxFit.cover,
      this.borderRadius});

  final String url;
  final String? errorPlaceholder;
  final double? width;
  final double? height;
  final bool isCircular;
  final BoxFit boxFit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
          child: (url.isEmpty)
              ? _ErrorWidget(
                  height: height,
                  width: width,
                  isCircular: isCircular,
                  errorPlaceholder: errorPlaceholder)
              : CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      height: (height ?? 32) * 0.5,
                      width: (width ?? 32) * 0.5,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.primary,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => _ErrorWidget(
                      height: height,
                      width: width,
                      isCircular: isCircular,
                      errorPlaceholder: errorPlaceholder),
                  imageBuilder: (context, imageProvider) => Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        shape:
                            isCircular ? BoxShape.circle : BoxShape.rectangle,
                        borderRadius: isCircular ? null : borderRadius,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: boxFit,
                        )),
                  ),
                  imageUrl: url,
                )),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.height,
    required this.width,
    required this.isCircular,
    required this.errorPlaceholder,
  });

  final double? height;
  final double? width;
  final bool isCircular;
  final String? errorPlaceholder;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircular ? null : BorderRadius.circular(8),
          color: AppColors.primary,
        ),
        child: errorPlaceholder != null
            ? Center(
                child: Text(
                  errorPlaceholder!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 20 / 14,
                    color: Colors.white,
                  ),
                ),
              )
            : null);
  }
}
