const Sequelize = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize('enrollments', 'webapp', 'BlueSushi123@', {
      host: 'localhost'
    , dialect: 'postgres'
    , port: 5432
    , pool: {
        max:5,
        min:0,
        acquire: 30000,
        idle: 10000
    }
});

sequelize
  .authenticate()
  .then(() => {
    console.log("Connection has been established successfully.");
  })
  .catch((err) => {
    console.error("Unable to connect to the database:", err);
  });
  
module.exports = sequelize;

