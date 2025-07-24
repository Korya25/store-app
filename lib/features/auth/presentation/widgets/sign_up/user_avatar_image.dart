import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/constants/app_assets.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({
    super.key,
    this.imageUrl,
    this.onUploadImage,
    this.onRemoveImage,
  });

  final String? imageUrl;
  final VoidCallback? onUploadImage;
  final VoidCallback? onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: CircleAvatar(
        radius: 38,
        backgroundImage: AssetImage(AppImages.userAvatar),
        backgroundColor: Colors.grey.withOpacity(.1),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Upload Button
            IconButton(
              onPressed: onUploadImage,
              icon: const Icon(Icons.add_a_photo, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
