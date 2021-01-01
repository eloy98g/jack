import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../repositories/match.dart';
import '../widgets/index.dart';

class Matches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MatchesRepository>(
      builder: (context, repository, child) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: repository.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    runSpacing: 15,
                    children: [
                      for (final match in repository.matches)
                        MatchCard(match),
                    ],
                  ),
              ),
          ),
    );
  }
}