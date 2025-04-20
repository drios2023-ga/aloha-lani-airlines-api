const { sequelize, DataTypes } = require('sequelize');
const employeedept = require('../../models/benefits/employeedept')(sequelize, DataTypes);

const index = (req, res) => {

    employeedept.findAll({

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