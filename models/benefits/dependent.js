const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const dependent = connection.define('dependent', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_id : {
            type: DataTypes.INTEGER,
            field: 'employee_id'
        }, 
        dependent_type_id : {
            type: DataTypes.INTEGER,
            field: 'dependent_type_id'
        },
        dependent_status_id: {
            type: DataTypes.INTEGER,
            field: 'dependent_status_id'
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
        dependent_dob: {
            type: DataTypes.DATE,
            field: 'dependent_dob'
        },
        dependent_active_date :{
            type: DataTypes.DATE,
            field: 'dependent_active_date'
        },
        dependent_inactive_date: {
            type: DataTypes.DATE,
            field: 'dependent_inactive_date'
        }

    }, {tableName: 'dependent', timestamps: false});

    return dependent;

}