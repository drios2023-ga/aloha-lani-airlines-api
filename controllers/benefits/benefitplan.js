const { sequelize, DataTypes } = require('sequelize');
const benefitplan = require('../../models/benefits/benefitplan')(sequelize, DataTypes);

const index = (req, res) => {
 
    benefitplan.findAll({

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