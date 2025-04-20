const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const lifeevent = connection.define('lifeevent', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
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
        life_event_date: {
            type: DataTypes.DATE,
            field: 'life_event_date'
        },
        datetime_created: {
            type: DataTypes.TIME,
            field: 'datetime_created'
        }

    }, {tableName: 'life_event', timestamps: false});

    return lifeevent;

}