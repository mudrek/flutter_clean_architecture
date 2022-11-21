import 'package:flutter_clean_next/features/movies/data/mappers/movies_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../samples/movie_model_sample.dart';
import '../samples/movie_sample.dart';

void main() {
  test('should convert an MovieModel to Movie', () {
    final entity = MovieSample.create();
    final model = MovieModelSample.create();

    final result = MoviesMapper.toEntity(model);

    expect(result, entity);
  });
}
