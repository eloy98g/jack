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
                    alignment: WrapAlignment.start,
                    runSpacing: 15,
                    spacing: 8,
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