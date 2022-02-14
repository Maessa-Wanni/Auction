class DetailsModel {
  final List<String> images;
  final String currentPrice;
  final String minimumIncrement;
  final String endTime;
  final String remainingTime;
  final String description;
  final String lot;
  final int auctionsNumber;
  final List<dynamic> list;

  DetailsModel({
    required this.images,
    required this.currentPrice,
    required this.minimumIncrement,
    required this.endTime,
    required this.description,
    required this.remainingTime,
    required this.auctionsNumber,
    required this.lot,
    required this.list,
  });
}
