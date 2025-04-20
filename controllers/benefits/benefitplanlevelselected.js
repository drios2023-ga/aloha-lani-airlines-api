const { sequelize, DataTypes } = require('sequelize');
const benefitplanlevelselected = require('../../models/benefits/benefitplanlevelselected')(sequelize, DataTypes);

const index = (req, res) => {
 
    benefitplanlevelselected.findAll({

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

    benefitplanlevelselected.findByPk(id,{}).then((result)=>{

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

    benefitplanlevelselected.create({

            benefit_plan_level_id: req.body.benefit_plan_level_id
          , employee_enrollment_id: req.body.employee_enrollment_id
          , datetime_selected: req.body.datetime_selected

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