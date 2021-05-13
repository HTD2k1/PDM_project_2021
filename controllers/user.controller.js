const db = require('../models/model.database.js');


exports.searchSymptom = (req, res) => {
    // Taking in input symptoms
    const inputSymptoms = req.body.symptoms.split(",").map((value) => {
        return value.trim();
    });
    var symptomCount = inputSymptoms.length;

    // Input symptom processing to get variable Condition
    var firstSymptom = inputSymptoms.shift();
    var condition = `("${firstSymptom}"`;
    for (symptom of inputSymptoms) {
        condition += `, "${symptom}"`
    }
    condition += `)`;

    // Start querying for disease with most matches with the condition
    db.query(`SELECT d.diseaseID, d.diseaseName, d.diseaseDesc
            FROM disease d
            INNER JOIN symptom_disease sd
            ON d.diseaseID = sd.diseaseID
            INNER JOIN symptoms s
            ON sd.symptomID = s.symptomID
            WHERE s.symptomName IN ${condition}
            GROUP BY d.diseaseID
            HAVING COUNT(DISTINCT s.symptomName) >= ${symptomCount};`, (error, diseaseResults) => {
        if (error) {
            return res.render("./user/userSearch", {
                errorMessage: "Error when looking for diseases with your input. Try again!"
            })
        } else {
            var diseaseArray = Object.values(JSON.parse(JSON.stringify(diseaseResults)));
            for (disease of diseaseArray) {
                db.query(`
                SELECT p.precautionName
                FROM precaution p
                INNER JOIN disease_precaution dp
                ON p.precautionID = dp.precautionID
                INNER JOIN disease d
                ON d.diseaseID = dp.diseaseID
                WHERE d.diseaseName LIKE "${disease.diseaseName}";`, (error, precautionResults) => {
                    
                });
            };
            return res.render("./user/userSearch", {
                disease: diseaseResults
            })
        }
    })
}

exports.searchDoctor = (req, res) => {

}
