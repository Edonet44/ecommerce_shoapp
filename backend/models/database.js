// database.js

const { Sequelize } = require('sequelize');

try{
const sequelize = new Sequelize({
  dialect: 'mysql',
  host: '127.0.0.1',
  username: 'root',
  password: '', // Password del tuo database MySQL
  database: 'commercio_shoes',
});

  // Testa la connessione al database
  sequelize.authenticate()
    .then(() => {
      console.log('Connessione al database stabilita con successo.');
    })
    .catch((error) => {
      console.error('Errore nella connessione al database:', error);
    });
} catch (error) {
  console.error('Errore durante la creazione dell\'istanza Sequelize:', error);
}

module.exports = Sequelize;
