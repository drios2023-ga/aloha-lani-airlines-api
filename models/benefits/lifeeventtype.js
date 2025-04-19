const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const lifeeventtype = connection.define('lifeeventtype', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        life_event_type: {
            type: DataTypes.STRING,
            field: 'life_event_type'
        }

    }, {tableName: 'life_event_type', timestamps: false});

    return lifeeventtype;

}