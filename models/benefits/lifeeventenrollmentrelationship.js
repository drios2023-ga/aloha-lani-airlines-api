const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const lifeeventenrollmentrelationship = connection.define('lifeeventenrollmentrelationship', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        life_event_enrollment_relationship : {
            type: DataTypes.STRING,
            field: 'life_event_enrollment_relationship'
        }

    }, {tableName: 'life_event_enrollment_relationship', timestamps: false});

    return lifeeventenrollmentrelationship;

}