const { sequelize, DataTypes } = require('sequelize');
const benefitplantype = require('../../models/benefits/benefitplantype')(sequelize, DataTypes);

const index = (req, res) => {
 
    benefitplantype.findAll({

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