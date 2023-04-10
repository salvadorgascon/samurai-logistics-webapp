import React from "react";
import { Link } from "react-router-dom";

import Grid from '@mui/material/Unstable_Grid2'; 
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Menu from '@mui/material/Menu';
import MenuItem from '@mui/material/MenuItem';

import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';

export default function Header() {
  return (<header>
    <AppBar position="static" className="mb-5">
    <Toolbar>               
    <IconButton
            size="large"
            edge="start"
            color="inherit"
            aria-label="menu"
            sx={{ mr: 2 }}
          >
            <MenuIcon />
          </IconButton>

      <Button  variant="text" sx={{ color: '#fff' }} component={Link} to={`/`}>Home</Button>
      <Button  variant="text"  sx={{ color: '#fff' }} component={Link} to={`products`}>Products</Button>            
    </Toolbar>
    </AppBar>
  </header>);
}
