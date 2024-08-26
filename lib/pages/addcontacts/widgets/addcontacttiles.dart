import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/config/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberTitle extends StatelessWidget {
  final String name;
  final String description;
  final String? imageUrl; // URL for network image, or null
  final String who;

  const MemberTitle({
    required this.name,
    required this.description,
    this.imageUrl, // Can be null
    required this.who,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: imageUrl != null && imageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          print("Error loading image: $error");
                          return Icon(Icons.error);
                        },
                      )
                    : Image.asset(ImagesAssets.male),
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between the avatar and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5), // Space between name and description
                Flexible(
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            who,
            style: Theme.of(context).textTheme.labelLarge,
          ).paddingOnly(left: 8, right: 10),
        ],
      ),
    );
  }
}
