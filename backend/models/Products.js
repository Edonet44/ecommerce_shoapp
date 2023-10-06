// models/Product.js

const { DataTypes } = require('sequelize');
const sequelize = require('../models/database'); // Importa l'istanza Sequelize configurata

const Product = sequelize.define('Product', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
  },
  price: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  // Altri campi del tuo modello
});
sequelize.sync();

module.exports = Product;
