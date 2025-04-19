const { sequelize, DataTypes } = require('sequelize');
const employeeenrollmenttype = require('../../models/benefits/employeeenrollmenttype')(sequelize, DataTypes);

const index = (req, res) => {
 
    employeeenrollmenttype.findAll({

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