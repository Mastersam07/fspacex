import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fspacex/services/graphql_service.dart';

class GraphQlServiceImpl extends Mock implements GraphQLService {}

main() {
  test('should return id if found', () async {
    final service = GraphQLService();

    String query = r'''
    {
    launch(id: "97") {
      id
      }
    }
    ''';

    final result = await service.performQuery(query);

    expect(result.data['launch']['id'],(97).toString());
  });
  test('should return launch as null if not found', () async {
    final service = GraphQLService();

    String query = r'''
    {
    launch(id: "9887") {
      id
      }
    }
    ''';

    final result = await service.performQuery(query);

    expect(result.data['launch'], null);
  });
}
