import React from "react";
import { Link } from "react-router-dom";

import Typography from '@mui/material/Typography';

import Container from '@mui/material/Container';
import Grid from '@mui/material/Grid';
import Stack from '@mui/material/Stack';

import Breadcrumbs from '@mui/material/Breadcrumbs';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import { DataGrid, GridRowsProp, GridColDef, GridRowParams, GridActionsCellItem } from '@mui/x-data-grid';

import AddIcon from '@mui/icons-material/Add';

import SearchIcon from '@mui/icons-material/Search';
import ClearIcon from '@mui/icons-material/Clear';
import GetAppIcon from '@mui/icons-material/GetApp';

import DeleteIcon from '@mui/icons-material/Delete';

export default function ProductList() {
  return (
  <Container>
    <Grid container spacing={2}>
        <Grid item md={12}>
            <Breadcrumbs>
                <Link to={`/`}>Home</Link>
                <Typography>Products</Typography>
            </Breadcrumbs>  
        </Grid>
        <Grid item md={12}>
            <Typography variant="h4">Products</Typography>
        </Grid>
        <Grid item md={12}>
            <Stack direction="row" justifyContent="end">
                <Button variant="contained"><AddIcon/> Add</Button>
            </Stack>            
        </Grid>

        <Grid container md={12} className="mt-4 pl-4">
            <Grid item md={6}>
                <TextField fullWidth  label="Code" className="pr-1" />            
            </Grid>
            <Grid item md={6}>
                <TextField fullWidth  label="Barcode"  className="pl-1"/>
            </Grid>                        
        </Grid>
        <Grid item md={12}>
            <TextField fullWidth  label="Name"  className="pr-1"/>
        </Grid>

        <Grid item md={12}>
            <Button variant="contained" className="mr-4"><SearchIcon/> Search</Button>
            <Button variant="contained" className="mr-4"><ClearIcon/> Clear</Button>
            <Button variant="contained"><GetAppIcon/> Export</Button>
        </Grid>
        <Grid item md={12}>
            <DataGrid autoHeight 
                columns={[
                    { field: 'code', flex: .1 },
                    { field: 'barcode', flex: .2 },
                    { field: 'name', flex: .5 }
                ]}
                rows={[
                { id: 1, code:"001", barcdoe: '', name: 'Oracle' },
                { id: 2, code:"002", barcdoe: '', name: 'MySql' },                
                { id: 3, code:"003", barcdoe: '', name: 'PostgreSQL' },                
                { id: 4, code:"004", barcdoe: '', name: 'Sql Server' },                
                ]}
            />   
        </Grid>
    </Grid>
  </Container>
  );
}
