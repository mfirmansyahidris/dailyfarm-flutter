class LayerData<T>{
  final T state;
  final String asset;
  final double? height;
  final double? width;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  LayerData({
    required this.state,
    required this.asset,
    this.width,
    this.height,
    this.top,
    this.bottom,
    this.left,
    this.right
  });
}