abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutGetUserLoadingState extends LayoutStates {}

class LayoutGetUserSuccesState extends LayoutStates {}

class LayoutGetUserErrorState extends LayoutStates {
  final String error;
  LayoutGetUserErrorState(this.error);
}

class LayoutChangeButtomNavState extends LayoutStates {}

class LayoutChangeButtomNavAddPostState extends LayoutStates {}

class LayoutProfileImagePickedSuccesState extends LayoutStates {}

class LayoutProfileImagePickedErrorState extends LayoutStates {}

class LayoutCoverImagePickedSuccesState extends LayoutStates {}

class LayoutCoverImagePickedErrorState extends LayoutStates {}

class LayoutUploadProfileImageSuccesState extends LayoutStates {}

class LayoutUploadProfileImageErrorState extends LayoutStates {}

class LayoutUploadCoverImageSuccesState extends LayoutStates {}

class LayoutUploadCoverImageErrorState extends LayoutStates {}

class LayoutUserUpdateLoadingState extends LayoutStates {}

class LayoutUserUpdateErrorState extends LayoutStates {}

class LayoutCreatePostLoadingState extends LayoutStates {}

class LayoutCreatePostErrorState extends LayoutStates {}
class LayoutdeletePostImageState extends LayoutStates {}
