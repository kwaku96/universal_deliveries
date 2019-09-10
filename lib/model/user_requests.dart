import 'package:meta/meta.dart';

class UserRequest{
  final String username;
  final String imagePath;
  final String requestText;
  final String date;
  final bool isPrioritize;

  UserRequest({
    @required this.requestText,
    @required this.username,
    @required this.imagePath,
    @required this.date,
    this.isPrioritize = false
  });
}

List<UserRequest> availableRequests = [
  UserRequest(
    date: '20 Aug',
    imagePath: 'assets/images/man1.jpg',
    username: 'Kingsley',
    requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '19 Aug',
      imagePath: 'assets/images/man2.jpg',
      username: 'Don King',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '18 Aug',
      imagePath: 'assets/images/man3.jpg',
      username: 'Kwaku',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '21 Aug',
      imagePath: 'assets/images/man4.jpg',
      username: 'Abdul Jamal',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '23 Aug',
      imagePath: 'assets/images/man5.jpg',
      username: 'Yaw Asamoah',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '20 Aug',
      imagePath: 'assets/images/woman1.jpg',
      username: 'Janet',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '19 Aug',
      imagePath: 'assets/images/woman2.jpg',
      username: 'Edna',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '18 Aug',
      imagePath: 'assets/images/woman3.jpg',
      username: 'Akua',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '21 Aug',
      imagePath: 'assets/images/woman4.jpg',
      username: 'Sarah',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
  UserRequest(
      date: '23 Aug',
      imagePath: 'assets/images/woman5.jpg',
      username: 'Rita',
      requestText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  ),
];

