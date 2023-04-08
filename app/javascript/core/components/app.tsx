import React from "react";
import CssBaseline from '@mui/material/CssBaseline';

import Top from "./top";
import Header from "./header";
import Footer from "./footer";
import Bottom from "./bottom";

export default function App() {
  return (
    <React.Fragment>
      <CssBaseline />
      <Top/>
      <Header />
      <Footer />
      <Bottom/>
    </React.Fragment>
  );
}
