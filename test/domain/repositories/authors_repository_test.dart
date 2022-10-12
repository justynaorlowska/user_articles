import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

class MockAuthorsDataSource extends Mock
    implements AuthorsRemoteRetrofitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorsDataSource dataSource;

  setUp(() {
    dataSource = MockAuthorsDataSource();
    sut = AuthorsRepository(remoteDataSource: dataSource);
  });

  group('getAuthorModels', () {
    test('should call remoteDataSource.getAuthors() method', () async {
      // 1 - prepare data
      when(() => dataSource.getAuthors()).thenAnswer(
        (_) async => [],
      );
      // 2 - execute the method we want to test
      await sut.getAuthorModels();
      // 3 - what is the expected result of this test
      verify(() => dataSource.getAuthors()).called(1);
    });
    
    test('should return the list of authors', () async {
      // 1 - prepare data
      when(() => dataSource.getAuthors()).thenAnswer(
        (_) async => [
          AuthorModel(1, 'picture1', 'Stefan', 'Kowalski'),
          AuthorModel(2, 'picture2', 'Mieciu', 'Sołtysiak'),
          AuthorModel(3, 'picture3', 'Heniek', 'But'),
          AuthorModel(4, 'picture4', 'Zbigniew', 'Sandał'),
        ],
      );
      // 2 - execute the method we want to test
      final results = await sut.getAuthorModels();
      // 3 - what is the expected result of this test
      expect(
        results,
        [
          AuthorModel(1, 'picture1', 'Stefan', 'Kowalski'),
          AuthorModel(2, 'picture2', 'Mieciu', 'Sołtysiak'),
          AuthorModel(3, 'picture3', 'Heniek', 'But'),
          AuthorModel(4, 'picture4', 'Zbigniew', 'Sandał'),
        ],
      );
    });
  });
}
