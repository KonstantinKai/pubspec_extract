# Pubspec Extract

Extracts Dart pubspec.yaml file and generate pubspec.dart at build time.

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/JORBmbw9h "Buy Me A Coffee")


## Usage as a command line tool

In your pubspec.yaml, add the following:

```yaml
dev_dependencies:
    pubspec_extract:
```

then if you are using Flutter, run:

```shell
flutter pub run pubspec_extract
```

or

```shell
pub run pubspec_extract
```

## Install the command-line tool globally

run:

```shell
pub global activate pubspec_extract
```

the executable will be compiled and available at `$HOME/.pub-cache/bin` or `%APPDATA%\Pub\Cache\bin`. You can run it using:

```shell
pub global run pubspec_extract
```
