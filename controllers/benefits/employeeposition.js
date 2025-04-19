const { sequelize, DataTypes } = require('sequelize');
const employeeposition = require('../../models/benefits/employeeposition')(sequelize, DataTypes);

const index = (req, res) => {

    employeeposition.findAll({

    }).then((result)=>{

        console.log('success');
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