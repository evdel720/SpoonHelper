const signUp = (user, success, error) => {
  $.ajax({
    url: '/api/users.json',
    type: 'POST',
    data: user,
    success,
    error
  });
};

const signIn = (user, success, error) => {
  $.ajax({
    url: '/api/session.json',
    type: 'POST',
    data: user,
    success,
    error
  });
};

const signOut = (success) => {
  $.ajax({
    url: '/api/session',
    type: 'DELETE',
    success
  });
};

const guestSignIn = (success) => {
  $.ajax({
    url: '/api/session.json',
    type: 'POST',
    data: {user: {username: 'Guest', password: 'guestpassword'}},
    success
  });
};

export { signIn, signOut, signUp, guestSignIn };
