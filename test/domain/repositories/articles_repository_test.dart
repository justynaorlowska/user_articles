import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';
import 'package:user_articles/domain/repositories/articles_repository.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  late ArticlesRepository sut;
  late MockArticlesDataSource dataSource;

  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });

  group('getArticlesForAuthorId', () {
    test('should call remoteDataSource.getArticles() method', () async {
      // 1 - prepare data
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [],
      );
      // 2 - execute the method we want to test
      await sut.getArticlesForAuthorId(555);

      // 3 - what is the expected result of this test
      verify(() => dataSource.getArticles()).called(1);
    });

    test('should filter data source results with provided author id', () async {
      // 1 - prepare data
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [
          ArticleModel(1, 555, 'content1', 'picture1'),
          ArticleModel(2, 333, 'content2', 'picture2'),
          ArticleModel(3, 555, 'content3', 'picture3'),
          ArticleModel(4, 555, 'content4', 'picture4'),
        ],
      );
      // 2 - execute the method we want to test
      final results = await sut.getArticlesForAuthorId(555);

      // 3 - what is the expected result of this test
      expect(results, [
        ArticleModel(1, 555, 'content1', 'picture1'),
        ArticleModel(3, 555, 'content3', 'picture3'),
        ArticleModel(4, 555, 'content4', 'picture4'),
      ]);
    });
  });
}
