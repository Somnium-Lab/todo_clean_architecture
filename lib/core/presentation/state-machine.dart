import 'package:flutter/foundation.dart';

abstract class StateMachine<State, Event> {
  late State _state;

  StateMachine(State initailState) {
    this._state = initailState;
  }

  @protected
  State getStateOnEvent(Event event);

  State onEvent(Event event) {
    this._state = getStateOnEvent(event);

    return _state;
  }

  State getCurrentState() {
    return _state;
  }
}
