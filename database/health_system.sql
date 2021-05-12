CREATE DATABASE  IF NOT EXISTS `health_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `health_system`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: health_system
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `userID` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `FKACC_userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'NA','na'),(2,'phna','0220'),(3,'t1','t1');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `diseaseID` int NOT NULL,
  `diseaseName` varchar(50) NOT NULL,
  `diseaseDesc` varchar(500) NOT NULL,
  PRIMARY KEY (`diseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'Drug Reaction','An adverse drug reaction (ADR) is an injury caused by taking medication. ADRs may occur following a single dose or prolonged administration of a drug or result from the combination of two or more drugs.'),(2,'Malaria','An infectious disease caused by protozoan parasites from the Plasmodium family that can be transmitted by the bite of the Anopheles mosquito or by a contaminated needle or transfusion. Falciparum malaria is the most deadly type.'),(3,'Allergy','An allergy is an immune system response to a foreign substance that is not typically harmful to your body.They can include certain foods, pollen, or pet dander. Your immune system job is to keep you healthy by fighting harmful pathogens.'),(4,'Hypothyroidism','Hypothyroidism, also called underactive thyroid or low thyroid, is a disorder of the endocrine system in which the thyroid gland does not produce enough thyroid hormone.'),(5,'Psoriasis','Psoriasis is a common skin disorder that forms thick, red, bumpy patches covered with silvery scales. They can pop up anywhere, but most appear on the scalp, elbows, knees, and lower back. Psoriasis cant be passed from person to person. It does sometimes happen in members of the same family.'),(6,'GERD','Gastroesophageal reflux disease, or GERD, is a digestive disorder that affects the lower esophageal sphincter (LES), the ring of muscle between the esophagus and stomach. Many people, including pregnant women, suffer from heartburn or acid indigestion caused by GERD.'),(7,'Chronic cholestasis','Chronic cholestatic diseases, whether occurring in infancy, childhood or adulthood, are characterized by defective bile acid transport from the liver to the intestine, which is caused by primary damage to the biliary epithelium in most cases'),(8,'hepatitis A','Hepatitis A is a highly contagious liver infection caused by the hepatitis A virus. The virus is one of several types of hepatitis viruses that cause inflammation and affect your livers ability to function.'),(9,'Osteoarthristis','Osteoarthritis is the most common form of arthritis, affecting millions of people worldwide. It occurs when the protective cartilage that cushions the ends of your bones wears down over time.'),(10,'(vertigo) Paroymsal  Positional Vertigo','Benign paroxysmal positional vertigo (BPPV) is one of the most common causes of vertigo â€” the sudden sensation that youre spinning or that the inside of your head is spinning. Benign paroxysmal positional vertigo causes brief episodes of mild to intense dizziness.'),(11,'Hypoglycemia',' Hypoglycemia is a condition in which your blood sugar (glucose) level is lower than normal. Glucose is your bodys main energy source. Hypoglycemia is often related to diabetes treatment. But other drugs and a variety of conditions â€” many rare â€” can cause low blood sugar in people who dont have diabetes.'),(12,'Acne','Acne vulgaris is the formation of comedones, papules, pustules, nodules, and/or cysts as a result of obstruction and inflammation of pilosebaceous units (hair follicles and their accompanying sebaceous gland). Acne develops on the face and upper trunk. It most often affects adolescents.'),(13,'Diabetes','Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy.'),(14,'Impetigo','Impetigo (im-puh-TIE-go) is a common and highly contagious skin infection that mainly affects infants and children. Impetigo usually appears as red sores on the face, especially around a childs nose and mouth, and on hands and feet. The sores burst and develop honey-colored crusts.'),(15,'Hypertension','Hypertension (HTN or HT), also known as high blood pressure (HBP), is a long-term medical condition in which the blood pressure in the arteries is persistently elevated. High blood pressure typically does not cause symptoms.'),(16,'Peptic ulcer diseae','Peptic ulcer disease (PUD) is a break in the inner lining of the stomach, the first part of the small intestine, or sometimes the lower esophagus. An ulcer in the stomach is called a gastric ulcer, while one in the first part of the intestines is a duodenal ulcer.'),(17,'Dimorphic hemorrhoids(piles)','Hemorrhoids, also spelled haemorrhoids, are vascular structures in the anal canal. In their ... Other names, Haemorrhoids, piles, hemorrhoidal disease .'),(18,'Common Cold','The common cold is a viral infection of your nose and throat (upper respiratory tract). It is usually harmless, although it might not feel that way. Many types of viruses can cause a common cold.'),(19,'Chicken pox','Chickenpox is a highly contagious disease caused by the varicella-zoster virus (VZV). It can cause an itchy, blister-like rash. The rash first appears on the chest, back, and face, and then spreads over the entire body, causing between 250 and 500 itchy blisters.'),(20,'Cervical spondylosis','Cervical spondylosis is a general term for age-related wear and tear affecting the spinal disks in your neck. As the disks dehydrate and shrink, signs of osteoarthritis develop, including bony projections along the edges of bones (bone spurs).'),(21,'Hyperthyroidism','Hyperthyroidism (overactive thyroid) occurs when your thyroid gland produces too much of the hormone thyroxine. Hyperthyroidism can accelerate your body metabolism, causing unintentional weight loss and a rapid or irregular heartbeat.'),(22,'Urinary tract infection','Urinary tract infection: An infection of the kidney, ureter, bladder, or urethra. Abbreviated UTI. Not everyone with a UTI has symptoms, but common symptoms include a frequent urge to urinate and pain or burning when urinating.'),(23,'Varicose veins','A vein that has enlarged and twisted, often appearing as a bulging, blue blood vessel that is clearly visible through the skin. Varicose veins are most common in older adults, particularly women, and occur especially on the legs.'),(24,'AIDS','Acquired immunodeficiency syndrome (AIDS) is a chronic, potentially life-threatening condition caused by the human immunodeficiency virus (HIV). By damaging your immune system, HIV interferes with your body ability to fight infection and disease.'),(25,'Paralysis (brain hemorrhage)','Intracerebral hemorrhage (ICH) is when blood suddenly bursts into brain tissue, causing damage to your brain. Symptoms usually appear suddenly during ICH. They include headache, weakness, confusion, and paralysis, particularly on one side of your body.'),(26,'Typhoid','An acute illness characterized by fever caused by infection with the bacterium Salmonella typhi. Typhoid fever has an insidious onset, with fever, headache, constipation, malaise, chills, and muscle pain. Diarrhea is uncommon, and vomiting is not usually severe.'),(27,'Hepatitis B','Hepatitis B is an infection of your liver. It can cause scarring of the organ, liver failure, and cancer. It can be fatal if it is not treated. It is spread when people come in contact with the blood, open sores, or body fluids of someone who has the hepatitis B virus.'),(28,'Fungal infection','In humans, fungal infections occur when an invading fungus takes over an area of the body and is too much for the immune system to handle. Fungi can live in the air, soil, water, and plants. There are also some fungi that live naturally in the human body. Like many microbes, there are helpful fungi and harmful fungi.'),(29,'Hepatitis C','Inflammation of the liver due to the hepatitis C virus (HCV), which is usually spread via blood transfusion (rare), hemodialysis, and needle sticks. The damage hepatitis C does to the liver can lead to cirrhosis and its complications as well as cancer.'),(30,'Migraine','A migraine can cause severe throbbing pain or a pulsing sensation, usually on one side of the head. It is often accompanied by nausea, vomiting, and extreme sensitivity to light and sound. Migraine attacks can last for hours to days, and the pain can be so severe that it interferes with your daily activities.'),(31,'Bronchial Asthma','Bronchial asthma is a medical condition which causes the airway path of the lungs to swell and narrow. Due to this swelling, the air path produces excess mucus making it hard to breathe, which results in coughing, short breath, and wheezing. The disease is chronic and interferes with daily working.'),(32,'Alcoholic hepatitis','Alcoholic hepatitis is a diseased, inflammatory condition of the liver caused by heavy alcohol consumption over an extended period of time. It is also aggravated by binge drinking and ongoing alcohol use. If you develop this condition, you must stop drinking alcohol'),(33,'Jaundice','Yellow staining of the skin and sclerae (the whites of the eyes) by abnormally high blood levels of the bile pigment bilirubin. The yellowing extends to other tissues and body fluids. Jaundice was once called the \"morbus regius\" (the regal disease) in the belief that only the touch of a king could cure it'),(34,'Hepatitis E','A rare form of liver inflammation caused by infection with the hepatitis E virus (HEV). It is transmitted via food or drink handled by an infected person or through infected water supplies in areas where fecal matter may get into the water. Hepatitis E does not cause chronic liver disease.'),(35,'Dengue','an acute infectious disease caused by a flavivirus (species Dengue virus of the genus Flavivirus), transmitted by aedes mosquitoes, and characterized by headache, severe joint pain, and a rash. â€” called also breakbone fever, dengue fever.'),(36,'Hepatitis D','Hepatitis D, also known as the hepatitis delta virus, is an infection that causes the liver to become inflamed. This swelling can impair liver function and cause long-term liver problems, including liver scarring and cancer. The condition is caused by the hepatitis D virus (HDV).'),(37,'Heart attack','The death of heart muscle due to the loss of blood supply. The loss of blood supply is usually caused by a complete blockage of a coronary artery, one of the arteries that supplies blood to the heart muscle.'),(38,'Pneumonia','Pneumonia is an infection in one or both lungs. Bacteria, viruses, and fungi cause it. The infection causes inflammation in the air sacs in your lungs, which are called alveoli. The alveoli fill with fluid or pus, making it difficult to breathe.'),(39,'Arthritis','Arthritis is the swelling and tenderness of one or more of your joints. The main symptoms of arthritis are joint pain and stiffness, which typically worsen with age. The most common types of arthritis are osteoarthritis and rheumatoid arthritis.'),(40,'Gastroenteritis','Gastroenteritis is an inflammation of the digestive tract, particularly the stomach, and large and small intestines. Viral and bacterial gastroenteritis are intestinal infections associated with symptoms of diarrhea , abdominal cramps, nausea , and vomiting .'),(41,'Tuberculosis','Tuberculosis (TB) is an infectious disease usually caused by Mycobacterium tuberculosis (MTB) bacteria. Tuberculosis generally affects the lungs, but can also affect other parts of the body. Most infections show no symptoms, in which case it is known as latent tuberculosis.');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_precaution`
--

DROP TABLE IF EXISTS `disease_precaution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_precaution` (
  `ID` int NOT NULL,
  `diseaseID` int NOT NULL,
  `precautionID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `diseaseID_idx` (`diseaseID`,`precautionID`),
  KEY `precautionID_idx` (`precautionID`),
  CONSTRAINT `FKDP_diseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`diseaseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKDP_precautionID` FOREIGN KEY (`precautionID`) REFERENCES `precaution` (`precautionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_precaution`
--

LOCK TABLES `disease_precaution` WRITE;
/*!40000 ALTER TABLE `disease_precaution` DISABLE KEYS */;
INSERT INTO `disease_precaution` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,2),(6,2,5),(7,2,6),(8,2,7),(9,3,8),(10,3,9),(11,3,10),(12,4,11),(13,4,12),(14,4,13),(15,4,14),(16,5,15),(17,5,16),(18,5,17),(19,5,18),(23,6,12),(20,6,19),(21,6,20),(22,6,21),(27,7,13),(26,7,17),(24,7,22),(25,7,23),(28,8,2),(30,8,19),(29,8,24),(31,8,25),(33,9,2),(34,9,4),(35,9,18),(32,9,26),(36,10,27),(37,10,28),(38,10,29),(39,10,30),(43,11,17),(40,11,31),(41,11,32),(42,11,33),(45,12,19),(44,12,34),(46,12,35),(47,12,36),(51,13,4),(49,13,12),(50,13,18),(48,13,37),(55,14,17),(52,14,38),(53,14,39),(54,14,40),(58,15,11),(59,15,14),(57,15,18),(56,15,41),(60,16,19),(61,16,42),(62,16,43),(63,16,44),(64,17,19),(65,17,45),(66,17,46),(67,17,47),(68,18,48),(69,18,49),(70,18,50),(71,18,51),(72,19,52),(73,19,53),(74,19,54),(75,19,55),(77,20,12),(79,20,17),(76,20,56),(78,20,57),(80,21,13),(81,21,58),(82,21,59),(83,21,60),(84,22,35),(85,22,61),(86,22,62),(87,22,63),(88,23,64),(89,23,65),(90,23,66),(91,23,67),(95,24,4),(94,24,17),(92,24,68),(93,24,69),(98,25,12),(97,25,13),(99,25,17),(96,25,58),(102,26,17),(103,26,25),(100,26,70),(101,26,71),(104,27,2),(106,27,13),(107,27,25),(105,27,72),(108,28,34),(109,28,73),(110,28,74),(111,28,75),(112,29,2),(114,29,13),(115,29,25),(113,29,72),(117,30,11),(119,30,17),(116,30,41),(118,30,76),(120,31,77),(121,31,78),(122,31,79),(123,31,80),(127,32,4),(125,32,17),(126,32,25),(124,32,81),(131,33,25),(128,33,35),(129,33,82),(130,33,83),(134,34,17),(135,34,25),(132,34,81),(133,34,84),(137,35,19),(136,35,85),(138,35,86),(139,35,87),(143,36,4),(142,36,13),(140,36,17),(141,36,25),(144,37,88),(145,37,89),(146,37,90),(150,38,4),(147,38,17),(148,38,25),(149,38,84),(151,39,12),(154,39,58),(152,39,91),(153,39,92),(157,40,84),(155,40,93),(156,40,94),(158,40,95),(160,41,17),(161,41,25),(162,41,84),(159,41,96);
/*!40000 ALTER TABLE `disease_precaution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precaution`
--

DROP TABLE IF EXISTS `precaution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precaution` (
  `precautionID` int NOT NULL,
  `precautionName` varchar(50) NOT NULL,
  `precautionDesc` varchar(500) NOT NULL,
  PRIMARY KEY (`precautionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precaution`
--

LOCK TABLES `precaution` WRITE;
/*!40000 ALTER TABLE `precaution` DISABLE KEYS */;
INSERT INTO `precaution` VALUES (1,'stop irritation','None'),(2,'consult nearest hospital','None'),(3,'stop taking drug','None'),(4,'follow up','None'),(5,'avoid oily food','None'),(6,'avoid non veg food','None'),(7,'keep mosquitos out','None'),(8,'apply calamine','None'),(9,'cover area with bandage','None'),(10,'use ice to compress itching','None'),(11,'reduce stress','None'),(12,'exercise','None'),(13,'eat healthy','None'),(14,'get proper sleep','None'),(15,'wash hands with warm soapy water','None'),(16,'stop bleeding using pressure','None'),(17,'consult doctor','None'),(18,'salt baths','None'),(19,'avoid fatty spicy food','None'),(20,'avoid lying down after eating','None'),(21,'maintain healthy weight','None'),(22,'cold baths','None'),(23,'anti itch medicine','None'),(24,'wash hands through','None'),(25,'medication','None'),(26,'acetaminophen','None'),(27,'lie down','None'),(28,'avoid sudden change in body','None'),(29,'avoid abrupt head movment','None'),(30,'relax','None'),(31,'lie down on side','None'),(32,'check in pulse','None'),(33,'drink sugary drinks','None'),(34,'bath twice','None'),(35,'drink plenty of water','None'),(36,'avoid too many products','None'),(37,'have balanced diet','None'),(38,'soak affected area in warm water','None'),(39,'use antibiotics','None'),(40,'remove scabs with wet compressed cloth','None'),(41,'mediation','None'),(42,'consume probiotic food','None'),(43,'eliminate milk','None'),(44,'limit alcohol','None'),(45,'consume witch hazel','None'),(46,'warm bath with epsom salt','None'),(47,'consume alovera juice','None'),(48,'drink vitamin c rich drinks','None'),(49,'take vapour','None'),(50,'avoid cold food','None'),(51,'keep fever in check','None'),(52,'use neem in bathing ','None'),(53,'consume neem leaves','None'),(54,'take vaccine','None'),(55,'avoid public places','None'),(56,'use heating pad or cold pack','None'),(57,'take otc pain reliver','None'),(58,'massage','None'),(59,'use lemon balm','None'),(60,'take radioactive iodine treatment','None'),(61,'increase vitamin c intake','None'),(62,'drink cranberry juice','None'),(63,'take probiotics','None'),(64,'lie down flat and raise the leg high','None'),(65,'use oinments','None'),(66,'use vein compression','None'),(67,'dont stand still for long','None'),(68,'avoid open cuts','None'),(69,'wear ppe if possible','None'),(70,'eat high calorie vegitables','None'),(71,'antiboitic therapy','None'),(72,'vaccination','None'),(73,'use detol or neem in bathing water','None'),(74,'keep infected area dry','None'),(75,'use clean cloths','None'),(76,'use poloroid glasses in sun','None'),(77,'switch to loose cloothing','None'),(78,'take deep breaths','None'),(79,'get away from trigger','None'),(80,'seek help','None'),(81,'stop alcohol consumption','None'),(82,'consume milk thistle','None'),(83,'eat fruits and high fiberous food','None'),(84,'rest','None'),(85,'drink papaya leaf juice','None'),(86,'keep mosquitos away','None'),(87,'keep hydrated','None'),(88,'call ambulance','None'),(89,'chew or swallow asprin','None'),(90,'keep calm','None'),(91,'use hot and cold therapy','None'),(92,'try acupuncture','None'),(93,'stop eating solid food for while','None'),(94,'try taking small sips of water','None'),(95,'ease back into eating','None'),(96,'cover mouth','None');
/*!40000 ALTER TABLE `precaution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom_disease`
--

DROP TABLE IF EXISTS `symptom_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptom_disease` (
  `id` int NOT NULL,
  `symptomID` int NOT NULL,
  `diseaseID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `symptomID_idx` (`symptomID`),
  KEY `symptom_ID_idx` (`symptomID`),
  KEY `disease_ID_idx` (`diseaseID`),
  CONSTRAINT `FKDS_diseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`diseaseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKDS_symptomID` FOREIGN KEY (`symptomID`) REFERENCES `symptoms` (`symptomID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_disease`
--

LOCK TABLES `symptom_disease` WRITE;
/*!40000 ALTER TABLE `symptom_disease` DISABLE KEYS */;
INSERT INTO `symptom_disease` VALUES (1,1,1),(2,2,1),(3,8,1),(4,13,1),(5,14,1),(6,6,2),(7,12,2),(8,26,2),(9,29,2),(10,32,2),(11,35,2),(12,98,2),(13,41,2),(14,4,3),(15,5,3),(16,6,3),(17,104,3),(18,15,4),(19,16,4),(20,18,4),(21,19,4),(22,22,4),(23,65,4),(24,71,4),(25,72,4),(26,73,4),(27,74,4),(28,96,4),(29,97,4),(30,102,4),(31,2,5),(32,7,5),(33,126,5),(34,127,5),(35,128,5),(36,129,5),(37,8,6),(38,9,6),(39,10,6),(40,12,6),(41,25,6),(42,57,6),(43,1,7),(44,12,7),(45,33,7),(46,35,7),(47,36,7),(48,40,7),(49,44,7),(50,7,8),(51,12,8),(52,33,8),(53,34,8),(54,35,8),(55,36,8),(56,40,8),(57,41,8),(58,42,8),(59,44,8),(60,98,8),(61,7,9),(62,64,9),(63,79,9),(64,80,9),(65,83,9),(66,122,9),(67,12,10),(68,32,10),(69,35,10),(70,85,10),(71,86,10),(72,87,10),(73,12,11),(74,15,11),(75,17,11),(76,29,11),(77,32,11),(78,35,11),(79,50,11),(80,75,11),(81,78,11),(82,97,11),(83,121,11),(84,2,12),(85,123,12),(86,124,12),(87,125,12),(88,15,13),(89,20,13),(90,21,13),(91,22,13),(92,24,13),(93,50,13),(94,68,13),(95,75,13),(96,105,13),(97,106,13),(98,2,14),(99,26,14),(100,130,14),(101,131,14),(102,132,14),(103,32,15),(104,57,15),(105,65,15),(106,86,15),(107,110,15),(108,12,16),(109,36,16),(110,40,16),(111,93,16),(112,94,16),(113,22,16),(114,39,17),(115,60,17),(116,61,17),(117,62,17),(118,63,17),(119,4,18),(120,6,18),(121,15,18),(122,25,18),(123,26,18),(124,32,18),(125,48,18),(126,49,18),(127,51,18),(128,52,18),(129,53,18),(130,54,18),(131,55,18),(132,56,18),(133,57,18),(134,89,18),(135,98,18),(136,1,19),(137,2,19),(138,15,19),(139,22,19),(140,26,19),(141,32,19),(142,36,19),(143,42,19),(144,48,19),(145,49,19),(146,100,19),(147,38,20),(148,58,20),(149,64,20),(150,65,20),(151,86,20),(152,15,21),(153,19,21),(154,20,21),(155,21,21),(156,29,21),(157,41,21),(158,59,21),(159,75,21),(160,81,21),(161,97,21),(162,102,21),(163,13,22),(164,90,22),(165,91,22),(166,92,22),(167,15,23),(168,66,23),(169,67,23),(170,68,23),(171,69,23),(172,70,23),(173,120,23),(174,11,24),(175,23,24),(176,26,24),(177,76,24),(178,12,25),(179,32,25),(180,88,25),(181,99,25),(182,6,26),(183,12,26),(184,15,26),(185,26,26),(186,35,26),(187,39,26),(188,40,26),(189,41,26),(190,95,26),(191,101,26),(192,1,27),(193,15,27),(194,22,27),(195,33,27),(196,34,27),(197,36,27),(198,40,27),(199,43,27),(200,44,27),(201,49,27),(202,112,27),(203,113,27),(204,1,28),(205,2,28),(206,3,28),(207,103,28),(208,15,29),(209,33,29),(210,35,29),(211,36,29),(212,107,29),(213,44,29),(214,9,30),(215,22,30),(216,32,30),(217,50,30),(218,75,30),(219,82,30),(220,96,30),(221,97,30),(222,111,30),(223,97,30),(224,15,31),(225,25,31),(226,26,31),(227,28,31),(228,107,31),(229,108,31),(230,12,32),(231,33,32),(232,40,32),(233,47,32),(234,116,32),(235,117,32),(236,46,32),(237,1,33),(238,12,33),(239,15,33),(240,20,33),(241,26,33),(242,33,33),(243,34,33),(244,40,33),(245,7,34),(246,12,34),(247,15,34),(248,26,34),(249,33,34),(250,34,34),(251,35,34),(252,36,34),(253,40,34),(254,44,34),(255,114,34),(256,115,34),(257,2,35),(258,6,35),(259,7,35),(260,12,35),(261,15,35),(262,26,35),(263,32,35),(264,35,35),(265,36,35),(266,37,35),(267,38,35),(268,98,35),(269,100,35),(270,7,36),(271,12,36),(272,15,36),(273,33,36),(274,34,36),(275,35,36),(276,36,36),(277,40,36),(278,44,36),(279,12,37),(280,28,37),(281,29,37),(282,57,37),(283,6,38),(284,15,38),(285,25,38),(286,26,38),(287,28,38),(288,29,38),(289,49,38),(290,57,38),(291,59,38),(292,109,38),(293,51,38),(294,81,39),(295,82,39),(296,83,39),(297,84,39),(298,122,39),(299,12,40),(300,27,40),(301,30,40),(302,41,40),(303,6,41),(304,12,41),(305,15,41),(306,20,41),(307,25,41),(308,26,41),(309,28,41),(310,29,41),(311,36,41),(312,42,41),(313,44,41),(314,48,41),(315,49,41),(316,51,41),(317,57,41),(318,119,41);
/*!40000 ALTER TABLE `symptom_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptoms` (
  `symptomID` int NOT NULL,
  `symptomName` varchar(50) NOT NULL,
  `symptomDesc` varchar(500) NOT NULL,
  PRIMARY KEY (`symptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
INSERT INTO `symptoms` VALUES (1,'itching',''),(2,'skin_rash','.'),(3,'nodal_skin_eruptions','.'),(4,'continuous_sneezing','.'),(5,'shivering','.'),(6,'chills','.'),(7,'joint_pain','.'),(8,'stomach_pain','.'),(9,'acidity','.'),(10,'ulcers_on_tongue','.'),(11,'muscle_wasting','.'),(12,'vomiting','.'),(13,'burning_micturition','.'),(14,'spotting_urination','.'),(15,'fatigue','.'),(16,'weight_gain','.'),(17,'anxiety','.'),(18,'cold_hands_and_feets','.'),(19,'mood_swings','.'),(20,'weight_loss','.'),(21,'restlessness','.'),(22,'lethargy','.'),(23,'patches_in_throat','.'),(24,'irregular_sugar_level','.'),(25,'cough','.'),(26,'high_fever','.'),(27,'sunken_eyes','.'),(28,'breathlessness','.'),(29,'sweating','.'),(30,'dehydration','.'),(31,'indigestion','.'),(32,'headache','.'),(33,'yellowish_skin','.'),(34,'dark_urine','.'),(35,'nausea','.'),(36,'loss_of_appetite','.'),(37,'pain_behind_the_eyes','.'),(38,'back_pain','.'),(39,'constipation','.'),(40,'abdominal_pain','.'),(41,'diarrhoea','.'),(42,'mild_fever','.'),(43,'yellow_urine','.'),(44,'yellowing_of_eyes','.'),(45,'acute_liver_failure','.'),(46,'fluid_overload','.'),(47,'swelling_of_stomach','.'),(48,'swelled_lymph_nodes','.'),(49,'malaise','.'),(50,'blurred_and_distorted_vision','.'),(51,'phlegm','.'),(52,'throat_irritation','.'),(53,'redness_of_eyes','.'),(54,'sinus_pressure','.'),(55,'runny_nose','.'),(56,'congestion','.'),(57,'chest_pain','.'),(58,'weakness_in_limbs','.'),(59,'fast_heart_rate','.'),(60,'pain_during_bowel_movements','.'),(61,'pain_in_anal_region','.'),(62,'bloody_stool','.'),(63,'irritation_in_anus','.'),(64,'neck_pain','.'),(65,'dizziness','.'),(66,'cramps','.'),(67,'bruising','.'),(68,'obesity','.'),(69,'swollen_legs','.'),(70,'swollen_blood_vessels','.'),(71,'puffy_face_and_eyes','.'),(72,'enlarged_thyroid','.'),(73,'brittle_nails','.'),(74,'swollen_extremeties','.'),(75,'excessive_hunger','.'),(76,'extra_marital_contacts','.'),(77,'drying_and_tingling_lips','.'),(78,'slurred_speech','.'),(79,'knee_pain','.'),(80,'hip_joint_pain','.'),(81,'muscle_weakness','.'),(82,'stiff_neck','.'),(83,'swelling_joints','.'),(84,'movement_stiffness','.'),(85,'spinning_movements','.'),(86,'loss_of_balance','.'),(87,'unsteadiness','.'),(88,'weakness_of_one_body_side','.'),(89,'loss_of_smell','.'),(90,'bladder_discomfort','.'),(91,'foul_smell_ofurine','.'),(92,'continuous_feel_of_urine','.'),(93,'passage_of_gases','.'),(94,'internal_itching','.'),(95,'toxic_look_(typhos)','.'),(96,'depression','.'),(97,'irritability','.'),(98,'muscle_pain','.'),(99,'altered_sensorium','.'),(100,'red_spots_over_body','.'),(101,'belly_pain','.'),(102,'abnormal_menstruation','.'),(103,'dischromic_patches','.'),(104,'watering_from_eyes','.'),(105,'increased_appetite','.'),(106,'polyuria','.'),(107,'family_history','.'),(108,'mucoid_sputum','.'),(109,'rusty_sputum','.'),(110,'lack_of_concentration','.'),(111,'visual_disturbances','.'),(112,'receiving_blood_transfusion','.'),(113,'receiving_unsterile_injections','.'),(114,'coma','.'),(115,'stomach_bleeding','.'),(116,'distention_of_abdomen','.'),(117,'history_of_alcohol_consumption','.'),(118,'fluid_overload','.'),(119,'blood_in_sputum','.'),(120,'prominent_veins_on_calf','.'),(121,'palpitations','.'),(122,'painful_walking','.'),(123,'pus_filled_pimples','.'),(124,'blackheads','.'),(125,'scurring','.'),(126,'skin_peeling','.'),(127,'silver_like_dusting','.'),(128,'small_dents_in_nails','.'),(129,'inflammatory_nails','.'),(130,'blister','.'),(131,'red_sore_around_nose','.'),(132,'yellow_crust_ooze','.'),(133,'prognosis','.');
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_symptom`
--

DROP TABLE IF EXISTS `user_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_symptom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `symptomID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKUS_userID_idx` (`userID`),
  KEY `FKUS_symptomID_idx` (`symptomID`),
  CONSTRAINT `FKUS_symptomID` FOREIGN KEY (`symptomID`) REFERENCES `symptoms` (`symptomID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKUS_userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_symptom`
--

LOCK TABLES `user_symptom` WRITE;
/*!40000 ALTER TABLE `user_symptom` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nam anh','2000-05-02','phna@gmail.com','0815903939'),(2,'Nam Pham','2000-02-02','phna0220@gmail.com','0815903939'),(3,'Tyler Steinkamp','1999-03-17','tyler1@creator.com','0909680533');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'health_system'
--

--
-- Dumping routines for database 'health_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12 18:10:13
