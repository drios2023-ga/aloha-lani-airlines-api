const { DataTypes } = require('sequelize');
const connection = require('../../config/benefits/database');

module.exports = function(sequelize, DataTypes){

    const benefitplantype = connection.define('benefitplantype', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: false,
            primaryKey:true
        }, 
        benefit_plan_type :{
            type: DataTypes.STRING,
            field: 'benefit_plan_type'
        }

    }, {tableName: 'benefit_plan_type', timestamps: false});

    return benefitplantype;

}