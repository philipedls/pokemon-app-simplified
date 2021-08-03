import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final int? id;
  final String? name;
  final EdgeInsets? margin;
  final String? imageUrl;

  const ItemWidget({Key? key, this.id, this.name, this.margin, this.imageUrl})
      : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final double radiusValue = 8.0;
  final double blurValue = 6.0;
  final double spreadValue = 3.0;
  final double padding = 12.0;
  final double size = 90.0;
  final double stackHeight = 90.0;
  final double contentHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: stackHeight,
      child: Stack(
        children: [
          Container(
            height: contentHeight,
            padding: EdgeInsets.all(padding),
            margin: widget.margin,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                radiusValue,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: blurValue,
                  spreadRadius: spreadValue,
                  color: Colors.black26,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  '#${widget.id}',
                  style: TextStyle(color: Colors.red),
                ),
                Spacer(
                  flex: 2,
                ),
                Text(widget.name ?? ''),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            // bottom: 15.0,
            child: Image.network(
              widget.imageUrl ??
                  'https://i.pinimg.com/736x/9e/57/83/9e5783dc9b73be938b0b1942a7fd9b24.jpg',
              height: size,
              width: size,
            ),
          )
        ],
      ),
    );
  }
}
