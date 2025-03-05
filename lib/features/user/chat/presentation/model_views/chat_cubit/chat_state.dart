abstract class ChatState {}

class ChatInitial extends ChatState {}

// states for contacts

class GetContactsLoading extends ChatState {}

class GetContactsError extends ChatState {}

class GetContactsSuccess extends ChatState {}

// states for sending message

class ChatSendingLoading extends ChatState {}

class ChatSendingError extends ChatState {}

class ChatSendingSuccess extends ChatState {}

// states for getting messages
class GetChatLoading extends ChatState {}

class GetChatError extends ChatState {}

class GetChatSuccess extends ChatState {}

// class ChatEmpty extends ChatState {}

// class ChatFailure extends ChatState {}

// class ChatNoInternet extends ChatState {}

// class ChatLoaded extends ChatState {}
