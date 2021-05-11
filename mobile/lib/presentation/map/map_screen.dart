import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location_tracker/core/data_injection/injectable.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/themes/colors.dart';
import 'package:location_tracker/domain/entities/user_entity.dart';
import 'package:location_tracker/presentation/map/map_stream_content.dart';
import 'package:location_tracker/presentation/shared/components/no_internet_banner.dart';
import 'package:location_tracker/presentation/shared/components/user_tile_component.dart';
import 'package:location_tracker/presentation/shared/controller/user_controller.dart';
import 'package:show_up_animation/show_up_animation.dart';
import "package:universal_html/html.dart" as html;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  final _userController = getIt<UserController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: kIsWeb ? 3 : 0), () {
      _loadUsers();
    });

    _deleteWhenClose();
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      print('====> Inactive');
    } else if (state == AppLifecycleState.resumed) {
      _loadUsers();
    } else if (state == AppLifecycleState.detached) {
      _deleteUser();
    }
    print('$state');
  }

  String _translate(String key) {
    return I18nHelper.translate(context, key);
  }

  void _deleteWhenClose() {
    if (kIsWeb) {
      html.window.onBeforeUnload.listen((event) async {
        _deleteUser();
      });
    }
  }

  void _loadUsers() async {
    _userController.listUsers((key) => _translate(key));
  }

  void _selectUser(User? user) {
    _userController.setSelectedUser(user);
    // setState(() {});
  }

  void _deleteUser() {
    print('Leaving...');
    _userController.deleteUser(_translate);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
          body: Stack(
        children: [
          MapStreamContent(
            onSelect: (user) => _selectUser(user),
          ),
          if (_userController.selectedUser != null) ...[
            Container(
                alignment: Alignment.bottomCenter,
                child: ShowUpAnimation(
                  animationDuration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  direction: Direction.vertical,
                  child: UserTile(
                    _userController.selectedUser!,
                    onClose: () => _selectUser(null),
                  ),
                )),
          ],
          Align(
            alignment: Alignment.center,
            child: NoInternetBanner(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: IconButton(
                  icon: Icon(Icons.refresh, color: AppColors.primaryOrange),
                  onPressed: _loadUsers),
            ),
          )
        ],
      ));
    });
  }
}
