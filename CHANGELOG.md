## 0.0.1

- Première version de `icon_file`
- Support dynamique de couleurs par extension
- Personnalisation de l’étiquette et de l’icône

## 0.0.1+1

- Mise à jour des métadonnées (homepage/repository)

## 1.0.1+2

- Mise à jour des métadonnées (`homepage`, dépôt GitHub rendu public)

## 0.0.2

### ✅ Améliorations pour pub.dev  :

- Ajout d'une licence MIT (`LICENSE`) pour répondre aux exigences OSI.
- Ajout de commentaires de documentation (`///`) sur les classes et constructeurs publics.
- Remplacement de `withOpacity()` déprécié par `.withAlpha()` pour éviter les warnings.
- Formatage automatique du code (`dart format .`).
- Mise à jour de la contrainte de dépendance `flutter_screenutil` pour supporter les versions
  minimales (`pub downgrade`).

## [0.0.3] - 2025-06-04

### ✨ Améliorations

- Extension de la méthode `_getColorForExtension` avec la prise en charge de nombreux nouveaux types de fichiers :
  - **Documents** : `.odt`, `.rtf`
  - **Présentations** : `.odp`
  - **Feuilles de calcul** : `.ods`
  - **Images** : `.gif`, `.bmp`, `.webp`, `.svg`
  - **Audio** : `.ogg`, `.flac`
  - **Vidéo** : `.mkv`, `.webm`
  - **Archives** : `.7z`, `.tar`, `.gz`, `.bz2`
  - **Code & configuration** : `.kt`, `.c`, `.cpp`, `.sh`, `.bat`, `.ts`, `.yaml`, `.yml`, `.xml`, `.cfg`, `.ini`, `.log`

### 🧼 Autres

- Meilleure organisation visuelle des extensions par catégories.
- Code plus robuste et plus lisible.

