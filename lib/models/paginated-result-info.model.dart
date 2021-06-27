class PaginatedResultInfo {
  int count;
  int pages;
  String next;
  String prev;

  PaginatedResultInfo({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  PaginatedResultInfo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }
}
