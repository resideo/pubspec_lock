// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_dependency.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

// ignore_for_file: join_return_with_assignment
// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
abstract class $SdkDependency {
  const $SdkDependency();
  String get sdk;
  String get version;
  SdkDependency copyWith({String sdk, String version}) =>
      SdkDependency(sdk: sdk ?? this.sdk, version: version ?? this.version);
  @override
  String toString() => "SdkDependency(sdk: $sdk, version: $version)";
  @override
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      sdk == other.sdk &&
      version == other.version;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + sdk.hashCode;
    result = 37 * result + version.hashCode;
    return result;
  }
}

class SdkDependency$ {
  static final sdk = Lens<SdkDependency, String>(
      (s_) => s_.sdk, (s_, sdk) => s_.copyWith(sdk: sdk));
  static final version = Lens<SdkDependency, String>(
      (s_) => s_.version, (s_, version) => s_.copyWith(version: version));
}

// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_asserts_with_message
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_single_quotes
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_element
