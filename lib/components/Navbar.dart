import 'package:flutter/material.dart';

import 'package:its_flutter/pages/IdeaListPage.dart';
import 'package:its_flutter/meta/info.dart' show MetaInfo;
import 'package:its_flutter/pages/currentIdeaPage.dart';
import 'package:its_flutter/router/utils.dart' show openPage;


class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(MetaInfo.appName),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          tooltip: 'Home',
          onPressed: () {
            openPage(context, CurrentIdeaPage());
          },
        ),
        IconButton(
          icon: Icon(Icons.view_list),
          tooltip: 'All Options',
          onPressed: () {
            openPage(context, IdeaListPage());
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(null, 40);
}
