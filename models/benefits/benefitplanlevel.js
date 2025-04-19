const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const benefitplanlevel = connection.define('benefitplanlevel', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        },
        benefit_plan_id : {
            type: DataTypes.INTEGER,
            field: 'benefit_plan_id'
        }, 
        plan_level :{
            type: DataTypes.STRING,
            field: 'plan_level'
        }, 
        plan_level_abbr :{
            type: DataTypes.STRING,
            field: 'plan_level_abbr'
        }, 
        employer_cost :{
            type: DataTypes.DECIMAL,
            field: 'employer_cost'
        }, 
        employeE_cost :{
            type: DataTypes.DECIMAL,
            field: 'employee_cost'
        }, 
        sort_order :{
            type: DataTypes.INTEGER,
            field: 'sort_order'
        }

    }, {tableName: 'benefit_plan_level', timestamps: false});

    return benefitplanlevel;

}