import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Un widget qui affiche une icône de fichier avec une extension optionnelle.
///
/// Ce widgetaffiche une image SVG (soit une image par défaut, soit une image fournie)
/// et peut superposer l'extension du fichier avec une couleur de fond
/// déterminée par le type de fichier ou une couleur spécifiée.
class FileIcon extends StatelessWidget {
  /// Le nom complet du fichier, y compris son extension (par exemple, "document.pdf").
  final String fileName;

  /// La couleur de fond optionnelle pour le badge d'extension.
  /// Si elle n'est pas fournie, une couleur sera choisie en fonction de l'extension du fichier.final Color? color;

  /// Un booléen pour contrôler si l'extension du fichier doit être affichée.
  /// La valeur par défaut est `true`.
  final bool showExtension;

  /// Le style de texte optionnel pour l'extension du fichier.
  /// Si elle n'est pas fournie, un style par défaut sera utilisé.
  final TextStyle? extensionStyle;

  /// Le chemin d'accès optionnel vers l'asset SVG à utiliser comme icône de fichier principale.
  /// Si elle n'est pas fournie, 'assets/file.svg' sera utilisé par défaut.
  final String? assetIcon;

  final Color? color;

  final double? size;
  final bool? roundedLabel;

  /// Crée un widget d'icône de fichier.
  ///
  /// [fileName] est requis et doit inclure l'extension du fichier.
  const FileIcon(
    this.fileName, {
    super.key,
    this.color,
    this.showExtension = true,
    this.extensionStyle,
    this.assetIcon,
    this.size = 40,
    this.roundedLabel = true,
  });

  /// Détermine une couleur en fonction de l'extension du fichier.
  ///
  /// Utilisé si aucune [color] explicite n'est fournie au widget.
  /// Retourne une [Color] spécifique pour les types de fichiers courants (pdf, doc, jpg, etc.)
  /// et [Colors.grey] pour les extensions inconnues.
  Color _getColorForExtension(String extension) {
    final ext = extension.startsWith('.')
        ? extension.toLowerCase()
        : '.${extension.toLowerCase()}';

    switch (ext) {
      // 📝 Documents
      case '.pdf':
        return Colors.red;
      case '.doc':
      case '.docx':
      case '.odt':
      case '.rtf':
        return Colors.blue;
      case '.ppt':
      case '.pptx':
      case '.odp':
        return Colors.orange;
      case '.xls':
      case '.xlsx':
      case '.csv':
      case '.ods':
        return Colors.lightGreen;

      // 🖼️ Images
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
      case '.bmp':
      case '.webp':
      case '.svg':
        return Colors.green;

      // 🎵 Audio
      case '.mp3':
      case '.wav':
      case '.aac':
      case '.ogg':
      case '.flac':
        return Colors.purple;

      // 🎥 Vidéo
      case '.mp4':
      case '.mov':
      case '.avi':
      case '.mkv':
      case '.webm':
        return Colors.deepPurple;

      // 🗜️ Archives
      case '.zip':
      case '.rar':
      case '.7z':
      case '.tar':
      case '.gz':
      case '.tar.gz':
      case '.bz2':
        return Colors.brown;

      // 💻 Code / Développement
      case '.dart':
      case '.java':
      case '.kt':
      case '.cpp':
      case '.c':
      case '.py':
      case '.js':
      case '.ts':
      case '.html':
      case '.css':
      case '.json':
      case '.xml':
      case '.yaml':
      case '.yml':
      case '.sh':
      case '.bat':
        return Colors.indigo;

      // 📄 Textes & logs
      case '.txt':
      case '.log':
      case '.ini':
      case '.cfg':
        return Colors.grey[700]!;

      default:
        return Colors.grey;
    }
  }

  /// Extrait l'extension d'un nom de fichier.
  ///
  /// Retourne l'extension avec le point (par exemple, ".pdf") ou une chaîne vide
  /// si aucune extension n'est trouvée.
  String _extractExtension(String name) {
    final lastDot = name.lastIndexOf('.');
    // S'il n'y a pas de point, ou si le point est le premier caractère (ex: .gitignore)// ou si le point est le dernier caractère (ex: monDossier.)
    if (lastDot < 1 || lastDot == name.length - 1) {
      return ''; // Pas d'extension valide ou extension vide
    }
    return name.substring(lastDot);
  }

  @override
  Widget build(BuildContext context) {
    final String extension = _extractExtension(fileName);
    final Color bgColor = color ?? _getColorForExtension(extension);

    final TextStyle defaultExtensionStyle = TextStyle(
      color: Colors.white,
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
    );

    final double iconSize = size ?? 40;

    return SizedBox(
      width: iconSize.w,
      height: iconSize.w, // ← assure que l’icône garde une taille carrée
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            assetIcon ?? 'assets/file.svg',
            width: iconSize.w,
            height: iconSize.w, // ← applique la taille ici aussi
            fit: BoxFit.contain,
            semanticsLabel: 'Icône de fichier pour $fileName',
          ),
          if (showExtension && extension.isNotEmpty)
            Positioned(
              bottom: 5.h,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((roundedLabel ?? true)
                        ? 6.r
                        : 0), // ← respect de l’option
                    color: bgColor.withAlpha((0.85 * 255).toInt()),
                  ),
                  child: Text(
                    extension.toUpperCase().substring(1),
                    style: extensionStyle ?? defaultExtensionStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
