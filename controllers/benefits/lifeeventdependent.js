const { sequelize, DataTypes } = require('sequelize');
const lifeeventdependent = require('../../models/benefits/lifeeventdependent')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeeventdependent.findAll({

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