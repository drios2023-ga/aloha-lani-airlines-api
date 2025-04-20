const { sequelize, DataTypes } = require('sequelize');
const lifeeventenrollmentrelationship = require('../../models/benefits/lifeeventenrollmentrelationship')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeeventenrollmentrelationship.findAll({

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