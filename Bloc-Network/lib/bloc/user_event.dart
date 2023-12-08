import 'package:bloc_network/model/user.dart';

abstract class UserEvent {}


class UserLoadEvent extends UserEvent{}
class UserClearEvent extends UserEvent{}

