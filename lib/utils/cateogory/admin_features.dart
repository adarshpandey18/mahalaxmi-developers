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
      'route': '/remove_property',
      'iconData': FontAwesomeIcons.solidTrashCan,
    },
    {
      'name': 'Edit Property',
      'route': '/edit_property',
      'iconData': FontAwesomeIcons.solidPenToSquare,
    },
    {
      'name': 'Chat with user',
      'route': '/chat',
      'iconData': FontAwesomeIcons.solidMessage,
    },
    {
      'name': 'User Dashboard',
      'route': '/user_dashboard',
      'iconData': FontAwesomeIcons.solidUser,
    },
  ];
}
