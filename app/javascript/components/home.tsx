import React from "react";
import { Link } from "react-router-dom";

import Typography from '@mui/material/Typography';

import Container from '@mui/material/Container';
import Grid from '@mui/material/Grid';
import Stack from '@mui/material/Stack';

import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';

import Button from '@mui/material/Button';

import AddIcon from '@mui/icons-material/Add';
import WindowIcon from '@mui/icons-material/Window';

export default function Home() {
  return (
    <Container>
      <Grid container spacing={2}>
        <Grid item md={12}>   
          <Card>
            <CardHeader title="Welcome to Samurai Logistics"/> 
            <CardContent>              
            </CardContent>            
          </Card>         
        </Grid>        
     </Grid>

      <Grid container spacing={2} className="mt-4">
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Tasks"/> 
            <CardContent>
              
            </CardContent>            
          </Card>         
        </Grid>
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Notifications"/> 
            <CardContent>
              
            </CardContent>            
          </Card>         
        </Grid>
     </Grid>
     <Grid container spacing={2} className="mt-4">
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Latest sales orders"/> 
            <CardContent>
              
            </CardContent>
            <CardActions>
              <Button size="small"><AddIcon/> Add</Button>
              <Button size="small"><WindowIcon/> Sales orders</Button>
            </CardActions>
          </Card>         
        </Grid>
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Latest purchase orders"/> 
            <CardContent>
              
            </CardContent>
            <CardActions>
              <Button size="small"><AddIcon/> Add</Button>
              <Button size="small"><WindowIcon/> Purchase orders</Button>
            </CardActions>
          </Card>         
        </Grid>
     </Grid>
     <Grid container spacing={2} className="mt-4">
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Latest products"/> 
            <CardContent>
              
            </CardContent>
            <CardActions>
              <Button size="small"><AddIcon/> Add</Button>
              <Button size="small"><WindowIcon/> Products</Button>
            </CardActions>
          </Card>         
        </Grid>
        <Grid item md={6}>   
          <Card>
            <CardHeader title="Latest customers"/> 
            <CardContent>
              
            </CardContent>
            <CardActions>
              <Button size="small"><AddIcon/> Add</Button>
              <Button size="small"><WindowIcon/> Customers</Button>
            </CardActions>
          </Card>         
        </Grid>
     </Grid>
    </Container>
  );
}
