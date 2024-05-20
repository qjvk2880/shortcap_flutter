enum MainCategory {
  all(krName: "전체"),
  technology(krName: "기술"),
  beauty(krName: "뷰티"),
  cook(krName: "요리"),
  living(krName: "리빙"),
  health(krName: "건강"),
  travel(krName: "여행"),
  art(krName: "예술"),
  news(krName: "뉴스"),
  entertainment(krName: "엔터테인먼트"),
  other(krName: "기타");

  const MainCategory({
    required this.krName,
  });

  final String krName;
}