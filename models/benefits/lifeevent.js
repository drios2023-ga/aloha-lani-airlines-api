const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const lifeevent = connection.define('lifeevent', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_id : {
            type: DataTypes.INTEGER,
            field: 'employee_id'
        },
        life_event_type_id : {
            type: DataTypes.INTEGER,
            field: 'life_event_type_id'
        },
        dependent_id: {
            type: DataTypes.INTEGER,
            field: 'dependent_id'
        },
        timestamp_life_event: {
            type: DataTypes.TIME,
            field: 'timestamp_life_event'
        }

    }, {tableName: 'life_event', timestamps: false});

    return lifeevent;

}