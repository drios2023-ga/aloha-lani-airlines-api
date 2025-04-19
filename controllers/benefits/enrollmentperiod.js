const { sequelize, DataTypes } = require('sequelize');
const enrollmentperiod = require('../../models/benefits/enrollmentperiod')(sequelize, DataTypes);

const index = (req, res) => {
 
    enrollmentperiod.findAll({

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