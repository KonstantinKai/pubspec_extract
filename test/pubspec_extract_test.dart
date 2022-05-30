// Copyright (C) 2019, David PHAM-VAN <dev.nfet.net@gmail.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:pubspec_extract/src/generator.dart';
import 'package:test/test.dart';

const pubspec = '''
name: lib_name
version: 1.02.3-dev+3
description: 'description'
environment:
  sdk: ">=2.12.0-0 <3.0.0"
executables:
  pubspec_extract:
''';

void main() {
  test('Empty file', () {
    final result = convertPubspec('');
    expect(result.contains('buildDate ='), true);
  });

  test('Name works', () {
    final result = convertPubspec('name: package');
    expect(result.contains(r"const name = 'package';"), true);
    expect(result.contains('authors'), false);
  });

  test('Authors works', () {
    final result = convertPubspec('author: David');
    expect(result.contains('const authors ='), true);
    expect(result.contains(r"'David'"), true);
  });

  group('Version string', () {
    test('Simple', () {
      final result = convertPubspec('version: 1.2.3');
      expect(result.contains('version = \'1.2.3\';'), true);
      expect(result.contains('versionSmall = \'1.2\';'), true);
      expect(result.contains('versionMajor = 1;'), true);
      expect(result.contains('versionMinor = 2;'), true);
      expect(result.contains('versionPatch = 3;'), true);
      expect(result.contains('versionBuild = 0;'), true);
      expect(result.contains('versionPreRelease = \'\';'), true);
      expect(result.contains('versionIsPreRelease = false;'), true);
    });

    test('Too small', () {
      expect(() => convertPubspec('version: 1.2'), throwsFormatException);
    });

    test('Complete', () {
      final result = convertPubspec('version: 1.02.3-dev+3');
      expect(result.contains('version = \'1.02.3\';'), true);
      expect(result.contains('versionSmall = \'1.02\';'), true);
      expect(result.contains('versionMajor = 1;'), true);
      expect(result.contains('versionMinor = 2;'), true);
      expect(result.contains('versionPatch = 3;'), true);
      expect(result.contains('versionBuild = 3;'), true);
      expect(result.contains('versionPreRelease = \'dev\';'), true);
      expect(result.contains('versionIsPreRelease = true;'), true);
    });

    test('filter optin', () {
      final result1 = convertPubspec(pubspec, filter: ['name']);
      expect(result1.contains('name = \'lib_name\';'), true);
      expect(result1.contains('version = \'1.02.3\';'), false);

      final result2 = convertPubspec(pubspec, filter: ['version']);
      expect(result2.contains('name = \'lib_name\';'), false);
      expect(result2.contains('version = \'1.02.3\';'), true);
      expect(result2.contains('versionSmall = \'1.02\';'), true);
      expect(result2.contains('versionMajor = 1;'), true);
      expect(result2.contains('versionMinor = 2;'), true);
      expect(result2.contains('versionPatch = 3;'), true);
      expect(result2.contains('versionBuild = 3;'), true);
      expect(result2.contains('versionPreRelease = \'dev\';'), true);
      expect(result2.contains('versionIsPreRelease = true;'), true);
    });
  });
}
