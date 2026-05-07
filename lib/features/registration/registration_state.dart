class RegistrationState{
  final bool isLoading;
  final String? user;
  final String? error;

  RegistrationState({ this.isLoading=false,  this.user,  this.error});

  RegistrationState copyWith({
    bool? isLoading,
    String? user,
    String? error,
  }){
    return RegistrationState(
      isLoading: isLoading??this.isLoading,
      user: user??this.user,
      error: error??this.error
    );
  }

}