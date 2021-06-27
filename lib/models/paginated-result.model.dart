import 'package:rick_and_morty/models/paginated-result-info.model.dart';

class PaginatedResult<T> {
  PaginatedResultInfo info;
  List<T> results;

  PaginatedResult({
    this.info,
    this.results,
  });

  PaginatedResult.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) convertResult) {
    info = json['info'] != null ? new PaginatedResultInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <T>[];
      json['results'].forEach((v) {
        results.add(convertResult(v));
      });
    }
  }
}
