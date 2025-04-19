const { sequelize, DataTypes } = require('sequelize');
const benefitplanlevelselected = require('../../models/benefits/benefitplanlevelselected')(sequelize, DataTypes);

const index = (req, res) => {
 
    benefitplanlevelselected.findAll({

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