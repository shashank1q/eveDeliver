import 'package:evedelivery/page_not_found.dart';
import 'package:evedelivery/otp_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/otp/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        print('ID: $id');
        return OtpPage(id: id);
      },
    ),
  ],
  errorBuilder: (context, state) => const PageNotFound(),
    // redirect: (_, state) {
    //   if (state.path != '/otp/:id') {
    //     return '/';
    //   }
    //   return null;
    // },
);
