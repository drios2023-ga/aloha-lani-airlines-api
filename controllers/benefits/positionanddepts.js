const { sequelize, DataTypes } = require('sequelize');
const positionanddepts = require('../../models/benefits/positionanddepts')(sequelize, DataTypes);

const index = (req, res) => {

    positionanddepts.findAll({

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