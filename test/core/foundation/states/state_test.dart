import 'package:flutter_clean_next/core/foundation/data/failure.dart';
import 'package:flutter_clean_next/core/foundation/states/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ViewState', () {
    final loading = ViewState.loading(true);
    expect(loading.loading, true);
    expect(loading.value, null);
    expect(loading.error, null);

    final value = ViewState.value('value');
    expect(value.value, 'value');
    expect(value.error, null);

    final error = ViewState.error(const Failure());
    expect(error.value, null);
    expect(error.error, isA<Failure>());
  });
}
