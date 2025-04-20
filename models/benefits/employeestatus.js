const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeestatus = connection.define('employeestatus', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },      
        employee_status :{
            type: DataTypes.STRING,
            field: 'employee_status'
        }

    }, {tableName: 'employee_status', timestamps: false});

    return employeestatus;

}