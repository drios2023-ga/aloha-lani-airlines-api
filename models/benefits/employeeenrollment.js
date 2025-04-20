const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeeenrollment = connection.define('employeeenrollment', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        enrollment_period_id : {
            type: DataTypes.INTEGER,
            field: 'enrollment_period_id'
        },
        employee_id: {
            type: DataTypes.INTEGER,
            field: 'employee_id'
        }, 
        employee_enrollment_type_id : {
            type: DataTypes.INTEGER,
            field: 'employee_enrollment_type_id'
        }, 
        confirmation_number :{
            type: DataTypes.STRING,
            field: 'confirmation_number'
        },
        datetime_created: {
            type: DataTypes.TIME,
            field: 'datetime_created'
        }

    }, {tableName: 'employee_enrollment', timestamps: false});

    return employeeenrollment;

}