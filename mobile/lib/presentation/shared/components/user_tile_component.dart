import 'package:flutter/material.dart';
import 'package:location_tracker/core/helpers/strings_helpers.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/presentation/shared/components/hard_edge_container.dart';

class UserTile extends StatelessWidget {
  UserTile(this.user, {required this.onClose});
  final User user;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HardEdgeContainer(
        height: 150,
        width: MediaQuery.of(context).size.width * .9,
        borderColor: AppColors.darkGrey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: AppColors.mediumBlueGrey,
          child: Row(
            children: [
              Image.asset("assets/images/${user.vehicle}.png"),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(user.nick)),
                        InkWell(child: Icon(Icons.close), onTap: onClose)
                      ],
                    ),
                    Text(
                        "LAT ${user.location?.latitude.toStringAsPrecision(8)}",
                        style: TextStyle(fontSize: 8)),
                    Text(
                        "LON: ${user.location?.longitude.toStringAsPrecision(8)}",
                        style: TextStyle(fontSize: 8)),
                    if (user.location?.heading != null)
                      Text(
                          "HEAD: ${user.location?.heading?.toStringAsPrecision(2)}",
                          style: TextStyle(fontSize: 8)),
                    if (user.createdAt != null)
                      Text(
                          "Created at ${StringHelper.dateToString(user.createdAt!)}",
                          style: TextStyle(fontSize: 8)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
