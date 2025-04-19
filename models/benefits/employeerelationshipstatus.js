const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeerelationshipstatus = connection.define('employeerelationshipstatus', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },      
        employee_relationship_status :{
            type: DataTypes.STRING,
            field: 'employee_relationship_status'
        }

    }, {tableName: 'employee_relationship_status', timestamps: false});

    return employeerelationshipstatus;

}