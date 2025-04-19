const { sequelize, DataTypes } = require('sequelize');
const benefitplanlevel = require('../../models/benefits/benefitplanlevel')(sequelize, DataTypes);

const index = (req, res) => {
 
    benefitplanlevel.findAll({

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