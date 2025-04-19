const { sequelize, DataTypes } = require('sequelize');
const employeestatus = require('../../models/benefits/employeestatus')(sequelize, DataTypes);

const index = (req, res) => {

    employeestatus.findAll({

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