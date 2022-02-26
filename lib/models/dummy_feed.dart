class ListedItemInfo {
  final String svgSrc, title;
  final String likes;
  final double currentBid;
  final String endingTime;
  final bool isliked;

  ListedItemInfo({
    required this.svgSrc,
    required this.title,
    required this.likes,
    required this.currentBid,
    required this.endingTime,
    required this.isliked,
  });
}

List demoListedItem = [
  ListedItemInfo(
    svgSrc:
        "https://lh3.googleusercontent.com/YJ5rpnHTPLty9LLfAa6NVJnp9wjkqrkjEQbo2soVr1c2yBEe1DbL2aUabPSTr_A5npLLzAP8UEc5y2zfPyosXEZdnhVg0h5yWHApTw=s0",
    title: "Old Age",
    likes: "80",
    currentBid: 20,
    endingTime: "1d: 12h : 10m",
    isliked: true,
  ),
  ListedItemInfo(
    svgSrc:
        "https://img.rarible.com/prod/video/upload/t_video_thumb_big/prod-itemAnimations/0x729cd6226751279030757f61b2cac4798c949fa1:10193/1569ae98",
    title: "Timed Resource",
    likes: "1000",
    currentBid: 50.5,
    endingTime: "5d: 3h : 7m",
    isliked: true,
  ),
  ListedItemInfo(
      svgSrc:
          "https://lh3.googleusercontent.com/1kohHyozmkI2a6yMQehc0JxcmHDkWnbLDHhJ96e-sXM2BBFc0ASp4MvdKgJyZaVeb26aymc6nTBSIym48xE8amUf_uZxhRwepD9xEw=w600",
      title: "New Normal",
      likes: "5m",
      currentBid: 400,
      endingTime: "0d : 50h : 2m",
      isliked: true),
];
