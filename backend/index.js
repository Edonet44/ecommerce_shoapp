const express = require('express')
const app = express()
const mysql = require('mysql2');
require('dotenv').config();
const port = 3000


//const connection = mysql.createConnection({ host: process.env.HOST,user: process.env.USER,database: process.env.DB,password: process.env.PASSWORD });

// Includi il modello dei prodotti
const Product = require('./models/Products');

app.get('/', async (req, res) => {
  // Esempio di creazione di un nuovo prodotto
  const newProduct = await Product.create({
    name: 'Prodotto di esempio',
    description: 'Una breve descrizione del prodotto.',
    price: 19.99,
  });

  res.json(newProduct);
});

// Connessione al database
// connection.connect((err) => {
//   if (err) {
//     console.error('Errore nella connessione al database:', err);
//     throw err;
//   }
//   console.log('Connesso al database MySQL!');
// });



app.listen(process.env.PORT||port, () => console.log(`Example app listening on port ${process.env.PORT}!`))