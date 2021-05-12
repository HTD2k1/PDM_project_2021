const db = require('../models/model.database.js');

exports.searchSymptom = (req, res) => {
    const inputSymptoms = req.body.symptoms.split(",").map((value) => {
        return value.trim();
    });
    var firstSymptom = inputSymptoms.shift();
    var condition = `("${firstSymptom}"`;
    for (symptom of inputSymptoms) {
        condition += `, "${symptom}"`
    }
    condition += `)`;
    console.log(condition);
    db.query(`SELECT DISTINCT d.diseaseID, d.diseaseName, d.diseaseDesc, s.symptomName
            FROM disease d, symptom_disease sd, symptoms s
            WHERE d.diseaseID = sd.diseaseID AND sd.symptomID = s.symptomID 
            AND s.symptomName IN ${condition}`, (error, results) => {

        if (error) {
            return res.render("./user/userSearch", {
                errorMessage: "Error when looking for diseases with your input. Try again!"
            })
        } else {
            console.log(results);
            return res.render("./user/userSearch", {
                disease: results
            })
        }
    })
}

exports.searchDoctor = (req, res) => {

}
