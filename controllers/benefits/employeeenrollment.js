const { sequelize, DataTypes } = require('sequelize');
const employeeenrollment = require('../../models/benefits/employeeenrollment')(sequelize, DataTypes);

const index = (req, res) => {
 
    employeeenrollment.findAll({

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

    employeeenrollment.findByPk(id,{}).then((result)=>{

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

    employeeenrollment.create({

            enrollment_period_id: req.body.enrollment_period_id
          , employee_id: req.body.employee_id
          , employee_enrollment_type_id: req.body.employee_enrollment_type_id
          , confirmation_number: req.body.confirmation_number
          , datetime_created: req.body.datetime_created

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