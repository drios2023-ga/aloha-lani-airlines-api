const { sequelize, DataTypes } = require('sequelize');
const lifeeventdependent = require('../../models/benefits/lifeeventdependent')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeeventdependent.findAll({

    }).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}


const show = (req, res) => {

    const id = req.params.id;

    lifeeventdependent.findByPk(id,{}).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}


const create = (req, res) => {

    //const id = req.params.id;

    console.log('create');
    console.log(req.body);

    lifeeventdependent.create({

            dependent_id: req.body.dependent_id
          , life_event_id: req.body.life_event_id

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
    index, show, create
}