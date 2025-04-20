const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const enrollmentperiod = connection.define('enrollmentperiod', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        }, 
        enrollment_title :{
            type: DataTypes.STRING,
            field: 'enrollment_title'
        }

    }, {tableName: 'enrollment_period', timestamps: false});

    return enrollmentperiod;

}