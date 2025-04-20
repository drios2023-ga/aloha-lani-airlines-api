const { sequelize, DataTypes } = require('sequelize');
const lifeeventtype = require('../../models/benefits/lifeeventtype')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeeventtype.findAll({

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