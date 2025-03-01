// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_spiks_test/test/dependencies/mock_dependencies.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_spiks_test/data/repositories/dog_image_random/local/dog_image_local_repository.dart'
    as _i5;
import 'package:flutter_spiks_test/data/repositories/dog_image_random/remote/dog_image_random_repository.dart'
    as _i3;
import 'package:flutter_spiks_test/services/app_service/app_service.dart'
    as _i8;
import 'package:flutter_spiks_test/services/local_storage_service/local_storage_service.dart'
    as _i9;
import 'package:flutter_spiks_test/services/log_service/log_service.dart'
    as _i7;
import 'package:local_database/local_database.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rest_client/rest_client.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDogImage_0 extends _i1.SmartFake implements _i2.DogImage {
  _FakeDogImage_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DogImageRandomRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDogImageRandomRepository extends _i1.Mock
    implements _i3.DogImageRandomRepository {
  MockDogImageRandomRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DogImage> getDogImageRandom() => (super.noSuchMethod(
        Invocation.method(
          #getDogImageRandom,
          [],
        ),
        returnValue: _i4.Future<_i2.DogImage>.value(_FakeDogImage_0(
          this,
          Invocation.method(
            #getDogImageRandom,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DogImage>);
}

/// A class which mocks [DogImageLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDogImageLocalRepository extends _i1.Mock
    implements _i5.DogImageLocalRepository {
  MockDogImageLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> insertDogImageDB(_i6.DogImageEntity? dogImageEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertDogImageDB,
          [dogImageEntity],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<List<_i6.DogImageEntity>> getDogImagesFromDB() =>
      (super.noSuchMethod(
        Invocation.method(
          #getDogImagesFromDB,
          [],
        ),
        returnValue:
            _i4.Future<List<_i6.DogImageEntity>>.value(<_i6.DogImageEntity>[]),
      ) as _i4.Future<List<_i6.DogImageEntity>>);

  @override
  _i4.Future<void> deleteDogImageDB(_i6.DogImageEntity? dogImageEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteDogImageDB,
          [dogImageEntity],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [LogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogService extends _i1.Mock implements _i7.LogService {
  MockLogService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void e(
    String? message,
    dynamic e,
    StackTrace? stack,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #e,
          [
            message,
            e,
            stack,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void i(String? message) => super.noSuchMethod(
        Invocation.method(
          #i,
          [message],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void w(
    String? message, [
    dynamic e,
    StackTrace? stack,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #w,
          [
            message,
            e,
            stack,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AppService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppService extends _i1.Mock implements _i8.AppService {
  MockAppService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get locale => (super.noSuchMethod(
        Invocation.getter(#locale),
        returnValue: '',
      ) as String);

  @override
  bool get isDarkMode => (super.noSuchMethod(
        Invocation.getter(#isDarkMode),
        returnValue: false,
      ) as bool);

  @override
  _i4.Future<void> setLocale({required String? locale}) => (super.noSuchMethod(
        Invocation.method(
          #setLocale,
          [],
          {#locale: locale},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> setIsDarkMode({required bool? darkMode}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIsDarkMode,
          [],
          {#darkMode: darkMode},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock
    implements _i9.LocalStorageService {
  MockLocalStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FutureOr<void> setValue({
    required String? key,
    required dynamic value,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #setValue,
        [],
        {
          #key: key,
          #value: value,
        },
      )) as _i4.FutureOr<void>);

  @override
  Object? getValue({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #getValue,
        [],
        {#key: key},
      )) as Object?);

  @override
  String? getString({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #getString,
        [],
        {#key: key},
      )) as String?);

  @override
  int? getInt({required String? key}) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [],
        {#key: key},
      )) as int?);

  @override
  double? getDouble({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #getDouble,
        [],
        {#key: key},
      )) as double?);

  @override
  bool? getBool({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #getBool,
        [],
        {#key: key},
      )) as bool?);

  @override
  List<String>? getStringList({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [],
        {#key: key},
      )) as List<String>?);

  @override
  _i4.FutureOr<bool> removeEntry({required String? key}) => (super.noSuchMethod(
        Invocation.method(
          #removeEntry,
          [],
          {#key: key},
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.FutureOr<bool>);
}
