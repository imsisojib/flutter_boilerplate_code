import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityCounter extends StatefulWidget {
  final int quantity;
  final Axis direction;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;

  const QuantityCounter({
    super.key,
    this.quantity = 1,
    this.direction = Axis.vertical,
    this.height,
    this.width,
    this.decoration,
  });

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity = 0;
  double _height =0, _width = 0;

  @override
  void initState() {
    _quantity = widget.quantity;
    if(widget.direction==Axis.vertical){
      _height = widget.height ?? 125;
      _width = widget.width?? 42.0;
    }else{
      _height = widget.height ?? 42.0;
      _width = widget.width ?? 125.0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return widget.direction == Axis.vertical? Container(
      height: _height.h,
      width: _width.w,
      decoration: widget.decoration ?? BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: theme.colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              iconSize: 16,
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _quantity += 1;
                });
              },
              icon: const Icon(Icons.add)),
          Text(
            "$_quantity",
            style: theme.textTheme.titleSmall,
          ),
          IconButton(
            iconSize: 16,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              if (_quantity == 1) return;
              setState(() {
                _quantity -= 1;
              });
            },
            icon: Icon(
              Icons.remove,
              color: _quantity == 1 ? Colors.grey.withOpacity(0.25) : null,
            ),
          ),
        ],
      ),
    ): Container(
      height: _height.h,
      width: _width.w,
      decoration: widget.decoration ?? BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 16,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                _quantity += 1;
              });
            },
            icon: const Icon(Icons.add, color: Colors.white,),),
          Text(
            "$_quantity",
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
          ),
          IconButton(
            iconSize: 16,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              if (_quantity == 1) return;
              setState(() {
                _quantity -= 1;
              });
            },
            icon: Icon(
              Icons.remove,
              color: _quantity == 1 ? Colors.grey.withOpacity(0.9) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
