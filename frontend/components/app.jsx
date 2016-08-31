import React from 'react';
import HeaderContainer from './header/header_container.js';
const App = ({children}) => (
  <div>
    <HeaderContainer />
    {children}
  </div>
);

export default App;
