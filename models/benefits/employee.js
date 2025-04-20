const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employee = connection.define('employee', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        employee_position_id : {
            type: DataTypes.INTEGER,
            field: 'employee_position_id'
        },
        employee_status_id: {
            type: DataTypes.INTEGER,
            field: 'employee_status_id'
        }, 
        employee_relationship_status_id : {
            type: DataTypes.INTEGER,
            field: 'employee_relationship_status_id'
        }, 
        employee_number :{
            type: DataTypes.STRING,
            field: 'employee_number'
        },
        first_name: {
            type: DataTypes.STRING,
            field: 'first_name'
        },
        middle_name: {
            type: DataTypes.STRING,
            field: 'middle_name'
        },
        last_name : {
            type: DataTypes.STRING,
            field: 'last_name'
        },
        employee_dob: {
            type: DataTypes.DATE,
            field: 'employee_dob'
        },
        employee_start_date :{
            type: DataTypes.DATE,
            field: 'employee_start_date'
        },
        employee_term_date: {
            type: DataTypes.DATE,
            field: 'employee_term_date'
        },
        description: {
            type: DataTypes.STRING,
            field: 'description'
        },
        file_name: {
            type: DataTypes.STRING,
            field: 'file_name'
        }

    }, {tableName: 'employee', timestamps: false});

    return employee;

}