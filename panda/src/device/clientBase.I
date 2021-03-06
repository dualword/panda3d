/**
 * PANDA 3D SOFTWARE
 * Copyright (c) Carnegie Mellon University.  All rights reserved.
 *
 * All use of this software is subject to the terms of the revised BSD
 * license.  You should have received a copy of this license along
 * with this source code in a file named "LICENSE."
 *
 * @file clientBase.I
 * @author drose
 * @date 2001-01-25
 */

/**
 * Returns true if the ClientBase has been forked (and, therefore, poll() does
 * not need to be called), false otherwise.
 */
INLINE bool ClientBase::
is_forked() const {
  return _forked;
}

/**
 * Initiates a poll of the client devices, if we are not forked and if we have
 * not already polled this frame.  Returns true if the poll occurred, or false
 * if it did not.
 */
INLINE bool ClientBase::
poll() {
  if (_forked ||
      _last_poll_frame == ClockObject::get_global_clock()->get_frame_count()) {
    return false;
  }

  do_poll();
  return true;
}

/**
 * Returns the time (according to the global ClockObject's get_real_time()
 * method) of the last device poll.
 */
INLINE double ClientBase::
get_last_poll_time() const {
  return _last_poll_time;
}

/**
 * Specifies the coordinate system that all devices associated with this
 * client will operate in.  Normally, this is CS_default.
 */
void ClientBase::
set_coordinate_system(CoordinateSystem cs) {
  _cs = cs;
}

/**
 * Returns the coordinate system that all devices associated with this client
 * will operate in.  Normally, this is CS_default.
 */
INLINE CoordinateSystem ClientBase::
get_coordinate_system() const {
  return _cs;
}
