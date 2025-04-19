const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeeenrollmentlifeevent = connection.define('employeeenrollmentlifeevent', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_enrollment_id : {
            type: DataTypes.INTEGER,
            field: 'employee_enrollment_id'
        },
        life_event_id: {
            type: DataTypes.INTEGER,
            field: 'life_event_id'
        }

    }, {tableName: 'employee_enrollment_life_event', timestamps: false});

    return employeeenrollmentlifeevent;

}