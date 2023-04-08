import React from "react";

import { ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';


import theme from "./theme";

import Top from "./top";
import Header from "./header";
import Footer from "./footer";
import Bottom from "./bottom";

export default function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Top/>
      <Header />
      <Footer />
      <Bottom/>    
    </ThemeProvider>
  );
}
