const { sequelize, DataTypes } = require('sequelize');
const dependentstatus = require('../../models/benefits/dependentstatus')(sequelize, DataTypes);

const index = (req, res) => {
    
    dependentstatus.findAll({

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