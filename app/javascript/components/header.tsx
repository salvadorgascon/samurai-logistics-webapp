import React from "react";
import { Link } from "react-router-dom";

import Grid from '@mui/material/Unstable_Grid2'; 
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Menu from '@mui/material/Menu';
import MenuItem from '@mui/material/MenuItem';

import Button from '@mui/material/Button';


export default function Header() {
  return (<header>
    <AppBar position="static">
    <Toolbar>                   
      <Button  variant="text" sx={{ color: '#fff' }} component={Link} to={`/`}>Home</Button>
      <Button  variant="text"  sx={{ color: '#fff' }} component={Link} to={`products`}>Products</Button>            
    </Toolbar>
    </AppBar>
  </header>);
}
