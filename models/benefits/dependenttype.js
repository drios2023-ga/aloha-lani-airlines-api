const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const dependenttype = connection.define('dependenttype', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        employee_dept :{
            type: DataTypes.STRING,
            field: 'dependent_type'
        }

    }, {tableName: 'dependent_type', timestamps: false});

    return dependenttype;

}