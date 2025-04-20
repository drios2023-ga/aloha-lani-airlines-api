const { sequelize, DataTypes } = require('sequelize');
const employeerelationshipstatus = require('../../models/benefits/employeerelationshipstatus')(sequelize, DataTypes);

const index = (req, res) => {

    employeerelationshipstatus.findAll({

    }).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

module.exports = {
    index
}