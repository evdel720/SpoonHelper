import React from 'react';
import Header from './header/header.jsx';
const App = ({children}) => (
  <div>
    <Header />
    {children}
    <div className="contact-links">
      <a href="mailto:wkdal720@gmail.com"><img src="https://res.cloudinary.com/wkdal720/image/upload/v1480010543/imageedit_1_8581378638_iucmmv.png"/></a>
      <a href="https://www.linkedin.com/in/jangmi-jo"><img src="https://res.cloudinary.com/wkdal720/image/upload/v1473910851/watercolor/linkedin_lbczye.png"/></a>
      <a href="https://github.com/evdel720"><img src="https://res.cloudinary.com/wkdal720/image/upload/v1473910794/watercolor/github_c54tsu.png"/></a>
      <a href="https://evdel720.github.io/portfolio/"><img src="https://res.cloudinary.com/wkdal720/image/upload/v1473954667/watercolor/imageedit_1_8723619617_gi5qh4.png"/></a>
    </div>
  </div>
);

export default App;
