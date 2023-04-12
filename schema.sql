CREATE TABLE patients(
  id            INT GENERATED ALWAYS AS IDENTITY,
  name    		VARCHAR(100),
  date_of_birth         DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
  id              INT GENERATED ALWAYS AS IDENTITY,
  admitted_at     TIMESTAMP,
  patient_id      int,
  status        	VARCHAR(100),

  CONSTRAINT fk_patients
      FOREIGN KEY(patient_id) 
	    REFERENCES patients(id)
      ON DELETE SET NULL, 

  PRIMARY KEY(id)
);

CREATE TABLE treatments(
  id              INT GENERATED ALWAYS AS IDENTITY,
  type          	VARCHAR(100),
  name          	VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE invoices(
  id              INT GENERATED ALWAYS AS IDENTITY,
  total_amount    DECIMAL,
  generated_at     TIMESTAMP,
  payed_at         TIMESTAMP,
  medical_history_id      int,

  CONSTRAINT fk_medical_histories
      FOREIGN KEY(medical_history_id) 
	    REFERENCES medical_histories(id)
      ON DELETE SET NULL, 

  PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
  id              INT GENERATED ALWAYS AS IDENTITY,
  unit_price      DECIMAL,
  quantity        INT,
  total_price         DECIMAL,
  invoice_id      int,
  treatment_id      int,

  CONSTRAINT fk_invoices
      FOREIGN KEY(invoice_id) 
	    REFERENCES invoices(id)
      ON DELETE SET NULL, 

  CONSTRAINT fk_treatments
      FOREIGN KEY(treatment_id) 
	    REFERENCES treatments(id)
      ON DELETE SET NULL,      

  PRIMARY KEY(id)
);

CREATE TABLE treatment_history(
treatment_id     INT,
medical_histories_id     INT,
CONSTRAINT fk_treatment
      FOREIGN KEY(treatment_id) 
	    REFERENCES treatments(id)
      ON DELETE SET NULL,
CONSTRAINT fk_medical_histories
      FOREIGN KEY(medical_histories_id) 
	    REFERENCES medical_histories(id)
      ON DELETE SET NULL
);