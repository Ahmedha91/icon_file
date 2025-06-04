import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_file/icon_file.dart'; // Remplace par ton nom réel de package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FileIcon Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const FileIconDemo(),
        );
      },
    );
  }
}

class FileIconDemo extends StatelessWidget {
  const FileIconDemo({super.key});

  final List<String> files = const [
    'document.pdf',
    'notes.docx',
    'image.png',
    'video.mp4',
    'music.mp3',
    'slides.pptx',
    'spreadsheet.xlsx',
    'archive.zip',
    'script.js',
    'style.css',
    'readme.txt',
    'logo.svg',
    'data.json',
    'source.dart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FileIcon Demo')),
      body: ListView(
        padding: EdgeInsets.all(16.0.w),
        children: [
          _buildSectionTitle('🗂️ Fichiers par défaut'),
          _buildGrid(files.map((f) => FileIcon(f)).toList(), files),
          SizedBox(height: 24.h),
          _buildSectionTitle('🎨 Personnalisé (couleur / style)'),
          _buildGrid([
            FileIcon(
              'custom.pdf',
              color: Colors.deepPurple,
              extensionStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            FileIcon(
              'image.png',
              showExtension: false,
            ),
            FileIcon(
              'darkmode.css',
              color: Colors.black,
              extensionStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
            ),
          ], [
            'custom.pdf',
            'image.png (sans extension)',
            'darkmode.css'
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildGrid(List<Widget> icons, List<String> labels) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            icons[index],
            SizedBox(height: 8.h),
            Text(
              labels[index],
              style: TextStyle(fontSize: 11.sp),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
