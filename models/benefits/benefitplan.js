const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const benefitplan = connection.define('benefitplan', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        enrollment_period_id : {
            type: DataTypes.INTEGER,
            field: 'enrollment_period_id'
        },
        benefit_plan_type_id : {
            type: DataTypes.INTEGER,
            field: 'benefit_plan_type_id'
        }, 
        benefit_plan_title :{
            type: DataTypes.STRING,
            field: 'benefit_plan_title'
        }, 
        benefit_plan_description :{
            type: DataTypes.STRING,
            field: 'benefit_plan_description'
        }

    }, {tableName: 'benefit_plan', timestamps: false});

    return benefitplan;

}