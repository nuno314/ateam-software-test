import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWrapper extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;

  const CachedNetworkImageWrapper({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.color,
    this.placeholder,
    this.errorWidget,
    this.maxHeightDiskCache,
    this.maxWidthDiskCache,
  });

  const CachedNetworkImageWrapper.image({
    Key? key,
    required String url,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    double loadingRadius = 10,
  }) : this(
         key: key,
         url: url,
         width: width,
         height: height,
         fit: fit,
         alignment: alignment,
         placeholder: const Center(
           child: SizedBox(
             width: 10,
             height: 10,
             child: CircularProgressIndicator(strokeWidth: 2),
           ),
         ),
         errorWidget: const Center(child: Icon(Icons.error)),
       );

  const CachedNetworkImageWrapper.avatar({
    Key? key,
    required String url,
    double size = 40,
    double loadingRadius = 10,
  }) : this(
         key: key,
         url: url,
         width: size,
         height: size,
         fit: BoxFit.cover,
         alignment: Alignment.center,
         placeholder: const Center(
           child: SizedBox(
             width: 10,
             height: 10,
             child: CircularProgressIndicator(strokeWidth: 2),
           ),
         ),
         errorWidget: const Center(child: Icon(Icons.error)),
       );

  CachedNetworkImageWrapper.item({
    Key? key,
    required String url,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    String? placeHolderUrl,
  }) : this(
         key: key,
         url: url,
         width: width,
         height: height,
         fit: fit,
         color: color,
         maxHeightDiskCache: 200,
         maxWidthDiskCache: 200,
         placeholder: placeHolderUrl == null
             ? const Center(
                 child: SizedBox(
                   width: 10,
                   height: 10,
                   child: CircularProgressIndicator(strokeWidth: 2),
                 ),
               )
             : Image.network(
                 placeHolderUrl,
                 width: width,
                 height: height,
                 fit: fit,
               ),
         errorWidget: placeHolderUrl == null
             ? const Center(child: Icon(Icons.error))
             : Image.network(
                 placeHolderUrl,
                 width: width,
                 height: height,
                 fit: fit,
               ),
       );

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      maxHeightDiskCache: maxHeightDiskCache,
      maxWidthDiskCache: maxWidthDiskCache,
      placeholder: placeholder != null
          ? (_, __) => placeholder!
          : (_, __) => const Center(child: CircularProgressIndicator()),
      errorWidget: errorWidget != null
          ? (_, __, ___) => errorWidget!
          : (_, __, ___) => const Icon(Icons.error),
    );
  }
}
