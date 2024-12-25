import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminFeatures {
  AdminFeatures._();

  static List<Map<String, dynamic>> features = [
    {
      'name': 'Add Property',
      'route': '/add_property',
      'iconData': FontAwesomeIcons.plus,
    },
    {
      'name': 'Remove Property',
      'route': '/delete_property',
      'iconData': FontAwesomeIcons.solidTrashCan,
    },
    {
      'name': 'Chat with user',
      'route': '/admin_userlist',
      'iconData': FontAwesomeIcons.solidMessage,
    },
  ];
}
