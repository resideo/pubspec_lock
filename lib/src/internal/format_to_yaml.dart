/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'package:json2yaml/json2yaml.dart';

import '../../pubspec_lock.dart';

// ignore_for_file: public_member_api_docs

String formatToYaml(
  PubspecLock pubspecLock,
) =>
    '# Generated by pub'
    '\n# See https://dart.dev/tools/pub/glossary#lockfile'
    '\n${json2yaml(_toJson(pubspecLock), yamlStyle: YamlStyle.pubspecLock)}'
    '\n';

Map<String, dynamic> _toJson(
  PubspecLock pubspecLock,
) =>
    <String, dynamic>{
      if (pubspecLock.packages.isNotEmpty) 'packages': _packagesToJson(pubspecLock.packages),
      if (pubspecLock.sdks.isNotEmpty) 'sdks': _sdksToJson(pubspecLock.sdks),
    };

Map<String, dynamic> _packagesToJson(Iterable<PackageDependency> packages) =>
    Map<String, dynamic>.fromEntries(packages.map((package) => MapEntry<String, dynamic>(
          package.package(),
          _packageToJson(package),
        )));

Map<String, dynamic> _packageToJson(PackageDependency package) => package.iswitch(
      sdk: _sdkDependencyToJson,
      hosted: _hostedDependencyToJson,
      git: _gitDependencyToJson,
      path: _pathDependencyToJson,
    );

Map<String, dynamic> _gitDependencyToJson(GitPackageDependency p) => <String, dynamic>{
      'dependency': _convertDepTypeToString(p.type),
      'description': <String, dynamic>{
        'path': '"${p.path}"',
        'ref': p.ref,
        'resolved-ref': '"${p.resolvedRef}"',
        'url': p.url,
      },
      'source': 'git',
      'version': p.version,
    };

Map<String, dynamic> _hostedDependencyToJson(HostedPackageDependency p) => <String, dynamic>{
      'dependency': _convertDepTypeToString(p.type),
      'description': <String, dynamic>{
        'name': p.name,
        'url': p.url,
      },
      'source': 'hosted',
      'version': p.version,
    };

Map<String, dynamic> _pathDependencyToJson(PathPackageDependency p) => <String, dynamic>{
      'dependency': _convertDepTypeToString(p.type),
      'description': <String, dynamic>{
        'path': '"${p.path}"',
        'relative': p.relative,
      },
      'source': 'path',
      'version': p.version,
    };

Map<String, dynamic> _sdkDependencyToJson(SdkPackageDependency p) => <String, dynamic>{
      'dependency': _convertDepTypeToString(p.type),
      'description': p.description,
      'source': 'sdk',
      'version': p.version,
    };

String _convertDepTypeToString(DependencyType dependencyType) {
  switch (dependencyType) {
    case DependencyType.direct:
      return '"direct main"';
    case DependencyType.development:
      return '"direct dev"';
    case DependencyType.transitive:
      return 'transitive';
  }
  throw AssertionError(dependencyType);
}

Map<String, dynamic> _sdksToJson(
  Iterable<SdkDependency> sdks,
) =>
    Map<String, dynamic>.fromEntries(sdks.map((sdk) => MapEntry<String, dynamic>(
          sdk.sdk,
          sdk.version,
        )));
