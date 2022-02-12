// Mocks generated by Mockito 5.0.17 from annotations
// in flutter_demo_app/test/breath_list/repo/breath_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_demo_app/breath_list/data/datasources/breath_data_source.dart'
    as _i3;
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeBreatheHistory_0 extends _i1.Fake implements _i2.BreatheHistory {}

/// A class which mocks [BreathDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBreathDataSource extends _i1.Mock implements _i3.BreathDataSource {
  MockBreathDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BreatheHistory> add(_i2.BreatheHistory? breatheHistory) =>
      (super.noSuchMethod(Invocation.method(#add, [breatheHistory]),
              returnValue:
                  Future<_i2.BreatheHistory>.value(_FakeBreatheHistory_0()))
          as _i4.Future<_i2.BreatheHistory>);
  @override
  _i4.Future<List<_i2.BreatheHistory>> getAllBreatheHistory() =>
      (super.noSuchMethod(Invocation.method(#getAllBreatheHistory, []),
          returnValue: Future<List<_i2.BreatheHistory>>.value(
              <_i2.BreatheHistory>[])) as _i4.Future<List<_i2.BreatheHistory>>);
  @override
  _i4.Future<int> delete(int? id) =>
      (super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValue: Future<int>.value(0)) as _i4.Future<int>);
}
