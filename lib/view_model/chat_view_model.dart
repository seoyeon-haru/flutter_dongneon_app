import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/models/chat_model.dart';
import 'package:project03/models/user_state.dart';
import 'package:project03/repositorys/chat_repository.dart';
import 'package:project03/view_model/user_profile_view_model.dart';
import 'package:uuid/uuid.dart';

// Provider to get the real-time stream of chat messages
final chatStreamProvider = StreamProvider.autoDispose<List<Chat>>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return chatRepository.getChatStream();
});

// ViewModel to handle chat-related actions, like sending a message
class ChatViewModel extends Notifier<void> {
  @override
  void build() {
    // No initial state needed for an action-only notifier
  }

  Future<void> sendMessage(String message) async {
    final chatRepository = ref.read(chatRepositoryProvider);
    // Get the current user's data from the UserProfileViewModel
    final UserState currentUser = ref.read(userProfileViewModelProvider);

    // Prevent sending empty messages
    if (message.trim().isEmpty) {
      return;
    }

    // Create a new Chat object
    final newChat = Chat(
      messageId: const Uuid().v4(),
      senderId: currentUser.senderId,
      sender: currentUser.sender,
      message: message.trim(),
      profileImgUrl: currentUser.profileImgUrl,
      timestamp: DateTime.now(),
    );

    // Use the repository to send the message to Firestore
    await chatRepository.sendMessage(newChat);
  }
}

final chatViewModelProvider = NotifierProvider<ChatViewModel, void>(
  () => ChatViewModel(),
);
