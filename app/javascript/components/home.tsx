import React from "react";
import { useState } from 'react';

import { Link } from "react-router-dom";

import { useTranslation } from 'react-i18next';

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

import { DataGrid, GridRowsProp, GridColDef, GridRowParams, GridActionsCellItem } from '@mui/x-data-grid';

import axios from 'axios';

export default function Home() {
  const { t, i18n } = useTranslation();

  const [latestCustomers, setLatestCustomers] = useState([]);
  const [latestProducts, setLatestProducts] = useState([]);

  if (latestCustomers.length == 0){
    axios.get('/web/home/latest_customers').then(function (response) {
      // handle success
      setLatestCustomers(response.data)
    })
    .catch(function (error) {
      // handle error
      console.log(error);
    });
  }  

  if (latestProducts.length == 0){
    axios.get('/web/home/latest_products').then(function (response) {
      // handle success
      setLatestProducts(response.data)
    })
    .catch(function (error) {
      // handle error
      console.log(error);
    });
  }  

  return (
    <Container>
      <Grid container spacing={2}>
        <Grid item md={12}>   
          <Card>
            <CardHeader title={t('welcome')}/> 
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
            <DataGrid autoHeight 
                columns={[
                    { field: 'id', flex: .1 },                    
                    { field: 'uid', flex: .1 },                    
                    { field: 'code', flex: .1 },                    
                    { field: 'name', flex: .5 }
                ]}
                rows={latestProducts}
            />  
              
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
            <DataGrid autoHeight 
                columns={[
                    { field: 'id', flex: .1 },                    
                    { field: 'uid', flex: .1 },                    
                    { field: 'code', flex: .1 },                    
                    { field: 'name', flex: .5 }
                ]}
                rows={latestCustomers}
            />  

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
