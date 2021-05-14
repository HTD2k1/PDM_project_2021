const db = require('../models/model.database.js');

// Functions to query matching precautions
function queryPrecautions(disease) {
    return new Promise((resolve, reject) => {
        db.query(`
        SELECT p.precautionName
        FROM precaution p
        INNER JOIN disease_precaution dp
        ON p.precautionID = dp.precautionID
        INNER JOIN disease d
        ON d.diseaseID = dp.diseaseID
        WHERE d.diseaseName LIKE "${disease.diseaseName}";`, async (error, precautionResults) => {
            if (error)
                reject(error)
            else
                resolve(precautionResults);
        })
    })
}
function extractPrecautions(precautions) {
    var precautionList = []
    for (p of precautions)
        precautionList.push(p.precautionName);
    var precautionObject = {
        precautions: precautionList.join(", ").toString()
    };
    return precautionObject;
}

// Functions to query matching doctors
function queryDoctors(disease) {
    return new Promise((resolve, reject) => {
        db.query(`
        SELECT doc.fullname, doc.doctorID, doc.email, doc.phone
        FROM doctors doc
        INNER JOIN disease_doctor dd
        ON doc.doctorID = dd.doctorID
        INNER JOIN disease d
        ON d.diseaseID = dd.diseaseID
        WHERE d.diseaseName LIKE "${disease.diseaseName}";`, async (error, res) => {
            if (error)
                reject(error)
            else
                resolve(res);
        })
    })
}
function extractDoctors(doctors) {
    var doctorList = [];
    for (doc of doctors) {
        var doctor = {
            doctorID: doc.doctorID,
            fullname: doc.fullname,
            email: doc.email,
            phone: doc.phone
        }
        doctorList.push(doctor);
    }
    var doctorObject = {
        doctors: doctorList
    }
    return doctorObject;
}


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
    db.query(`SELECT DISTINCT d.diseaseID, d.diseaseName, d.diseaseDesc
            FROM disease d
            INNER JOIN symptom_disease sd
            ON d.diseaseID = sd.diseaseID
            INNER JOIN symptoms s
            ON sd.symptomID = s.symptomID
            WHERE s.symptomName IN ${condition}
            GROUP BY d.diseaseID
            HAVING COUNT(DISTINCT s.symptomName) >= ${symptomCount};`, async (error, diseaseResults) => {
        if (error) {
            return res.render("./user/userSearch", {
                errorMessage: "Error when looking for diseases with your input. Try again!"
            })
        } else {
            // Query for precautions that come with the result diseases
            var diseaseArray = Object.values(JSON.parse(JSON.stringify(diseaseResults)));
            for (disease of diseaseArray) {
                // Query and extract precautions info
                var precautionResults = await queryPrecautions(disease);
                var precautions = extractPrecautions(precautionResults);
                // Query and extract doctors info
                var doctorResults = await queryDoctors(disease);
                var doctors = extractDoctors(doctorResults);
                // Update a disease to contain all info
                Object.assign(disease, precautions);
                Object.assign(disease, doctors);
            };
            // Return
            return res.render("./user/userSearch", {
                disease: diseaseArray
            })
        }
    })
}
