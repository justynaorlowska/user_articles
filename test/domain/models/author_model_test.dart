import 'package:flutter_test/flutter_test.dart';
import 'package:user_articles/domain/models/author_model.dart';

void main() {
  test('will getter name return first and last name combined', () {
    // 1 - prepare data
    final model = AuthorModel(1, '', 'Stefan', 'Kowalski');

    // 2 - executing the method we want to test
    final result = model.name;

    // 3 - what is the expected result of this test
    expect(result, 'Stefan Kowalski');
  });
}
