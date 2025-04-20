const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const positionanddepts = connection.define('positionanddepts', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },        
        employee_position :{
            type: DataTypes.STRING,
            field: 'employee_position'
        },
        employee_dept :{
            type: DataTypes.STRING,
            field: 'employee_dept'
        }

    }, {tableName: 'vw_position_and_depts', timestamps: false});

    return positionanddepts;

}