import React from "react";

import { createHashRouter, RouterProvider, Outlet } from "react-router-dom";

import { ThemeProvider } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';

import theme from "./theme";

import Top from "./top";
import Header from "./header";
import Footer from "./footer";
import Bottom from "./bottom";

import Home from "./home";
import ProductList from "./product-list";
import CustomerList from "./customer-list";

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
        element: <Home/>,
      },
      {
        path: "products",
        element: <ProductList/>
      },
      {
        path: "customers",
        element: <CustomerList/>
      },
    ],
  },  
]);

export default function App() {
  return (<RouterProvider router={router} />);
}
