// login exception
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exception

class EmailAlreadyUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}
class EmailOrPasswordEmptyAuthException implements Exception {}

// generic exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}

class UserShouldBeSetBeforeReadingAllNotes implements Exception {}
