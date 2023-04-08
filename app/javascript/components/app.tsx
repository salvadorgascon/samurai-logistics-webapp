import React from "react";

import { createHashRouter, RouterProvider, Outlet } from "react-router-dom";

import { ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';

import theme from "./theme";

import Top from "./top";
import Header from "./header";
import Footer from "./footer";
import Bottom from "./bottom";

const router = createHashRouter([
  {
    path: "/",
    element: (
      <ThemeProvider theme={theme}>
        <CssBaseline />
        <Top/>
        <Header />              
        <Outlet />    
        <Footer />
        <Bottom/>        
      </ThemeProvider>),
    children: [
      {
        path: "/",
        element: <React.Fragment>Hello</React.Fragment>,
      },
      {
        path: "test",
        element: <React.Fragment>Test</React.Fragment>,
      },
    ],
  },  
]);

export default function App() {
  return (<RouterProvider router={router} />);
}
