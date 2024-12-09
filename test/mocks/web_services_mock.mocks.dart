// Mocks generated by Mockito 5.4.4 from annotations
// in code_nes_lab_task/test/mocks/web_services_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:code_nes_lab_task/data/models/item_model.dart' as _i4;
import 'package:code_nes_lab_task/data/services/web_services.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [WebServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockWebServices extends _i1.Mock implements _i2.WebServices {
  MockWebServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ItemModel>> fetchItems({
    required int? page,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchItems,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i3.Future<List<_i4.ItemModel>>.value(<_i4.ItemModel>[]),
      ) as _i3.Future<List<_i4.ItemModel>>);
}
