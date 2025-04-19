const { sequelize, DataTypes } = require('sequelize');
const employeeenrollmentlifeevent = require('../../models/benefits/employeeenrollmentlifeevent')(sequelize, DataTypes);

const index = (req, res) => {
 
    employeeenrollmentlifeevent.findAll({

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