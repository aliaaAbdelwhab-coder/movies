import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/browse/browsGetMoviesUI.dart';

class BrowseTab extends StatelessWidget {
  static const String routeName = 'browse_screen';

  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Browsgetmoviesui(genre: 'action',);
  }
}
