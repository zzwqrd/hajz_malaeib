abstract class NavigationEvent {}

class UpdateNavigationIndex extends NavigationEvent {
  final int newIndex;

  UpdateNavigationIndex({required this.newIndex});
}
