const { sequelize, DataTypes } = require('sequelize');
const employee = require('../../models/benefits/employee')(sequelize, DataTypes);

const index = (req, res) => {
 
    employee.findAll({

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