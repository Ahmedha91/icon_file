import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FileIcon extends StatelessWidget {
  final String fileName;
  final Color? color;
  final bool showExtension;
  final TextStyle? extensionStyle;
  final String? assetIcon;
  const FileIcon(
      this.fileName, {
        super.key,
        this.color,
        this.showExtension = true,
        this.extensionStyle,
        this.assetIcon,
      });
  Color _randomColor(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
        return Colors.red;
      case '.doc':
      case '.docx':
        return Colors.blue;
      case '.jpg':
      case '.png':
        return Colors.green;
      case '.ppt':
      case '.pptx':
        return Colors.orange;
      case '.xls':
      case '.xlsx':
      case '.csv':
        return Colors.lightGreen;
      case '.mp3':
      case '.wav':
      case '.mp4':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }



  @override
  Widget build(BuildContext context) {
    final extension = fileName.substring(fileName.lastIndexOf('.'));
    final bgColor = color ?? _randomColor(extension);

    return SizedBox(
      width: 40.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            assetIcon ?? 'assets/file.svg',
            width: 40.w,
            fit: BoxFit.contain,
          ),
          if (showExtension)
            Positioned(
              bottom: 10,
              left: 0,
              child: Container(
                width: 30.w,
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  color: bgColor.withOpacity(0.85),
                ),
                child: Text(
                  extension,
                  style: extensionStyle ??
                      TextStyle(color: Colors.white, fontSize: 10.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

