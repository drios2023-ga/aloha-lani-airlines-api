const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const benefitplanlevelselected = connection.define('benefitplanlevelselected', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        benefit_plan_level_id : {
            type: DataTypes.INTEGER,
            field: 'benefit_plan_level_id'
        },
        employee_enrollment_id: {
            type: DataTypes.INTEGER,
            field: 'employee_enrollment_id'
        },
        datetime_selected: {
            type: DataTypes.TIME,
            field: 'datetime_selected'
        }

    }, {tableName: 'benefit_plan_level_selected', timestamps: false});

    return benefitplanlevelselected;

}