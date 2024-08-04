class NavigationState {
  final int currentIndex;

  NavigationState({required this.currentIndex});

  factory NavigationState.initial() => NavigationState(currentIndex: 0);
}
