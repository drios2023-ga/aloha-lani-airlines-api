const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const lifeeventdependent = connection.define('lifeeventdependent', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        life_event_id : {
            type: DataTypes.INTEGER,
            field: 'life_event_id'
        },
        dependent_id: {
            type: DataTypes.INTEGER,
            field: 'dependent_id'
        }

    }, {tableName: 'life_event_dependent', timestamps: false});

    return lifeeventdependent;

}