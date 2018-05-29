import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:hello_rectangle/widgets/category/category.dart';
import 'package:hello_rectangle/widgets/converter/unit_converter.dart';

const _categoryHeight = 100.0;
const _categoryPadding = EdgeInsets.all(8.0);
final _categoryBorderRadius = BorderRadius.circular(_categoryHeight / 2);
const _iconPadding = EdgeInsets.all(16.0);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({
    Key key,
    @required this.category,
    @required this.onTap,
  })  : assert(category != null),
        assert(onTap != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              category.name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: category.color,
          ),
          body: UnitConverter(category: category),
          resizeToAvoidBottomPadding: false,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _categoryHeight,
        child: InkWell(
          borderRadius: _categoryBorderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          onTap: () => onTap(category),
          child: Padding(
            padding: _categoryPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: _iconPadding,
                  child: Image.asset(category.iconLocation),
                ),
                Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
