// part of 'import.dart';
//
// class DrawerMenu extends StatelessWidget {
//   MessageBloc bloc;
//   DrawerMenu({super.key, required this.bloc});
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           UserImg(),
//           CustomListTile(
//             onTap: () {},
//             tit: "الرئيسيه",
//             icons: FontAwesomeIcons.home,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "العضوية",
//             icons: FontAwesomeIcons.solidIdBadge,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "العضوية",
//             icons: FontAwesomeIcons.film,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "الرعاة",
//             icons: FontAwesomeIcons.volumeUp,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "عن النادي",
//             icons: FontAwesomeIcons.hotel,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "عن التطبيق",
//             icons: FontAwesomeIcons.exclamationCircle,
//           ),
//           CustomListTile(
//             onTap: () {},
//             tit: "تواصل معنا",
//             icons: FontAwesomeIcons.envelopeOpen,
//           ),
//           BlocListener<MessageBloc, MessageState>(
//             bloc: bloc,
//             listener: (context, state) {
//               state.when(
//                 initial: () {},
//                 visible: (m) => pushAndRemoveUntil(
//                   NamedRoutes.i.splash,
//                 ),
//                 // visible: (message) {
//                 //   final snackBar = SnackBar(
//                 //     content: Text(message),
//                 //     duration: const Duration(seconds: 3),
//                 //   );
//                 //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 //   bloc.add(const MessageEvent.hideMessage());
//                 // },
//               );
//             },
//             child: CustomListTile(
//               onTap: () {
//                 bloc.add(const MessageEvent.showMessage(
//                     'Hello from Bloc with Freezed!'));
//               },
//               tit: "تسجيل الخروج",
//               icons: FontAwesomeIcons.signOutAlt,
//             ),
//           ),
//           const SizedBox(
//             height: 60,
//           ),
//         ],
//       ),
//     );
//   }
// }
