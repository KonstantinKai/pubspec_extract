# Pubspec Extract

Extracts Dart pubspec.yaml file and generate pubspec.dart at build time.

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/JORBmbw9h "Buy Me A Coffee")

## Usage

In your pubspec.yaml, add the following:

```yaml
builders:
    pubspec_extract:
```

Then in your application, you can import `pubspec.dart`:

```dart
import 'pubspec.dart' as pubspec; // May not exist but it's okay!

void main() {
  print(pubspec.name);
  print(pubspec.description);
  print(pubspec.version);
}
```
