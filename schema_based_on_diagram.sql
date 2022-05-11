CREATE TABLE IF NOT EXISTS patients (
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(300),
  date_of_birth DATE,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at timestamp,
  patient_id int references patients(id),
  status varchar(300),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int references medical_histories(id),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(500),
    name VARCHAR(500),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int references invoices(id),
    treatment_id int references treatments(id),
    PRIMARY KEY (id)
);

CREATE TABLE medical_documents (
  medical_histories_id INT references medical_histories(id), 
  treatments_id INT references treatments(id)
  );

-- foreign keys indexes

CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX medical_histories_id_asc ON medical_documents(medical_histories_id ASC);
CREATE INDEX treatments_id_asc ON medical_documents(treatments_id ASC);