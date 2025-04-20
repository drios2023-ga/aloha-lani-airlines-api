const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const employeeposition = connection.define('employeeposition', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        employee_dept_id : {
            type: DataTypes.INTEGER,
            field: 'employee_dept_id'
        },        
        employee_position :{
            type: DataTypes.STRING,
            field: 'employee_position'
        }

    }, {tableName: 'employee_position', timestamps: false});

    return employeeposition;

}