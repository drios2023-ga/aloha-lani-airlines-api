const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const dependentstatus = connection.define('dependentstatus', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_dept :{
            type: DataTypes.STRING,
            field: 'dependent_status'
        }

    }, {tableName: 'dependent_status', timestamps: false});

    return dependentstatus;

}