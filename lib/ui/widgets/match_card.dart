import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jack/repositories/index.dart';
import 'package:jack/ui/widgets/index.dart';
import 'package:jack/utils/index.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';
import '../tabs/match.dart';

class MatchCard extends StatelessWidget {
  final Match data;

  const MatchCard(this.data, {Key key}) : super(key: key);

  Widget profilePic(String url) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: CachedNetworkImage(
          imageUrl: url ??
              'https://jesussavesmbchurch.org/wp-content/themes/grace-church/images/generic-profile.jpg',
          height: 33,
          width: 33,
          fit: BoxFit.cover,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      excludeFromSemantics: true,
      radius: 0,
      highlightColor: transparent,
      child: Container(
        width: 300,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.5, vertical: 15.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Text(
                                data.name,
                                style: TextStyle(
                                  color: textPrimaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16.0,
                      color: textPrimaryColor,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 23,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(data.color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Separator(width: 5, height: 1),
                    Text(
                      data.game,
                      style: TextStyle(
                          color: textPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Separator(width: 5, height: 1),
                    Text(
                      data.lastRoundDate,
                      style: TextStyle(
                        color: textPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Separator(width: 1, height: 12),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<PlayerRepository>(
                        builder: (context, repository, child) {
                      return Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                alignment: WrapAlignment.start,
                                children: [
                                  for (final player in repository
                                      .getPlayersByMatchId(data.players))
                                    profilePic(player.photoUrl)
                                ],
                              ),
                            ],
                          ));
                    }),
                    Separator(width: 12),
                    Expanded(
                      flex: 2,
                      child: ScoreTab(data: data, fontSize: 12),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: backgroundPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MatchDetails(
            matchData: data,
          ),
        ),
      ),
    );
  }
}
