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
              : ListView(
                  children: [
                    Column(
                      children: [
                        for (final match in repository.matches)
                          Column(
                            children: [
                              Divider(
                                color: Color(0x00000000),
                                height: 25,
                                thickness: 0,
                              ),
                              MatchCard(match),
                            ],
                          ),
                        Divider(
                                color: Color(0x00000000),
                                height: 25,
                                thickness: 0,
                              ),
                      ],
                    )
                  ],
              ),
          ),
    );
  }
}