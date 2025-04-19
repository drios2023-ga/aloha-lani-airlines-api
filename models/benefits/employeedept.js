const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeedept = connection.define('employeedept', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_dept :{
            type: DataTypes.STRING,
            field: 'employee_dept'
        }

    }, {tableName: 'employee_dept', timestamps: false});

    return employeedept;

}