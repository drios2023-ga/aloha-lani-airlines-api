const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeeenrollmenttype = connection.define('employeeenrollmenttype', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_enrollment_type: {
            type: DataTypes.STRING,
            field: 'employee_enrollment_type'
        }

    }, {tableName: 'employee_enrollment_type', timestamps: false});

    return employeeenrollmenttype;

}