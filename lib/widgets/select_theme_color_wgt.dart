import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daichao/blocs/theme_bloc.dart';
import 'package:daichao/data/data.dart';
import 'package:daichao/utils/sp_utils.dart';

class SelectThemeColorWgt extends StatefulWidget {
  @override
  _SelectThemeColorWgtState createState() => _SelectThemeColorWgtState();
}

class _SelectThemeColorWgtState extends State<SelectThemeColorWgt> {
  String _colorKey = "gray";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      // margin: EdgeInsets.only(left: 15, right: 15),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          '更换主题',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        initiallyExpanded: false,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: themeColorMap.keys.map((key) {
                Color value = themeColorMap[key];
                return InkWell(
                  key: ValueKey(key),
                  onTap: () {
                    setState(() {
                      _colorKey = key;
                    });
                    SpUtil.putString('key_theme_color', key);
                    BlocProvider.of<ThemeBloc>(context).add(SelectThemeColorEvent(value));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    color: value,
                    child: _colorKey == key
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
