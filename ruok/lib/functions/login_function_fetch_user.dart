import 'package:ruok/models/user_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<User> fetchUser(CookieRequest request) async {
  User user = User(username: 'guest', isAdmin: false);

  try {
    final response = await request.get('https://ruok.up.railway.app/mob/user/');
    if (response.containsKey('data')) {
      user = User.fromJson(response['data']);
    }
  } catch (error) {
    // Pass
  }

  return user;
}