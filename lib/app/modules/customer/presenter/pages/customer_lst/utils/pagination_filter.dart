class PaginationFilter {
  final int page;
  final int limit;

  PaginationFilter(this.page, this.limit);

  @override
  String toString() => 'PaginationFilter(page: $page, limit: $limit)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaginationFilter && o.page == page && o.limit == limit;
  }

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}
